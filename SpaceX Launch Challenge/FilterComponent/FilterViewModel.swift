//
//  FilterViewModel.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 30/11/2021.
//

import Foundation
import Combine

protocol FilterViewModelable: ObservableObject {
}

struct TestStruct {

    var thingWeWillChange: String
    var computedPropety: Int {
        changeThing(to: thingWeWillChange + " extra text")
        return 10
    }

    mutating func changeThing(to newValue: String) {
        thingWeWillChange = newValue
    }
}
