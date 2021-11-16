//
//  LaunchesViewModel.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 14/11/2021.
//

import Combine
import SwiftUI

protocol LaunchesViewModelable: ObservableObject {
    var companyInfoDataSource: String { get }
    var launchesDataSource: [LaunchRowViewModel] { get }
}

class LaunchesViewModel: LaunchesViewModelable {

    // This is clunky, but allows us to use a protocol based VM with combine's publishers
    @Published var companyInfoDataSource: String = "Loading..."
    @Published var launchesDataSource: [LaunchRowViewModel] = []

    private let filterOptionsRepository: FilterOptionsRepositable
    private let spaceXRespoitory: SpaceXRepositable

    private var disposables = Set<AnyCancellable>()

    init(filterOptionsRepository: FilterOptionsRepositable, spaceXRespoitory: SpaceXRepositable) {
        self.filterOptionsRepository = filterOptionsRepository
        self.spaceXRespoitory = spaceXRespoitory

        spaceXRespoitory.allLaunches
            // TODO: Add filtering here
            .zip(spaceXRespoitory.allRockets)
            .map { LaunchRowViewModel.constructListFrom(launchResponse: $0, rocketResponse: $1) }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.launchesDataSource = value
            })
            .store(in: &disposables)
        // TODO: Make a model for the launch row, which accepts a array of rockets and a launch as its inputs
        

        spaceXRespoitory.companyInfo
            .map { companyResponse in
                return "\(companyResponse.name) was founded by \(companyResponse.founder) in \(companyResponse.founder). It has now \(companyResponse.employees) employees, \(companyResponse.launchSites) launch sites, and is valued at USD \(companyResponse.valuation)"
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.companyInfoDataSource = "Error: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.companyInfoDataSource = value
            })
            .store(in: &disposables)
    }


}

struct LaunchRowViewModel: Identifiable {
    let id = UUID()
    let launchPatch: Image?
    let successImage: Image
    let missionName: String
    let dateTime: String
    let rocket: String
    let relativeDaysTitle: String
    let relativeDaysContent: String

    static let mock = LaunchRowViewModel(
        launchPatch: nil,
        successImage: Image("Tick"),
        missionName: "Lift off v1",
        dateTime: "31st October 2021, 2:13PM",
        rocket: "My First Rocket",
        relativeDaysTitle: "Days since launch",
        relativeDaysContent: "-3")

    static func constructListFrom(
        launchResponse: LaunchResponse,
        rocketResponse: RocketResponse
    ) -> [LaunchRowViewModel] {
        return launchResponse.map { launch in
            return LaunchRowViewModel(
                launchPatch: nil,
                successImage: Image("success"),
                missionName: launch.name,
                dateTime: launch.dateLocal.dateAtTimeString,
                rocket: rocketResponse.first{ launch.rocket ?? "" == $0.id }?.name ?? "Unknown",
                relativeDaysTitle: launch.dateLocal.isInPast ? "Days since now" : "Days from now",
                relativeDaysContent: "\(launch.dateLocal.changeInDaysFromNow ?? 0)")
        }
    }
}

// MARK: - Mock ViewModel


class MockLaunchesViewModel: LaunchesViewModelable {

    var companyInfoDataSource: String = "This is some test data that should fill the company section"
    var launchesDataSource: [LaunchRowViewModel] = [
        LaunchRowViewModel.mock,
        LaunchRowViewModel.mock,
        LaunchRowViewModel.mock,
        LaunchRowViewModel.mock,
        LaunchRowViewModel.mock]
}
