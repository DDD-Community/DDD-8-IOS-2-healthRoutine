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
    @ObservedObject var viewModel = CalendarViewModel()
    
    var monthType: MonthType
    var dayInt: Int
    
    func getDay() -> String {
        return String(dayInt)
    }
    
    func setBackground(_ date: String) -> Color {
        
        // TODO: 요일을 가져와서 맞춰서 출력
        if monthType == .current {
            
            let level = self.viewModel.dayOfLevel[date]
//            let level = ["21": 1, "23": 1, "26": 2, "2": 1, "9": 1, "1": 1, "24": 1, "13": 1, "14": 1, "15": 1, "16": 1, "25": 2, "6": 1, "17": 1, "27": 0, "12": 1, "22": 2, "19": 1, "11": 1, "3": 1, "4": 1, "8": 1, "28": 0, "7": 1, "5": 1, "10": 1, "20": 1, "18": 1]
            
//            switch level[date] {
            switch level {
            case 0: return Color(hex: "F9F9F9")
            case 1: return Color(hex: "CAFFEB")
            case 2: return Color(hex: "6AFFC9")
            case 3: return Color(hex: "00FFA3")
            default: return Color(hex: "363740")
            }
        }
        else {
            return Color(hex: "363740")
        }
    }
    
    func setForeground(_ date: Date) -> Color {

        // 달력으로 부터 얻어오는 년월일
        let day = CalendarHelper().getDay(date)
        let month = CalendarHelper().getMonth(date)
//        let year = CalendarHelper().getYear(date)
        
        let realDate = Date()
        let calendar = Calendar.current
        // 실제 현재 년월일
        let realmonth = calendar.component(.month, from: realDate)
//        let realYear = calendar.component(.year, from: date)
        
        if dayInt > day || month != realmonth {
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
