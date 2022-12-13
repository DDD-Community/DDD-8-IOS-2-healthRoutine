//
//  LogInMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI

struct LogInMainView: View {
    
    @State var openSignUpView: Bool = false
    @State var openLogInView: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 16) {
                
                TabView {
                    Text("1")
                    Text("2")
                    Text("3")
                    Text("4")
                }
                .frame(maxWidth: .infinity, maxHeight: 540)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .background(Color.gray)
                
                // MARK: - 회원가입 뷰 이동 처리
                NavigationLink(isActive: $openSignUpView) {
                    
                    // 회원가입 화면 넣어주세요!
                    
                } label: {
                    Button("회원가입") {
                        debugPrint("go To SignUp")
                    }
                    .buttonStyle(CommonButtonView())
                }

                // MARK: - 로그인 뷰 이동 처리
                NavigationLink(isActive: $openLogInView) {
                    
                    LogInView()
                    
                } label: {
                    Button("로그인") {
                        self.openLogInView = true
                    }
                    .buttonStyle(CommonButtonView())
                }
            }
            .padding(20)
        }
    }
}

struct LogInMainView_Previews: PreviewProvider {
    static var previews: some View {
        LogInMainView()
    }
}
