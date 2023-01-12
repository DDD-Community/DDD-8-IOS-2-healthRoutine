//
//  CalendarContentWeekRowView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarContentWeekRowView: View {
    
    var body: some View {
        
        HStack(spacing: 1) {
            
            Text("일").bold().dayOfWeek().foregroundColor(.red)
            Text("월").bold().dayOfWeek()
            Text("화").bold().dayOfWeek()
            Text("수").bold().dayOfWeek()
            Text("목").bold().dayOfWeek()
            Text("금").bold().dayOfWeek()
            Text("토").bold().dayOfWeek().foregroundColor(.blue)
        }
    }
}

struct CalendarContentWeekRowView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentWeekRowView().environmentObject(DateHolder())
    }
}

extension Text {
    
    func dayOfWeek() -> some View {
        
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}

