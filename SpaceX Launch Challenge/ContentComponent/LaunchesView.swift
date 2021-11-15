//
//  ContentView.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 10/11/2021.
//

// Questions: How to align views? Especially text views and their padding.

import SwiftUI

struct LaunchesView: View {

    var body: some View {
        List {
            Section(header: Text(StaticStrings.companySectionTitle)) {
                Text("Dummy Text")
            }
            Section(header: Text(StaticStrings.launchesSectionTitle)) {
                ForEach(dataEmitter.launches) { launch in
                    LaunchRowView()
                }
            }
        }.listStyle(PlainListStyle())
    }
}

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchesView(interactor: MockInteractor())
                .environmentObject(ContentPresenter())
            LaunchesView(interactor: MockInteractor())
                .environmentObject(ContentPresenter())
        }
    }
}
