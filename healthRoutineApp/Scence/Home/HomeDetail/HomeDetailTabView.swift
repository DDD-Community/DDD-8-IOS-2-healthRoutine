//
//  HomeDetailTabView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/15.
//

import Foundation
import SwiftUI

struct HomeDetailTabView: View {
    
    @State var currentTab: Int = 0
    
    @ObservedObject var waterVM = HomeWaterIntakeViewModel()
    @ObservedObject var calendarVM = CalendarViewModel()
    @ObservedObject private var viewModel: ReportViewModel
    
    init() {
        viewModel = ReportViewModel()
        viewModel.fetchList()
    }
    
    var body: some View {
        
        VStack(spacing: 2) {
            
            tabBarView
            
            TabView(selection: self.$currentTab, content: {
                
                VStack {
                    
                    ScrollView {
                        
                        ForEach(viewModel.exerciseArray, id: \.self) { item in
                            ReportMainRowView(item: item)
                                .frame(minHeight: 78)
                        }
                        
                        ForEach(calendarVM.exerciseArray, id: \.self) { item in
                            ReportMainRowView(item: item)
                                .frame(minHeight: 78)
                        }
                    }
                }
                .padding(.vertical, 16)
                .tag(0)

                VStack(alignment: .leading, spacing: 17) {
                    Text("ddd")
                        .foregroundColor(.white_text)
                        .font(Font.pretendard(.medium, size: 14))
                    GIFView(name: self.waterVM.gifName)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            Text("\(self.waterVM.waterAmount) ml")
                                .font(Font.pretendard(.bold, size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                }
                .tag(1)
            })
            .padding(.horizontal, 24)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(minHeight: 150)
        }
        .padding(.vertical, 16)
//        .frame(maxWidth: .infinity, minHeight: 148)
        .background(Color.box_color)
        .cornerRadius(16)
//        .onAppear {
//            
//            self.calendarVM.exerciseArrayStream
//                .sink { result in
//                    print("result Count: \(result)")
//                }
//                .store(in: &self.viewModel.cancellables)
//        }
    }
    
    var tabBarView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 24) {
                ForEach(Array(["운동하기", "물마시기"].enumerated()), id: \.1) {
                    index, name in
                    tabBarItem(string: name, tab: index)
                }
            }
        }
        .padding(.horizontal, 24)
        .frame(height: 31)
    }
    
    func tabBarItem(string: String, tab: Int) -> some View {
        Button {
            self.currentTab = tab
        } label: {
            
            VStack {
                Text(string)
                    .font(Font.pretendard(.medium, size: 16))
                    .foregroundColor(.exercise_level1)
                if self.currentTab == tab {
                    Color.main_green.frame(height: 2)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

struct HomeDetailTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailTabView()
    }
}
