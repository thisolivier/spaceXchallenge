//
//  FilterOptionsRepository.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 13/11/2021.
//

import Foundation
import SwiftUI

protocol FilterOptionsRepositable {
    var filterOptions: FilterOptions { get }

    func setYearRange(_ yearRange: YearRange)
    func setSuccessFilter(_ successFilter: SuccessFilter)
    func setOrdering(_ ordering: Ordering)
}

class FilterOptionsRepository: FilterOptionsRepositable {
    private(set) var filterOptions: FilterOptions = FilterOptions.initialOptions

    func setYearRange(_ yearRange: YearRange) {
        filterOptions.yearRange = yearRange
    }

    func setSuccessFilter(_ successFilter: SuccessFilter) {
        filterOptions.successFilter = successFilter
    }

    func setOrdering(_ ordering: Ordering) {
        filterOptions.ordering = ordering
    }
}

class MockFilterOptionsRepository: FilterOptionsRepositable {
    var filterOptions = FilterOptions(
        yearRange: .init(startYear: nil, endYear: nil),
        successFilter: .all,
        ordering: .descending)

    func setYearRange(_ yearRange: YearRange) {}

    func setSuccessFilter(_ successFilter: SuccessFilter) {}

    func setOrdering(_ ordering: Ordering) {}
}
