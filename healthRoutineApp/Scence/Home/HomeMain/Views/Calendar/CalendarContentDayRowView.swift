//
//  CalendarContentDayRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarContentDayRowView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var viewModel: CalendarViewModel
    @ObservedObject var waterVM: HomeWaterIntakeViewModel
    
    init(viewModel: CalendarViewModel, waterVM: HomeWaterIntakeViewModel) {
        self.viewModel = viewModel
        self.waterVM = waterVM
    }

    var body: some View {
        
        LazyVStack {
            
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            
            ForEach(0..<6) { week in
                
                HStack(spacing: 1) {
                    
                    ForEach(1..<8) { day in
                    
                        let count = day + (week * 7)
                    
                        CalendarContentCellView(viewModel: viewModel, waterVM: waterVM, count: count,
                                                startingSpaces: startingSpaces,
                                                daysInMonth: daysInMonth)
                        .environmentObject(dateHolder)
                    }
                }
            }
        }
    }
}
