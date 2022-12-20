//
//  SignUpMainView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/13.
//

import SwiftUI
import Combine


struct SignUpMainView: View {
    @ObservedObject private var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            SignUpInputView(placeholder: "이메일 주소", inputStr: $viewModel.email, infoStr: viewModel.emailInfo, inputStateType: viewModel.emailState)
            SignUpInputView(isSecureMode: true, placeholder: "비밀번호", inputStr: $viewModel.password, infoStr: viewModel.passwordInfo, inputStateType: viewModel.passwordState)
            SignUpInputView(isSecureMode: true, placeholder: "비밀번호 확인", inputStr: $viewModel.passwordConfirm, infoStr: viewModel.passwordConfirmInfo, inputStateType: viewModel.passwordConfirmState)
            Spacer()

            // MARK: - 회원가입 뷰 이동 처리
            CustomNavigationLink(destination: NickNameView().customNavigationTitle("회원가입")
            ) {
                Text("다음")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                    .background(Color(.darkGray))
                    .cornerRadius(10)
            }
            .padding(.bottom, 24)
        }
        .padding([.leading, .trailing], 20)
    }
}
 
struct SignUpMainView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpMainView()
    }
}
