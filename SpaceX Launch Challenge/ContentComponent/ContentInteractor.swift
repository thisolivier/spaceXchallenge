//
//  ContentViewInteractor.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 13/11/2021.
//

import Foundation
import Combine

protocol ContentInteractorable {}

struct MockInteractor: ContentInteractorable {}

// Received signals, performs model tasks, sends updates to the ViewModel
class ContentInteractor: ContentInteractorable {
    private let output: ContentPresenter
    private var cancellable: AnyCancellable?

    init(output: ContentPresenter) {
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
