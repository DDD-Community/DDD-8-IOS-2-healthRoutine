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
    
    var body: some View {
        VStack {
            SignUpInputView(placeholder: "닉네임", inputStr: $viewModel.nickname, infoStr: viewModel.nicknameInfo, inputStateType: $viewModel.nicknameState)
            Spacer()
            NavigationLink(destination: SignUpCompleteView(), tag: "1", selection: $selection) { EmptyView() }
            Button("다음") {
                self.handleNextButton()
            }
            .frame(maxWidth: .infinity, minHeight: 60)
            .font(.system(size: 18, weight: .bold))
            .background(viewModel.canNextStep ? Color(hex:"22ffaf") : Color(hex:"CFCFCF"))
            .foregroundColor(viewModel.canNextStep ? Color(hex:"18171d") : Color(hex:"888888"))
            .cornerRadius(10)
            .disabled(!viewModel.canNextStep)
            .padding(.bottom, 24)
        
        }
        .padding([.leading, .trailing], 20)
        .background(Color(hex:"18171d"))
        .ignoresSafeArea(.keyboard)
    }
    
    func handleNextButton() {
        viewModel.requestSignUp() {
            self.selection = "1"
        }
    }
}

struct NickNameView_Previews: PreviewProvider {
    static var previews: some View {
        NickNameView(viewModel: SignUpViewModel())
    }
}
