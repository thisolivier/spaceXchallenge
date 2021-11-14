//
//  LaunchResponse.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 15/11/2021.
//

import Foundation

typealias LaunchResponse = [LaunchItem]

// MARK: - LaunchItem
struct LaunchItem: Codable {
    let links: Links
    let rocket: String
    let success: Bool
    let name, dateUTC: String
    let dateLocal: Date
    let id: String

    enum CodingKeys: String, CodingKey {
        case links, rocket, success, name, id
        case dateUTC = "date_utc"
        case dateLocal = "date_local"
    }
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch
    let webcast, article, wikipedia: String

    enum CodingKeys: String, CodingKey {
        case patch, article, wikipedia, webcast
    }
}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String
}
