//
//  Month.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import Foundation
import SwiftUI

struct Month {
    
    var monthType: MonthType
    var dayInt: Int
    
    func getDay() -> String {
        return String(dayInt)
    }
    
    // MARK: Mock
    func setLevel() -> Level {
        
        if dayInt % 5 == 0 {
            return .rarely
        } else if dayInt % 4 == 0 {
            return .never
        } else if dayInt % 3 == 0 {
            return .sometime
        } else if dayInt % 1 == 0 {
            return .often
        } else if dayInt == 0 {
            return .always
        }
        
        return .often
    }
}

enum MonthType {
    
    case previous
    case current
    case next
}
