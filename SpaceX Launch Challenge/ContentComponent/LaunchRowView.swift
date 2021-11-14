//
//  LaunchItemView.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 12/11/2021.
//

import SwiftUI

struct LaunchRowView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("None")
                    .frame(width: 50, height: 50)
                    .border(Color.black, width: 1)
                List {
                    InformationRowView(title: "Mission", content: "Eat the World & its Moon")
                    InformationRowView(title: "Date/Time", content: "20/12/2021 at 12:45")
                    InformationRowView(title: "Rocket", content: "Thunderbird 1 / Space Vehicle")
                    InformationRowView(title: "Days since now", content: "-200")
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
        LaunchRowView()
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
