//
//  CalendarContentCellView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarContentCellView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var viewModel = CalendarViewModel()
    
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    
    var body: some View {
        
        ZStack {

            Rectangle()
                .foregroundColor(updateCell(monthStruct().getDay()))
                .frame(width: 34, height: 34)
                .cornerRadius(10)

            Text(monthStruct().getDay())
                .foregroundColor(monthStruct().setForeground(dateHolder.date))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .opacity(monthStruct().monthType == .current ? 1 : 0)
//        .onAppear {
//            let year = CalendarHelper().getYear(dateHolder.date)
//            let month = CalendarHelper().getMonth(dateHolder.date)
//            self.viewModel.fetchInfo(year: year, month: month)
//        }
    }
    
    private func updateCell(_ date: String) -> Color {
        
        let level = self.viewModel.dayOfLevel[date]
        
        if monthStruct().monthType == .current {
            
            switch level {
            case 0: return Color(hex: "F9F9F9")
            case 1: return Color(hex: "CAFFEB")
            case 2: return Color(hex: "6AFFC9")
            case 3: return Color(hex: "00FFA3")
            default: return Color(hex: "363740")
            }
        } else {
            return Color(hex: "363740")
        }
    }
    
    private func monthStruct() -> Month {
        
        let start = startingSpaces
            
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
        CalendarContentCellView(count: 1, startingSpaces: 1, daysInMonth: 1)
    }
}
