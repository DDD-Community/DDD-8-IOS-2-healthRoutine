//
//  HomeMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct HomeMainView: View {
    
    private var mainViews: [any View] = [WaterIntakeView(), BadgeRowView()]
    
    var body: some View {
        
        VStack {
            
            TopMenuVeiw(mainTitle: "득근득근")
            
            CustomNavigationView {
                
                ScrollView {
                    
                    VStack {
                        
                        CustomNavigationLink(destination: HomeDetailView()) {
                            WaterIntakeView()
                        }
                        
                        CustomNavigationLink(destination: HomeDetailView()) {
                            BadgeRowView()
                        }
                    }
                    .padding(20)
                }
            }
            
            Spacer()
        }
    }
}

struct HomeMainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainView()
    }
}
