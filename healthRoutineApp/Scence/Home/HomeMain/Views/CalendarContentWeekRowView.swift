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
            
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("WED").dayOfWeek()
            Text("THU").dayOfWeek()
            Text("FRI").dayOfWeek()
            Text("SAT").dayOfWeek()
        }
    }
}

struct CalendarContentWeekRowView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentWeekRowView()
    }
}

extension Text {
    
    func dayOfWeek() -> some View {
        
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}

