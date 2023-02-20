//
//  Month.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import Foundation
import SwiftUI

struct Month {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var monthType: MonthType
    var dayInt: Int
    
    func getDay() -> String {
        return String(dayInt)
    }
    
    func setBackground(_ level: Int) -> Color {
        
        switch level {
        case 0: return Color(hex: "F9F9F9")
        case 1: return Color(hex: "CAFFEB")
        case 2: return Color(hex: "6AFFC9")
        case 3: return Color(hex: "00FFA3")
        default: return Color(hex: "363740")
        }
    }
    
    func setForeground(_ date: Date) -> Color {
        
        let day = CalendarHelper().getDay(date)
        let month = CalendarHelper().getMonth(date)

        if dayInt > day {
            return Color(hex: "6D6D6D")
        } else {
            return Color(hex: "181818")
        }
    }
}

enum MonthType {
    case previous
    case current
    case next
}
