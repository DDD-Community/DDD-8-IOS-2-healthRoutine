//
//  CalendarHelper.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import Foundation

class CalendarHelper {
    
    let calendar = Calendar.current
}

extension CalendarHelper {
    
    func monthYearString(_ date: Date) -> String {
        
        let dateFormatter = DateFormatter.dotYyyyMM
        return dateFormatter.string(from: date)
    }
    
    func getNextMonth(_ date: Date) -> Date {
        
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func getPrevMonth(_ date: Date) -> Date {
        
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
}

extension CalendarHelper {
    
    func daysInMonth(_ date: Date) -> Int {
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func daysOfMonth(_ date: Date) -> Int {
        
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func weekDay(_ date: Date) -> Int {
        
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    
    func firstOfMonth(_ date: Date) -> Date {
        
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
}

extension CalendarHelper {
    
    func getMonth(_ date: Date) -> Int {
        return calendar.component(.month, from: date)
    }
    
    func getYear(_ date: Date) -> Int {
        return calendar.component(.year, from: date)
    }
}

