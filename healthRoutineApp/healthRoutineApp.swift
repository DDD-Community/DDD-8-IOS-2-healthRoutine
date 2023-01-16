//
//  healthRoutineAppApp.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/06.
//

import SwiftUI

@main
struct healthRoutineApp: App {

    @StateObject private var viewRouter = ViewRouter()

    var body: some Scene {
        
        WindowGroup {
            
            let dateHolder = DateHolder()
            
            SplashView()
                .environmentObject(dateHolder)
                .environmentObject(viewRouter)
        }
    }
}
