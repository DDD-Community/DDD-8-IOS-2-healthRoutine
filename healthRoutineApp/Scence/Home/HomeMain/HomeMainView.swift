//
//  HomeMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/24.
//

import SwiftUI

struct HomeMainView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var viewModel = CalendarViewModel()
    @ObservedObject var waterVM = HomeWaterIntakeViewModel()
    @ObservedObject var badegeVM = BadgeViewModel()
    
    var body: some View {
        
        CustomNavigationView {
            
            BaseView {
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(spacing: 16) {
                        
                        CustomNavigationLink(destination: HomeDetailView(viewModel: viewModel, waterVM: waterVM)) {
                            CalendarView(viewModel: viewModel, waterVM: waterVM, isMainView: true)
                                .environmentObject(DateHolder())
                        }
                        
                        HomeWaterIntakeView(viewModel: waterVM)
                        
                        HomeBadgeRowView(viewModel: badegeVM)
                            .padding(.bottom, 16)
                    }
                }
                .customNavigationBarBackButtonHidden(true)
                .customNavigationTitle("DKDK")
                .customNaviagationLogoButtonHidden(true)
            }
        }
    }
}

struct HomeMainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainView()
    }
}
