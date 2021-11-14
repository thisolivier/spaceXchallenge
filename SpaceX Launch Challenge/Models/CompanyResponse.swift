//
//  CompanyResponse.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 15/11/2021.
//

import Foundation

// MARK: - Welcome
struct CompanyResponse: Codable {
    let name, founder: String
    let founded, employees, launchSites: Int
    let valuation: Int

    enum CodingKeys: String, CodingKey {
        case name, founder, founded, employees, valuation
        case launchSites = "launch_sites"
    }
}
