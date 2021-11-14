//
//  SpaceXRepository.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 14/11/2021.
//

import Foundation
import Combine

protocol SpaceXRepositable {
    func getAllLaunches() -> AnyPublisher<LaunchResponse, SpaceXError>
    func getAllRockets() -> AnyPublisher<RocketResponse, SpaceXError>
    func getCompanyInfo() -> AnyPublisher<CompanyResponse, SpaceXError>
}

enum SpaceXError: Error {
    case any(String)
}
