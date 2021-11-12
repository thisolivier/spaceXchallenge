//
//  SpaceX_Launch_ChallengeApp.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 10/11/2021.
//

import SwiftUI
import Combine

@main
struct SpaceX_Launch_ChallengeApp: App {

    var body: some Scene {
        WindowGroup {
            ContentViewFactory
                .makeContentView()
        }
    }
}

// Received model objects and updates the view state
// Up to you whether the state is expressed as a single struct, multiple atomic properties etc
class DataEmitter: ObservableObject {
    @Published private(set) var randomModel: Model


    init() {
        randomModel = Model.random
    }

    func updateModel() {
        randomModel = Model.random
    }
}

struct Model {
    let name: String
    let age: Int

    static var random: Model {
        return Model(
            name: names.randomElement() ?? "ERROR",
            age: Int.random(in: 10...120))
    }

    private static let names: [String] = ["Olivier", "Nina", "Yasmina", "Charlie", "Coralie", "Julius", "Jonathon"]
}

