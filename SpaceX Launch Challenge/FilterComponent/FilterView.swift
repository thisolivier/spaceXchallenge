//
//  FilterView.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 13/11/2021.
//

import SwiftUI

struct FilterView: View {

    @State var showOnlySuccess: Bool = false
    @State var ordering: Ordering = .descending
    @State var startYear: Int?
    @State var endYear: Int?

    static var yearFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }

    var body: some View {
        Form {
            Section(header: Text("Filter by launch state")) {
                Toggle(isOn: $showOnlySuccess) {
                    Text("Show only successful launches")
                }
            }
            Section(header: Text("Filter by year")) {
                TextField(
                    "Start Year",
                    value: $startYear,
                    formatter: Self.yearFormatter)
                TextField(
                    "End Year",
                    value: $startYear,
                    formatter: Self.yearFormatter)
            }
            Section(header: Text("Sort by Date")) {
                Picker(selection: $ordering, label: Text("Order by date")) {
                    Text("Descending").tag(Ordering.descending)
                    Text("Ascending").tag(Ordering.ascending)
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
