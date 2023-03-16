//
//  HomeDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/20.
//

import SwiftUI

struct HomeDetailView: View {
    
    @ObservedObject var viewModel: CalendarViewModel
    
    init(viewModel: CalendarViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        BaseView {
            ScrollView {
                VStack(spacing: 16) {
                    CalendarView(viewModel: viewModel, isMainView: false)
                            .environmentObject(DateHolder())
                    HomeDetailTabView(viewModel: viewModel)
                }
            }
        }
    }
}
