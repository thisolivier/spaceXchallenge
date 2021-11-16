//
//  Date+Extensions.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 15/11/2021.
//

import Foundation

extension Date {
    var dateAtTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self) + " at " + timeFormatter.string(from: self)
    }

    var isInPast: Bool {
        return self < Date()
    }

    var changeInDaysFromNow: Int? {
        let calendar = Calendar.current
        let startOfToday = calendar.startOfDay(for: Date())
        let startOfTargetDate = calendar.startOfDay(for: self)
        return calendar.dateComponents([.day], from: startOfToday, to: startOfTargetDate).day
    }
}
