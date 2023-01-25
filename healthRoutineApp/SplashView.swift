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
            
            ZStack {
                
                VStack {
                    
                    Image("splash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 180)
                }
                .onAppear {
                    
                    if UserDefaults.isFirstAppLaunch() {
                        KeychainService.shared.deleteToken()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background_black)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
