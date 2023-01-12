//
//  CalendarContentCellView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

// MARK: Mock
enum Level {
    
    case never
    case rarely
    case sometime
    case often
    case always
    
    var background: Color {
        
        switch self {
        case .never: return Color(UIColor.green.withAlphaComponent(0.2))
        case .rarely: return Color(UIColor.green.withAlphaComponent(0.4))
        case .sometime: return Color(UIColor.green.withAlphaComponent(0.6))
        case .often: return Color(UIColor.green.withAlphaComponent(0.8))
        case .always: return Color(UIColor.green.withAlphaComponent(1.0))
        }
    }
}

struct CalendarContentCellView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let dyasInPrevMonth: Int
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
//                .fill(monthStruct().setLevel().background)
                .foregroundColor(Color(hex: "6D6D6D"))
                .frame(width: 34, height: 34)
                .cornerRadius(10)
            
            Text(monthStruct().getDay())
//                .foregroundColor(textColor(type: monthStruct().monthType))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .opacity(monthStruct().monthType == .current ? 1 : 0)
    }
    
//    private func textColor(type: MonthType) -> Color {
//
//        return type == .current ? .black : .gray
//    }
    
    private func monthStruct() -> Month {
        
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        
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
        CalendarContentCellView(count: 1, startingSpaces: 1, daysInMonth: 1, dyasInPrevMonth: 1)
    }
}
