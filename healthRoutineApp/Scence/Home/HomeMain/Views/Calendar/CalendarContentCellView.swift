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
    
    @State var isHidden: Bool = false
    
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    
    var body: some View {
        
        ZStack {

            Rectangle()
//                .foregroundColor(Color(hex: "363749"))
                .foregroundColor(monthStruct().setBackground(self.viewModel.level))
                .frame(width: 34, height: 34)
                .cornerRadius(10)

            Text(monthStruct().getDay())
                .foregroundColor(monthStruct().setForeground(dateHolder.date))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
//        .opacity(monthStruct().monthType == .current ? 1 : 0)
    }
    
    private func monthStruct() -> Month {
        
//        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        let start = startingSpaces
        
        debugPrint("start: \(start)") // 시작되는 요일 index
        debugPrint("count: \(count)") // 5주 갯수 35개
        
        if count <= start {
            
            let day = daysInMonth + count - start
            

            debugPrint("day111: \(day)") // 지난달 요일
            return Month(monthType: MonthType.previous, dayInt: day)
            
        } else if count - start > daysInMonth {
            
            let day = count - start - daysInMonth

            debugPrint("day222: \(day)") // 다음달 요일
            return Month(monthType: MonthType.next, dayInt: day)
        }
        
        let day = count - start
        return Month(monthType: MonthType.current, dayInt: day)
    }
}

struct CalendarContentCellView_Previews: PreviewProvider {
    static var previews: some View {
//        CalendarContentCellView(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPrevMonth: 1)
        CalendarContentCellView(count: 1, startingSpaces: 1, daysInMonth: 1)
    }
}
