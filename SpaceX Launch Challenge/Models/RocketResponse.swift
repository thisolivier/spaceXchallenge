//
//  RocketResponse.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 15/11/2021.
//

import Foundation

typealias RocketResponse = [RocketItem]

struct RocketItem: Codable {
    let name, type, id: String

    enum CodingKeys: String, CodingKey {
        case name, type, id
    }
}
