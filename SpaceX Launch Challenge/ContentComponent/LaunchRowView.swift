//
//  LaunchItemView.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 12/11/2021.
//

import SwiftUI

struct LaunchRowView: View {
    var viewModel: LaunchRowViewModel

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("None")
                    .frame(width: 50, height: 50)
                    .border(Color.black, width: 1)
                VStack(alignment: .leading) {
                    InformationRowView(
                        title: "Mission",
                        content: viewModel.missionName)
                    Divider()
                    InformationRowView(
                        title: "Date/Time",
                        content: viewModel.dateTime)
                    Divider()
                    InformationRowView(
                        title: "Rocket",
                        content: viewModel.rocket)
                    Divider()
                    InformationRowView(
                        title: viewModel.relativeDaysTitle,
                        content: viewModel.relativeDaysContent)
                }
                Spacer()
                Image("None")
                    .frame(width: 50, height: 50)
                    .border(Color.black, width: 1)
            }
            .padding(.horizontal, 5)
            .padding(.top, 20)
        }
    }
}

struct LaunchRowView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRowView(viewModel: LaunchRowViewModel.mock)
    }
}

struct InformationRowView: View {
    let title: String
    let content: String

    var body: some View {
        HStack(alignment: .top) {
            Text("\(title):")
                .foregroundColor(.gray)
                .frame(width: 90, height: .none, alignment: .topLeading)
            Text(content)
        }
    }
}
