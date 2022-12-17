//
//  SignInView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/30.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject private var viewModel = SignInViewModel()
    
    @State var showingAlert: Bool = false
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Image(systemName: "heart.fill")
                .font(.system(size: 200))
            
            SignInInputView(title: "아이디", placeholder: "아이디를 입력해 주세요.", value: $viewModel.email, isAble: $viewModel.isActiveEmailField)
            SignInInputView(title: "비밀번호", placeholder: "비밀번호를 입력해주세요.", value: $viewModel.password, isAble: $viewModel.isActivePasswordField)
            
            Button("로그인") {
                self.viewModel.signInWith()
                self.showingAlert = true
            }
            .buttonStyle(CommonButtonView())
            .disabled(!viewModel.canSubmit)
            .alert("Alert Title", isPresented: $showingAlert) {
                Button("Ok") {}
            } message: {
                Text("This is alert dialog sample")
            }
            
            Spacer()
        }
        .padding(.top, 100)
        .padding([.leading, .trailing], 20)
    }
}

struct SignInInputView: View {

    var title: String
    var placeholder: String
    
    @Binding var value: String
    @Binding var isAble: Bool
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text(title)
                Spacer()
            }
            
            TextField(placeholder, text: $value)
                
            Divider()
                .frame(height: 2)
                .background(self.isAble ? .green : .gray)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}