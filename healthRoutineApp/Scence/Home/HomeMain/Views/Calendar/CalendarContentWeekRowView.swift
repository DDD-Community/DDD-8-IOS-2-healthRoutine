//
//  CalendarContentWeekRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarContentWeekRowView: View {
    
    private let day: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    
    var body: some View {
        
        HStack {
            
            ForEach(day, id: \.self) {
                Text($0)
                    .foregroundColor(.white)
                    .font(Font.pretendard(.medium, size: 12))
                    .dayOfWeek()
            }
        }
    }
}

struct CalendarContentWeekRowView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentWeekRowView().environmentObject(DateHolder())
            .background(Color.box_color)
    }
}

extension Text {
    
    func dayOfWeek() -> some View {
        
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}

