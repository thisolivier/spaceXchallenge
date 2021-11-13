//
//  ContentViewModel.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 13/11/2021.
//

import Foundation
import Combine

// Received model objects and updates the view state
// Up to you whether the state is expressed as a single struct, multiple atomic properties etc
class ContentPresenter: ObservableObject {
    @Published private(set) var randomModel: Model
    let launches: [LauncheViewModel] = [
        LauncheViewModel(name: "Launch Victor"),
        LauncheViewModel(name: "Into the Sun"),
        LauncheViewModel(name: "And tell Charlotte"),
        LauncheViewModel(name: "To go have fun")]

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

struct LauncheViewModel: Identifiable {
    let id = UUID()
    let name: String
}