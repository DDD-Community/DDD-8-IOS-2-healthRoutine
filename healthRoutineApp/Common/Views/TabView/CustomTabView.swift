//
//  CustomTabView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/29.

import SwiftUI

enum TabItem: String, CaseIterable {
    case home
    case report
    case timer
    case mypage
    
    var selectedIcon: String {
        switch self {
        case .home:
            return "mainOn"
            
        case .report:
            return "reportOn"
            
        case .timer:
            return "timerOn"
            
        case .mypage:
            return "myPageOn"
        }
    }
    
    var unselectedIcon: String {
        switch self {
        case .home:
            return "main"
            
        case .report:
            return "report"
            
        case .timer:
            return "timer"
            
        case .mypage:
            return "myPage"
        }
    }
}

struct CustomTabbarView: View {
    var tabItems: [TabItem]
    @Binding var selected: TabItem
    
    init(tabItems: [TabItem], selected: Binding<TabItem>) {
        UITabBar.appearance().isHidden = true
        self.tabItems = tabItems
        self._selected = selected
    }
    
    var body: some View {
        HStack(spacing: 0){
            
            ForEach(tabItems,id: \.self){value in
                GeometryReader{ _ in
                    BarButton(selected: $selected, value: value)
                }
                .frame(height: 56)
            }
        }
        .background(Color.background_black)
        .ignoresSafeArea(.all, edges: .horizontal)
    }
}
struct BarButton : View {
    @Binding var selected : TabItem
    
    var value: TabItem
    
    var body: some View{
        Button(action: {
            selected = value
        }, label: {
            VStack{
                Image(selected == value ? value.selectedIcon : value.unselectedIcon)
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.size.width / CGFloat(TabItem.allCases.count), height: 56)
        })
    }
}
