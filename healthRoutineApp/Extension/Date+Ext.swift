//
//  Date+Ext.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import Foundation

extension DateFormatter {
    
    private static func withFormat(_ format: String) -> DateFormatter {
        
        let formmater = DateFormatter()
        
        formmater.dateFormat = format
        formmater.calendar = Calendar(identifier: .iso8601)
        formmater.timeZone = TimeZone.autoupdatingCurrent
        formmater.locale = Locale.autoupdatingCurrent
        
        return formmater
    }
    
    static let dotYyyyMM: DateFormatter = {
        DateFormatter.withFormat("yyyy.MM")
    }()
}

extension Date {
    var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}
