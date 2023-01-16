//
//  SplashView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive: Bool = false
    @EnvironmentObject var dateHolder: DateHolder
    @EnvironmentObject private var viewRouter: ViewRouter
    
    var body: some View {
        
        if isActive {
            if viewRouter.currentView == .home {
                ContentView().environmentObject(dateHolder)
            }
            else {
                AccountMainView()
            }

        } else {
            
            VStack {
                
                VStack(spacing: 20) {
                
                    Image(systemName: "heart.fill")
                        .font(.system(size: 100))
                    
                    Text("Splash Test")
                }
            }
            .onAppear {
                
                if UserDefaults.isFirstAppLaunch() {
                    KeychainService.shared.deleteToken()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
