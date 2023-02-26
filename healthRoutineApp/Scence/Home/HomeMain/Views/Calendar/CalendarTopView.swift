//
//  CalendarTopView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarTopView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    private var viewModel = CalendarViewModel()
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Button(action: self.goToPrevMonth) {

                Image("leftAngleBracket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .foregroundColor(.white)
                .font(Font.pretendard(.bold, size: 20))
                .animation(.none)
                .frame(maxWidth: .infinity)
            
            Button(action: self.gotToNextMonth) {
                
                Image("rightAngleBracket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 30)
        .background(Color.box_color)
    }
}

extension CalendarTopView {
    
    private func gotToNextMonth() {
        
        self.dateHolder.date = CalendarHelper().getNextMonth(dateHolder.date)
        
        let year = CalendarHelper().getYear(dateHolder.date)
        let month = CalendarHelper().getMonth(dateHolder.date)
        self.viewModel.fetchInfo(year: year, month: month)
    }
    
    private func goToPrevMonth() {
        
        self.dateHolder.date = CalendarHelper().getPrevMonth(dateHolder.date)
        
        let year = CalendarHelper().getYear(dateHolder.date)
        let month = CalendarHelper().getMonth(dateHolder.date)
        self.viewModel.fetchInfo(year: year, month: month)
    }
}

struct CalendarTopView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTopView().environmentObject(DateHolder())
    }
}
