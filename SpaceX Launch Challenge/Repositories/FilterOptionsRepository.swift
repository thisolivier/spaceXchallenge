//
//  FilterOptionsRepository.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 13/11/2021.
//

import Foundation

protocol FilterOptionsDataSource: ObservableObject {
    var filterOptions: FilterOptions { get }

    func setYearRange(_ yearRange: YearRange)
    func setSuccessFailureFilter(_ successFailureFilter: SuccessFailureFilter)
    func setOrdering(_ ordering: Ordering)
}

class FilterOptionsRepository: FilterOptionsDataSource {
    @Published private(set) var filterOptions: FilterOptions = FilterOptions.initialOptions

    func setYearRange(_ yearRange: YearRange) {
        filterOptions.yearRange = yearRange
    }

    func setSuccessFailureFilter(_ successFailureFilter: SuccessFailureFilter) {
        filterOptions.successFailureFilter = successFailureFilter
    }

    func setOrdering(_ ordering: Ordering) {
        filterOptions.ordering = ordering
    }
}
