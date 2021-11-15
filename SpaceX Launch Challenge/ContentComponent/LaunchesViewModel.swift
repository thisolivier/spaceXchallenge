//
//  LaunchesViewModel.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 14/11/2021.
//

import Combine
import SwiftUI

class LaunchesViewModel: ObservableObject {
    @Published var companyInfoDataSource: String?
    @Published var launchesDataSource: [LaunchRowViewModel] = []

    private let filterOptionsRepository: FilterOptionsRepositable
    private let spaceXRespoitory: SpaceXRepositable

    private var disposables = Set<AnyCancellable>()

    init(filterOptionsRepository: FilterOptionsRepositable, spaceXRespoitory: SpaceXRepositable) {
        self.filterOptionsRepository = filterOptionsRepository
        self.spaceXRespoitory = spaceXRespoitory

        Publishers.Zip(spaceXRespoitory.getAllLaunches(), spaceXRespoitory.getAllRockets())
        // TODO: Make a model for the launch row, which accepts a array of rockets and a launch as its inputs
        

        spaceXRespoitory.getCompanyInfo()
            // Need to add in mapping to the appropriate string format
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self.companyInfoDataSource = nil
                }
            }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.companyInfoDataSource = "This is a mock" // TODO: Replace with the proper answer
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
}
