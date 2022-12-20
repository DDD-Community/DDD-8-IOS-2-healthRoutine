//
//  NickNameView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/15.
//

import SwiftUI

struct NickNameView: View {
    var body: some View {
        VStack {
            SignUpInputView(signUpInputVM: SignUpInputViewModel(inputType: .nickname))
            Spacer()
            BottomButtonView(buttonTitle: "다음")
                .padding(.bottom, 24)
        }
        .padding([.leading, .trailing], 20)
    }
}

struct NickNameView_Previews: PreviewProvider {
    static var previews: some View {
        NickNameView()
    }
}
