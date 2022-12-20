//
//  SignUpMainView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/13.
//

import SwiftUI
import Combine


struct SignUpMainView: View {
    var signUpVM: SignUpMainViewModel = SignUpMainViewModel()

    var body: some View {
        VStack {
            SignUpInputView(signUpInputVM: SignUpInputViewModel(inputType: .email))
            SignUpInputView(signUpInputVM: SignUpInputViewModel(inputType: .password))
            SignUpInputView(signUpInputVM: SignUpInputViewModel(inputType: .passwordconfirm))
            Spacer()
            Button("통신테스트", action: test)
                .frame(width: 60, height: 60)

            /*
            BottomButtonView(buttonTitle: "다음")
                .padding(.bottom, 24)*/
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

    func test() {
        signUpVM.requestTest()

    }
}
 
struct SignUpMainView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpMainView()
    }
}
