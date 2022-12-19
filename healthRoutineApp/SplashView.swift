//
//  SplashView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI

struct SplashView: View {
    
   
    @State private var isActive: Bool = false
    
    var body: some View {
        
        if isActive {
            
            // 로그인이 완료 된 경우
            // ContentView()
            
            // 로그인이 완료되지 않은 경우
            LogInMainView()
                
        } else {
            
            VStack {
                
                VStack(spacing: 20) {
                
                    Image(systemName: "heart.fill")
                        .font(.system(size: 100))
                    
                    Text("Splash Test")
                }
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
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
