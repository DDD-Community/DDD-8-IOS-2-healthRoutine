//
//  SignUpInputView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/13.
//

import SwiftUI

struct SignUpInputView: View {
    @ObservedObject var signUpInputVM: SignUpInputViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if signUpInputVM.inputType == .email || signUpInputVM.inputType == .nickname {
                    TextField(signUpInputVM.inputType.getPlaceHolderStr(), text: $signUpInputVM.inputStr)
                        .foregroundColor(signUpInputVM.getInputColor())
                        .font(.system(size: 16, weight: .medium))
                }
                else {
                    SecureField(signUpInputVM.inputType.getPlaceHolderStr(), text: $signUpInputVM.inputStr)
                        .foregroundColor(signUpInputVM.getInputColor())
                        .font(.system(size: 16, weight: .medium))
                }
            }
            Divider()
                .background(signUpInputVM.getInputColor())
            Text(signUpInputVM.getInfoStr())
                .foregroundColor(signUpInputVM.getInputState().getInfoStateColor())
                .font(.system(size: 13, weight: .regular))
        }
        .padding(.top, 24)
    }
}

struct SignUpInputView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInputView(signUpInputVM: SignUpInputViewModel(inputType: .email))
    }
}
