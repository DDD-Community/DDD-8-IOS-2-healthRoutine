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
        
            CustomNavigationView {
                
                BaseView {
                    
                    ScrollView {
                        
                        VStack {
                            
                            CustomNavigationLink(destination: HomeDetailView()) {
                                WaterIntakeView()
                            }
                            
                            CustomNavigationLink(destination: HomeDetailView()) {
                                BadgeRowView()
                            }
                        }
                    }
                    .customNavigationBarBackButtonHidden(true)
                    .customNavigationTitle("득근득근")
                }
        }
    }
}

struct HomeMainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainView()
    }
}
