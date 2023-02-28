//
//  HomeDetailView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/20.
//

import SwiftUI

struct HomeDetailView: View {
    var body: some View {
        BaseView {
            ScrollView {
                VStack(spacing: 16) {
                    CalendarView(isMainView: false)
                            .environmentObject(DateHolder())
                    HomeDetailTabView()
                }
            }
        }
    }
}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailView()
    }
}
