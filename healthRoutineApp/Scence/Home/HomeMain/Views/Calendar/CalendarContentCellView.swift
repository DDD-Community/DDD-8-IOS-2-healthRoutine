//
//  CalendarContentCellView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarContentCellView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var viewModel: CalendarViewModel
    @ObservedObject var waterVM: HomeWaterIntakeViewModel
    
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    
    var body: some View {
        
        ZStack {

            Rectangle()
                .foregroundColor(self.updateCell(monthStruct().getDay()))
                .frame(width: 34, height: 34)
                .cornerRadius(10)
        
            Text(monthStruct().getDay())
                .foregroundColor(monthStruct().setForeground(dateHolder.date))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .opacity(monthStruct().monthType == .current ? 1 : 0)
        .onTapGesture {
            
            let year = CalendarHelper().getYear(dateHolder.date)
            let month = CalendarHelper().getMonth(dateHolder.date)
            
            guard let day = Int(monthStruct().getDay()) else { return }
            
            self.viewModel.fetchTodayExerciseList(year, month, day)
            self.waterVM.fetchTodayWaterAmount(year, month, day)
        }
    }

    private func updateCell(_ date: String) -> Color {

        let level = self.viewModel.dayOfLevel[date]

        switch level {
        case 1: return Color(hex: "F9F9F9")
        case 2: return Color(hex: "CAFFEB")
        case 3: return Color(hex: "6AFFC9")
        case 4: return Color(hex: "00FFA3")
        default: return Color(hex: "363740")
        }
        
//        if monthStruct().monthType == .current {
//
//            switch level {
//            case 1: return Color(hex: "F9F9F9")
//            case 2: return Color(hex: "CAFFEB")
//            case 3: return Color(hex: "6AFFC9")
//            case 4: return Color(hex: "00FFA3")
//            default: return Color(hex: "363740")
//            }
//
//        } else {
//            return Color(hex: "363740")
//        }
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
