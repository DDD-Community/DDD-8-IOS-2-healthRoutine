//
//  LogInView.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/11/30.
//

import SwiftUI

struct LogInView: View {
    
    @ObservedObject private var viewModel = LogInViewModel()
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Image(systemName: "heart.fill")
                .font(.system(size: 200))
            
            LoginInputView(title: "아이디", placeholder: "아이디를 입력해 주세요.", value: $viewModel.email, isAble: $viewModel.isEamilAble)
            LoginInputView(title: "비밀번호", placeholder: "비밀번호를 입력해주세요.", value: $viewModel.password, isAble: $viewModel.isPasswordAble)
            
            Button("로그인") {
                print("버튼이 활성되면 클릭 버트")
            }
            .buttonStyle(CommonButtonView())
            .disabled(!viewModel.isValidButton)
            
            Spacer()
        }
        .padding(.top, 100)
        .padding([.leading, .trailing], 20)
    }
}

struct LoginInputView: View {

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
            
            TextField(placeholder, text: $value).background(self.isAble ? .gray : .red)
                
            Divider()
                .background(self.isAble ? .gray : .red)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
