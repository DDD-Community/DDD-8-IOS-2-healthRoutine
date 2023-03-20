//
//  NickNameView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/15.
//

import SwiftUI


struct NickNameView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var selection: String? = nil
    @Binding var isRootVisible : Bool
    
    var body: some View {
        BaseView {
            VStack {
                SignUpInputView(placeholder: SignUpStringType.nickname.getPlaceHolderStr(), inputStr: $viewModel.nickname, infoStr: viewModel.nicknameInfo, inputStateType: $viewModel.nicknameState)
                Spacer()
                NavigationLink(destination: SignUpCompleteView(isRootVisible: $isRootVisible).navigationBarBackButtonHidden(true), tag: "1", selection: $selection) { EmptyView() }
                BottomButtonView(buttonTitle: "다음", isable: viewModel.canNextCompleteStep) {
                    self.handleNextButton()
                }
            }
        }
    }
    
    func handleNextButton() {
        viewModel.requestSignUp() { result in
            if result {
                self.selection = "1"
            }
            else {
                self.isRootVisible = false
            }
        }
    }
}
