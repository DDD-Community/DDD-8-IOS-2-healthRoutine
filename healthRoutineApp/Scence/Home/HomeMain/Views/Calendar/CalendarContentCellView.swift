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
                .foregroundColor(monthStruct().setBackground(self.viewModel.level))
                .frame(width: 34, height: 34)
                .cornerRadius(10)

            Text(monthStruct().getDay())
                .foregroundColor(monthStruct().setForeground(dateHolder.date))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear { self.updateView() }
//        .opacity(monthStruct().monthType == .current ? 1 : 0)
    }
    
    private func updateView() {
        
        let nowDay = monthStruct().getDay()
        
        debugPrint("nowDay: \(nowDay)")
        
        if let value = self.viewModel.dayOfLevel[nowDay] {
            debugPrint("value: \(value)")
        }
    }
    
    private func monthStruct() -> Month {
        
        let start = startingSpaces
            
//        if count <= start {
//
//            let day = daysInMonth + count - start
//            return Month(monthType: MonthType.previous, dayInt: day)
//
//        } else if count - start > daysInMonth {
//
//            let day = count - start - daysInMonth
//            return Month(monthType: MonthType.next, dayInt: day)
//        }
        
        let day = count - start
        return Month(monthType: MonthType.current, dayInt: day)
    }
}

struct CalendarContentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentCellView(count: 1, startingSpaces: 1, daysInMonth: 1)
    }
}
