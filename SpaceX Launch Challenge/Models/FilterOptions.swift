//
//  FilterOptions.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 13/11/2021.
//

import Foundation

struct FilterOptions {
    var yearRange: YearRange
    var successFilter: SuccessFilter
    var ordering: Ordering

    static let initialOptions: FilterOptions = FilterOptions(
        yearRange: .init(startYear: nil, endYear: nil),
        successFilter: .all,
        ordering: .descending)
}
