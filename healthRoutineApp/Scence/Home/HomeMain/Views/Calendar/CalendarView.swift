//
//  CalendarView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    private var viewModel = CalendarViewModel()
    
    var body: some View {
        
        LazyVStack {
            
            // TODO: 상세에서 사용하는 title과 메인에서 사용하는 title 변경해야 함
            Text("\(viewModel.getNickName())오늘도 움직여 볼까요?")
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
