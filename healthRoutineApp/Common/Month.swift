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
    
    func setLevel() -> Color {
        // 여기서 요일 넣고 색 넣으면 될듯 
        switch dayInt {
        case 0: return Color.init(hex: "F9F9F9")
        case 1...7: return Color.init(hex: "00FFA3")
        case 8: return Color.init(hex: "6AFFC9")
        case 9...10: return Color.init(hex: "00FFA3")
        default: return Color.init(hex: "363740") // 비활성화 인 경우
        }
    }
    
    func setLevelTitle() -> Color {
        // 여기서 요일 넣고 색 넣으면 될듯
        switch dayInt {
        case 1...10: return Color.init(hex: "181818")
        default: return Color.init(hex: "6D6D6D") // 비활성화 인 경우
        }
    }
}

enum MonthType {
    
    case previous
    case current
    case next
}
