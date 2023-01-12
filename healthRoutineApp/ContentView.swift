//
//  ContentView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/06.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
            HomeMainView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            ReportMainView()
                .tabItem {
                    Image(systemName: "chart.bar")
                }
            
            TimerMainView()
                .tabItem {
                    Image(systemName: "clock")
                }
            
            MyPageMainView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(Color.available_green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
