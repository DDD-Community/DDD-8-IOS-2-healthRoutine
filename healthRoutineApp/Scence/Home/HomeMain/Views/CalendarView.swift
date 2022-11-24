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
            
            Text("DDD님 오늘도 움직여 볼까요!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading], 20)
            
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
