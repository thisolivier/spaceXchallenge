//
//  ContentView.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 10/11/2021.
//

import SwiftUI

struct ContentView: View {
    var interactor: ContentInteractorable
    @EnvironmentObject var dataEmitter: DataEmitter

    var body: some View {
        HStack {
            Text(dataEmitter.randomModel.name)
                .padding()
            Text(String(dataEmitter.randomModel.age))
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(interactor: MockInteractor())
            .environmentObject(DataEmitter())
    }
}
