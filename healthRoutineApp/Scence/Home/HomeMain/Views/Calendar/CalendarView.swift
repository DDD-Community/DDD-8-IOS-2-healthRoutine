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
    
    private var isMainView: Bool = false
    
    init(isMainView: Bool) {
        self.isMainView = isMainView
    }
    
    var body: some View {
        
        VStack {

            Text(self.updateTitle(isMainView))
                .font(Font.pretendard(.bold, size: 20))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 12)
            
            Spacer()
            
            CalendarTopView(isMainView: isMainView)
                .padding(.bottom, 8)
            
            CalendarContentWeekRowView() // 요일
                .padding(.bottom, 8)
                .frame(minHeight: 20)
            
            CalendarContentDayRowView()
        }
        .frame(maxWidth: .infinity, maxHeight: 350)
        .padding(24)
        .background(Color.box_color)
        .cornerRadius(16)
        .onAppear {
            
            let year = CalendarHelper().getYear(dateHolder.date)
            let month = CalendarHelper().getMonth(dateHolder.date)
            self.viewModel.fetchInfo(year: year, month: month)
        }
    }
    
    private func updateTitle(_ isMain: Bool) -> String {
        return isMain ? viewModel.getNickName() : "\(CalendarHelper().getMonth(dateHolder.date))월은 벌컵 벌컵 하셨군요!"
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(isMainView: false).environmentObject(DateHolder())
    }
}
