//
//  CalendarView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarView: View {
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            CalendarTopView() 
            CalendarContentWeekRowView() // 요일
            CalendarContentDayRowView() // 날짜
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
