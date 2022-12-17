//
//  LogInMainView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/13.
//

import SwiftUI

struct LogInMainView: View {
    
    var body: some View {
        
        CustomNavigationView {
            
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
                CustomNavigationLink(destination: SignUpMainView().customNavigationTitle("회원가입")
                ) {
                    Text("회원가입")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .background(Color(.darkGray))
                        .cornerRadius(10)
                }
                
                // MARK: - 로그인 뷰 이동 처리
                CustomNavigationLink(destination: SignInView()) {
                    Text("로그인")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .background(Color(.darkGray))
                        .cornerRadius(10)
                }
            }
            .customNavigationBarBackButtonHidden(true)
            .padding(20)
        }
    }
}

struct LogInMainView_Previews: PreviewProvider {
    static var previews: some View {
        LogInMainView()
    }
}