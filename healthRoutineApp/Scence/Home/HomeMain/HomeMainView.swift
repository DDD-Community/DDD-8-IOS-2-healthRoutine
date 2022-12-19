//
//  HomeMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct HomeMainView: View {
    var body: some View {
        
        VStack {
            
            TopMenuVeiw(mainTitle: "득근득근")
            
            VStack {
                
//                CalendarView()
//                    .frame(maxWidth: .infinity, maxHeight: 300)
//                    .padding(20)
                
                WaterIntakeView()
                
                BadgeRowView()
            }
            .cornerRadius(20)
            .padding(20)
            .background(.yellow)
            
            
            Spacer()
        }
    }
}

struct HomeMainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainView()
    }
}
