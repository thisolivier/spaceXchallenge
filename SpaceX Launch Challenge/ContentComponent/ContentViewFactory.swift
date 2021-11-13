//
//  ContentViewFactory.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 12/11/2021.
//

import SwiftUI

enum ContentViewFactory {
    static func makeContentView() -> some View {
        let dataEmitter = ContentPresenter()
        let interactor = ContentInteractor(output: dataEmitter)

        return ContentView(interactor: interactor)
            .environmentObject(dataEmitter)
    }
}
