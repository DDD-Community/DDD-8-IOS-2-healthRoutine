//
//  LogInView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/30.
//

import SwiftUI

struct LogInView: View {
    
    @ObservedObject var viewModel = LogInViewModel()
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Image(systemName: "heart.fill")
            
            LoginInputView(title: "아이디", placeholder: "아이디를 입력해 주세요.", value: $viewModel.id)
            LoginInputView(title: "비밀번호", placeholder: "비밀번호를 입력해주세요.", value: $viewModel.password)
            
            Button("로그인") {
                viewModel.signIn()
            }
            .buttonStyle(CommonButtonView())
            
            HStack {
                
                Text("회원가입")
                
                Divider().frame(height: 15)
                
                Text("이메일 찾기")
                
                Divider().frame(height: 15)
                
                Text("비밀번호 찾기")
            }
        }
        .padding(.top, 100)
        .padding([.leading, .trailing], 20)
    }
}

struct LoginInputView: View {

    var title: String
    var placeholder: String
    
    @Binding var value: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text(title)
                Spacer()
            }
            
            TextField(placeholder, text: $value)
            Divider()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
