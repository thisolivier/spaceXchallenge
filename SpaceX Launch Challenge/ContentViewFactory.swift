//
//  ContentViewFactory.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 12/11/2021.
//

import Foundation
import SwiftUI
import Combine

enum ContentViewFactory {
    static func makeContentView() -> some View {
        let dataEmitter = DataEmitter()
        let interactor = ContentInteractor(output: dataEmitter)

        return ContentView(interactor: interactor)
            .environmentObject(dataEmitter)
    }
}

protocol ContentInteractorable {}

struct MockInteractor: ContentInteractorable {}

// Received signals, performs model tasks, sends updates to the ViewModel
class ContentInteractor: ContentInteractorable {
    private let output: DataEmitter
    private var cancellable: AnyCancellable?

    init(output: DataEmitter) {
        self.output = output
        cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                output.updateModel()
            }
    }

    deinit {
        fatalError()
    }
}
