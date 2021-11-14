//
//  FilterOptions.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 13/11/2021.
//

import Foundation

struct FilterOptions {
    var yearRange: YearRange
    var successFailureFilter: SuccessFailureFilter
    var ordering: Ordering

    static let initialOptions: FilterOptions = FilterOptions(
        yearRange: .init(startDate: nil, endDate: nil),
        successFailureFilter: .both,
        ordering: .descending)
}
