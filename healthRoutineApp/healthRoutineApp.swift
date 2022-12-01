//
//  healthRoutineAppApp.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/06.
//

import SwiftUI

@main
struct healthRoutineApp: App {
    // 스플래스 잠시멈춤 역할 - 권장 x 일단 확인용으로 추가
    init() {
        Thread.sleep(forTimeInterval: 3)
    }
    
    var body: some Scene {
        WindowGroup {
            
            let dateHolder = DateHolder()
            
            ContentView()
                .environmentObject(dateHolder)
        }
    }
}
