//
//  healthRoutineAppApp.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/06.
//

import SwiftUI

@main
struct healthRoutineApp: App {

    var body: some Scene {
        
        WindowGroup {
            
            let dateHolder = DateHolder()
            
            SplashView()
                .environmentObject(dateHolder)
        }
    }
}
