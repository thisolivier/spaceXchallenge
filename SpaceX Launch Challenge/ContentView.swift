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
    @EnvironmentObject var dataEmitter: DataEmitter

    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack {
                SectionTitle(title: "Company")
                Text("The current name is \(dataEmitter.randomModel.name), and their random number is \(dataEmitter.randomModel.age)")
                    .frame(minWidth: .none, idealWidth: .infinity, maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                SectionTitle(title: "Launches")
                LaunchItemView()
                LaunchItemView()
                LaunchItemView()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(interactor: MockInteractor())
                .environmentObject(DataEmitter())
            ContentView(interactor: MockInteractor())
                .environmentObject(DataEmitter())
        }
    }
}

struct SectionTitle: View {

    let title: String

    var body: some View {
        Text(title)
            .textCase(.uppercase)
            .foregroundColor(.white)
            .padding(10)
            .frame(minWidth: .none, idealWidth: .infinity, maxWidth: .infinity, alignment: .leading)
            .background(Rectangle().foregroundColor(.black))
    }
}
