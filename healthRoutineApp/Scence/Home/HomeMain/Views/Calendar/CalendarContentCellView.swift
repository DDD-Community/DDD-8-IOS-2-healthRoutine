//
//  CalendarContentCellView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

enum Level {
    
    case never
    case rarely
    case sometime
    case often
    case always
    
    var background: Color {
        switch self {
        case .never: return Color.init(hex: "F9F9F9")
        case .rarely: return Color.init(hex: "CAFFEB")
        case .sometime: return Color.init(hex: "6AFFC9")
        case .often: return Color.init(hex: "00FFA3")
        case .always: return Color.init(hex: "363740")
        }
    }
}

struct CalendarContentCellView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var viewModel = CalendarContentViewModel()
    
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let daysInPrevMonth: Int
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(monthStruct().setLevel())
//                .foregroundColor(Color(hex: "363749"))
                .frame(width: 34, height: 34)
                .cornerRadius(10)
            
            Text(monthStruct().getDay())
                .foregroundColor(monthStruct().setLevelTitle())
//                .foregroundColor(Color(hex: "6D6D6D"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .opacity(monthStruct().monthType == .current ? 1 : 0)
    }
    
    private func monthStruct() -> Month {
        
        let start = startingSpaces == 1 ? startingSpaces + 7 : startingSpaces
        
        if count <= start {
            
            let day = daysInMonth + count - start
            return Month(monthType: MonthType.previous, dayInt: day)
            
        } else if count - start > daysInMonth {
            
            let day = count - start - daysInMonth
            return Month(monthType: MonthType.next, dayInt: day)
        }
        
        let day = count - start
        return Month(monthType: MonthType.current, dayInt: day)
    }
}

struct CalendarContentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentCellView(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPrevMonth: 1)
    }
}
