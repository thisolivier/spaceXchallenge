//
//  ContentView.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 10/11/2021.
//

// Questions: How to align views? Especially text views and their padding.

import SwiftUI

struct ContentView: View {
    var interactor: ContentInteractorable
    @EnvironmentObject var dataEmitter: ContentPresenter

    var body: some View {
        List {
            Section(header: Text("Company")) {
                Text("The current name is \(dataEmitter.randomModel.name), and their random number is \(dataEmitter.randomModel.age)")
            }
            Section(header: Text("Launches")) {
                ForEach(dataEmitter.launches) { launch in
                    LaunchItemView()
                }
            }
        }.listStyle(PlainListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(interactor: MockInteractor())
                .environmentObject(ContentPresenter())
            ContentView(interactor: MockInteractor())
                .environmentObject(ContentPresenter())
        }
    }
}
