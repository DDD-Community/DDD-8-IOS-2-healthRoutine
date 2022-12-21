//
//  SignInView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/30.
//

import SwiftUI
import Combine

struct SignInView: View {
    
    @ObservedObject private var viewModel = SignInViewModel()
    
    @Binding var hasToken: Bool
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Image(systemName: "heart.fill")
                .font(.system(size: 200))
            
            SignInInputView(title: "아이디", placeholder: "아이디를 입력해 주세요.", value: $viewModel.email, isAble: $viewModel.isActiveEmailField)
            SignInInputView(title: "비밀번호", placeholder: "비밀번호를 입력해주세요.", value: $viewModel.password, isAble: $viewModel.isActivePasswordField)
            
            Text(self.viewModel.errrorMsg)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(.red)
            
            Button("로그인") {
                self.viewModel.signInWith()
            }
            .buttonStyle(CommonButtonView())
            .disabled(!viewModel.canSubmit)
            
            Spacer()
        }
        .padding(.top, 100)
        .padding(.horizontal, 20)
    }
}

struct SignInInputView: View {

    var title: String
    var placeholder: String
    
    @Binding var value: String
    @Binding var isAble: Bool
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $value)
                
            Divider()
                .frame(height: 2)
                .background(self.isAble ? .green : .gray)
        }
    }
}

//struct LogInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView(
//    }
//}
