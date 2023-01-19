//
//  ContentView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var section = 0
    
    var body: some View {
        
        TabView(selection: $section) {
            
            Group {
                
                HomeMainView()
                    .tabItem {
                        self.section == 0 ? Image("mainOn") : Image("main")
                    }
                    .tag(0)
                
                ReportMainView()
                    .tabItem {
                        self.section == 1 ? Image("reportOn") : Image("report")
                    }
                    .tag(1)
                
                TimerMainView()
                    .tabItem {
                        self.section == 2 ? Image("timerOn") : Image("timer")
                    }
                    .tag(2)
                
                MyPageMainView()
                    .tabItem {
                        self.section == 3 ? Image("myPageOn") : Image("myPage")
                    }
                    .tag(3)
            }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(Color.background_black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
