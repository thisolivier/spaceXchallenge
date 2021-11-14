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
            NavigationView(content: {
                LaunchesViewFactory
                    .makeContentView()
                    .navigationTitle("SpaceX")
                    .navigationBarItems(trailing: NavigationLink(destination: FilterView()) { Text("Filter") })
            })
        }
    }
}
