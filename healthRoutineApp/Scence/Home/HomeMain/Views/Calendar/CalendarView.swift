//
//  CalendarView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        
        LazyVStack {
            
            Text("DDD님 오늘도 움직여 볼까요!")
                .font(Font.pretendard(.bold, size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 12)
            
            Spacer()
            
            CalendarTopView()
                .padding(.bottom, 8)
            
            CalendarContentWeekRowView() // 요일
                .padding(.bottom, 8)
                .frame(minHeight: 20)
            
            CalendarContentDayRowView() // 날짜
        }
        .frame(maxWidth: .infinity, maxHeight: 350)
        .padding(24)
        .background(Color.box_color)
        .cornerRadius(16)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView().environmentObject(DateHolder())
    }
}
