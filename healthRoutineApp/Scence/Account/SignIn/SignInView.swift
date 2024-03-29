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
    @EnvironmentObject private var viewRouter: ViewRouter
    
    var body: some View {
        BaseView {
            VStack(alignment: .center, spacing: 30) {

                Image("Splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 180)

                SignInInputView(title: "이메일", placeholder: "이메일 주소를 입력해주세요", isSecureMode: false, value: $viewModel.email, isAble: $viewModel.isActiveEmailField)
                SignInInputView(title: "비밀번호", placeholder: "영문, 숫자, 특수문자 조합 8자리 이상", isSecureMode: true, value: $viewModel.password, isAble: $viewModel.isActivePasswordField)

                Text(self.viewModel.errrorMsg)
                    .font(Font.pretendard(.regular, size: 13))
                    .foregroundColor(.error_red)
                
                Spacer()
                
                Button(action: self.viewModel.signInWith) {
                    
                    Text("로그인")
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .font(Font.pretendard(.bold, size: 18))
                        .foregroundColor(.black)
                        .background(viewModel.canSubmit ? Color.main_green : Color.button_disabled)
                        .foregroundColor(viewModel.canSubmit ? Color.background_black : Color.gray_888)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity, minHeight: 60)
                .disabled(!viewModel.canSubmit)
            }
            .onAppear { self.bindView() }
        }
    }
    
    private func bindView() {
     
        self.viewModel.signInFinished
            .receive(on: RunLoop.main)
            .sink(receiveValue: { _ in viewRouter.currentView = .home })
            .store(in: &self.viewModel.cancellables)
    }
}

struct SignInInputView: View {

    var title: String
    var placeholder: String
    var isSecureMode: Bool
    
    @Binding var value: String
    @Binding var isAble: Bool
    
    var body: some View {
        
        VStack {
            
            Text(title)
                .foregroundColor(Color(hex: "E2E1E5"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.pretendard(.medium, size: 16))
            
            if isSecureMode {
                SecureField("", text: $value)
                    .placeholder(when: value.isEmpty) {
                        Text(placeholder).foregroundColor(.gray_888)
                }
                    .foregroundColor(.gray_888)
                    .font(Font.pretendard(.medium, size: 16))
            }
            else {
                TextField("", text: $value)
                    .placeholder(when: value.isEmpty) {
                        Text(placeholder).foregroundColor(.gray_888)
                }
                    .foregroundColor(.gray_888)
                    .font(Font.pretendard(.medium, size: 16))
            }
                
            Divider()
                .frame(height: 1)
                .background(self.isAble ? Color.main_green : Color.gray_888)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
