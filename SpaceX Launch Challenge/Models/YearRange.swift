//
//  YearRange.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 13/11/2021.
//

import Foundation

struct YearRange {
    let startYear: Int?
    let endYear: Int?
}

extension YearRange {
    // TODO: Add some kind of failure handling incase a year is provided which does not exist in the Gregorian calendar
    private var startDate: Date {
        guard let startYear = startYear else { return Date.distantPast }
        return Calendar
            .init(identifier: .gregorian)
            .date(from: DateComponents(year: startYear))!
    }

    private var endDate: Date {
        guard let endYear = endYear else { return Date.distantFuture }
        return Calendar
            .init(identifier: .gregorian)
            .date(from: DateComponents(year: endYear + 1))!
    }

    private var includedInterval: DateInterval? {
        guard startYear != nil || endYear != nil else {
            return nil
        }
        return DateInterval(start: startDate, end: endDate)
    }

    func isDateWithinInterval(_ queryDate: Date) -> Bool {
        guard let interval = includedInterval else { return true }
        return interval.contains(queryDate)
    }
}
