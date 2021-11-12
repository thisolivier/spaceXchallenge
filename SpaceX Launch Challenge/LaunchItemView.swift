//
//  LaunchItemView.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 12/11/2021.
//

import SwiftUI

struct LaunchItemView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("None")
                    .frame(width: 50, height: 50)
                    .border(Color.black, width: 1)
                VStack(alignment: .leading) {
                    InformationRowView(title: "One", content: "Is the loniest number")
                    InformationRowView(title: "That you'll ever know", content: "Two, can be as bad as one, it's the lonliest number since")
                    InformationRowView(title: "The Number", content: "One")
                }
                Spacer()
                Image("None")
                    .frame(width: 50, height: 50)
                    .border(Color.black, width: 1)
            }
            .padding(.horizontal, 5)
            .padding(.top, 20)
            Divider()
        }
    }
}

struct LaunchItemView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchItemView()
    }
}

struct InformationRowView: View {
    let title: String
    let content: String

    var body: some View {
        HStack(alignment: .top) {
            Text("\(title):")
                .foregroundColor(.gray)
                .frame(width: 80, height: .none, alignment: .topLeading)
            Text(content)
        }
    }
}
