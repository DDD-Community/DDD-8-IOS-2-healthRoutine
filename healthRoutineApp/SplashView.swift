//
//  SplashView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI
import Combine

struct SplashView: View {
    
    @State private var isActive: Bool = false
    @EnvironmentObject var dateHolder: DateHolder
    @State var isRootVisible : Bool = false
    @EnvironmentObject private var viewRouter: ViewRouter
    
//    init() {
//        viewRouter.$changeFlag.sink(receiveValue: {_ in
//            isRootVisible = true
//        })
//    }

    var body: some View {
            if isActive {
                NavigationView {
                    NavigationLink(destination: {
                        VStack{
                            if KeychainService.shared.isTokenValidate() {
                                ContentView(isRootVisible: $isRootVisible)
                            }
                            else {
                                AccountMainView(isRootVisible: $isRootVisible)
                            }
                        }
                    }(), isActive: $isRootVisible) {
                        EmptyView()
                    }
                    .navigationBarBackButtonHidden(true)
                    .hidden()
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
                .onAppear {
                    self.isRootVisible = true
                }
            }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
