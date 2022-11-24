//
//  CalendarContentCellView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct CalendarContentCellView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let dyasInPrevMonth: Int
    
    var body: some View {
        
        Text("Hello")
    }
}

struct CalendarContentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentCellView(count: 1, startingSpaces: 1, daysInMonth: 1, dyasInPrevMonth: 1)
    }
}
