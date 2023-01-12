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
    
    var body: some View {
        
        if isActive {
            if KeychainService.shared.isTokenValidate() {
                ContentView().environmentObject(dateHolder)
            }
            else {
                ContentView().environmentObject(dateHolder)
//                AccountMainView()
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
