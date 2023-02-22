//
//  CalendarContentDayRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarContentDayRowView: View {
    
    @EnvironmentObject var dateHolder: DateHolder

    @ObservedObject var viewModel = CalendarViewModel()

    var body: some View {
        
        LazyVStack {
            
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            
//            let prevMonth = CalendarHelper().getPrevMonth(dateHolder.date)
//            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            
            ForEach(0..<5) { week in
                
                HStack(spacing: 1) {
                    
                    ForEach(1..<8) { day in
                    
                        let count = day + (week * 7)
                             
//                        CalendarContentCellView(count: count,
//                                                startingSpaces: startingSpaces,
//                                                daysInMonth: daysInMonth,
//                                                daysInPrevMonth: daysInPrevMonth)
                        
                        CalendarContentCellView(count: count,
                                                startingSpaces: startingSpaces,

                                                daysInMonth: daysInMonth)
                        
                        .environmentObject(dateHolder)
                    }
                }
            }
        }
    }
}

struct CalendarContentDayRowView_Previews: PreviewProvider {
    
    static var previews: some View {
                
        CalendarContentDayRowView().environmentObject(DateHolder())
    }
}
