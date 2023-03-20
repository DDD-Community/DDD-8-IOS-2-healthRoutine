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
    @Binding var isRootVisible : Bool

    var body: some View {
        BaseView {
            VStack {
                SignUpInputView(isAuthButtonVisible: true, placeholder: SignUpStringType.email.getPlaceHolderStr(), inputStr: $viewModel.email, infoStr: viewModel.emailInfo, inputStateType: $viewModel.emailState)
                SignUpInputView(isSecureMode: true, placeholder: SignUpStringType.password.getPlaceHolderStr(), inputStr: $viewModel.password, infoStr: viewModel.passwordInfo, inputStateType: $viewModel.passwordState)
                SignUpInputView(isSecureMode: true, placeholder: SignUpStringType.passwordconfirm.getPlaceHolderStr(), inputStr: $viewModel.passwordConfirm, infoStr: viewModel.passwordConfirmInfo, inputStateType: $viewModel.passwordConfirmState)
                Spacer()

                // MARK: - 회원가입 뷰 이동 처리
                CustomNavigationLink(destination: NickNameView(viewModel: self.viewModel, isRootVisible: $isRootVisible).customNavigationTitle("회원가입")) {
                    BottomButtonView(buttonTitle: "다음", isable: viewModel.canNextNicknameStep, preventButtonAction: true)
                }
                .frame(maxHeight: 84) // 60 + 24
                .disabled(!viewModel.canNextNicknameStep)
            }
        }
    }
}

//struct SignUpMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpMainView()
//    }
//}
