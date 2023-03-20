//
//  HomeDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/20.
//

import SwiftUI

struct HomeDetailView: View {
    
    @ObservedObject var viewModel: CalendarViewModel
    @ObservedObject var waterVM: HomeWaterIntakeViewModel
    
    init(viewModel: CalendarViewModel, waterVM: HomeWaterIntakeViewModel) {
        self.viewModel = viewModel
        self.waterVM = waterVM
    }
    
    var body: some View {
        BaseView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    CalendarView(viewModel: viewModel, waterVM: waterVM, isMainView: false)
                            .environmentObject(DateHolder())
                    HomeDetailTabView(viewModel: viewModel, waterVM: waterVM)
                }
            }
        }
    }
}
