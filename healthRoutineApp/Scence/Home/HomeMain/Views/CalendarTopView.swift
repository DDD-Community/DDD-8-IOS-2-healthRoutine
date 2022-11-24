//
//  CalendarTopView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarTopView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Button(action: self.goToPrevMonth) {
                
                Image(systemName: "arrow.left")
                    .imageScale(.medium)
                    .font(Font.title.weight(.bold))
                    .foregroundColor(.black)
            }
            
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(.title)
                .animation(.none)
                .frame(maxWidth: .infinity)
            
            Button(action: self.gotToNextMonth) {
                
                Image(systemName: "arrow.right")
                    .imageScale(.medium)
                    .font(Font.title.weight(.bold))
                    .foregroundColor(.black)
            }
            
            Spacer()
        }
    }
}

extension CalendarTopView {
    
    private func gotToNextMonth() {
        
        self.dateHolder.date = CalendarHelper().getNextMonth(dateHolder.date)
    }
    
    private func goToPrevMonth() {
        
        self.dateHolder.date = CalendarHelper().getPrevMonth(dateHolder.date)
    }
}

struct CalendarTopView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTopView()
    }
}
