//
//  ContentView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/06.
//

import SwiftUI

struct ContentView: View {
    var tabItems = TabItem.allCases
    
    @State var selected: TabItem = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        TabView(selection: $selected) {
            
            HomeMainView()
                .tag(tabItems[0])
            
            ReportMainView()
                .tag(tabItems[1])
            
            TimerMainView()
                .tag(tabItems[2])
            
            MyPageMainView()
                .tag(tabItems[3])
        }
        Spacer(minLength: 0)
        CustomTabbarView(tabItems: tabItems, selected: $selected)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
