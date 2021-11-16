//
//  ContentView.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 10/11/2021.
//

import SwiftUI

struct LaunchesView<ViewModel: LaunchesViewModelable>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        List {
            Section(header: Text(StaticStrings.companySectionTitle)) {
                Text(viewModel.companyInfoDataSource)
            }
            Section(header: Text(StaticStrings.launchesSectionTitle)) {
                ForEach(viewModel.launchesDataSource) { launchRowViewModel in
                    LaunchRowView(viewModel: launchRowViewModel)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchesView(viewModel: MockLaunchesViewModel())
        }
    }
}
