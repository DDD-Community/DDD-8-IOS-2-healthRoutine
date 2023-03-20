//
//  CalendarTopView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarTopView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    private var viewModel: CalendarViewModel
    
    private var isMainView: Bool = false
    
    init(viewModel: CalendarViewModel, isMainView: Bool) {
        self.viewModel = viewModel
        self.isMainView = isMainView
    }
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            if isMainView {
                
                Text(CalendarHelper().monthYearString(dateHolder.date))
                    .foregroundColor(.white)
                    .font(Font.pretendard(.bold, size: 20))
                    .animation(.none)
                    .frame(maxWidth: .infinity)
            }
            
            else {
                
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
                .opacity(showNextMonthButton())
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
        
//        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
//            self.viewModel.fetchInfo(year: year, month: month)
//        }
        // self.viewModel.fetchInfo(year: year, month: month)
    }
    
    private func goToPrevMonth() {
        
        self.dateHolder.date = CalendarHelper().getPrevMonth(dateHolder.date)
        
        let year = CalendarHelper().getYear(dateHolder.date)
        let month = CalendarHelper().getMonth(dateHolder.date)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.viewModel.fetchInfo(year: year, month: month)
//        }
    }
    
    private func showNextMonthButton() -> Double {
        
        let realDate = Date()
        let calendar = Calendar.current
        
        let realYear = calendar.component(.year, from: realDate)
        let realmonth = calendar.component(.month, from: realDate)
        
        let year = CalendarHelper().getYear(dateHolder.date)
        let month = CalendarHelper().getMonth(dateHolder.date)
        
        return (month >= realmonth && year >= realYear) ? 0 : 1
    }
}

//struct CalendarTopView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarTopView(isMainView: false).environmentObject(DateHolder())
//    }
//}
