//
//  ContentViewFactory.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 12/11/2021.
//

import SwiftUI

enum LaunchesViewFactory {
    static func makeContentView() -> some View {
        let viewModel = LaunchesViewModel(
            filterOptionsRepository: FilterOptionsRepository(),
            spaceXRespoitory: SpaceXRespository())
        return LaunchesView(viewModel: viewModel)
    }
}
