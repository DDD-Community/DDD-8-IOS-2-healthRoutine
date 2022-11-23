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
            
            TimerView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("타이머")
                }
            
            MyPageView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("마이 페이지")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
