//
//  SignUpInputView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/13.
//

import SwiftUI

struct SignUpInputView: View {
    var isSecureMode: Bool = false // 비밀번호 모드인지 여부값
    var isAuthButtonVisible: Bool = false // 인증하기 버튼 노출여부값

    // input + placeholder + info문구
    var placeholder: String
    @Binding var inputStr: String
    var infoStr: String
    @Binding var inputStateType: SignUpInputStateType

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if isSecureMode {
                    SecureField("", text: $inputStr)
                        .placeholder(when: inputStr.isEmpty) {
                            Text(placeholder).foregroundColor(inputStateType.getInputColor())
                    }
                        .foregroundColor(inputStateType.getInputColor())
                        .font(.system(size: 16, weight: .medium))
                        .textContentType(.newPassword)
                }
                else {
                    TextField("", text: $inputStr)
                        .placeholder(when: inputStr.isEmpty) {
                            Text(placeholder).foregroundColor(inputStateType.getInputColor())
                    }
                        .foregroundColor(inputStateType.getInputColor())
                        .font(.system(size: 16, weight: .medium))
                }
                if isAuthButtonVisible {
                    Button("인증하기") {
                        if inputStateType == .available {
                            inputStateType = .authWaiting
                        }
                    }
                    .frame(width: 63, height: 36)
                    .foregroundColor(Color(hex:"18171D"))
                    .font(.system(size: 13, weight: .regular))
                    .conditionalModifier(inputStateType == .available || inputStateType == .authWaiting, ifTrue: { view in
                        view.background(Color(hex:"22FFAF"))
                    }, ifFalse: { view in
                        view.background(Color(hex:"D9D9D9"))
                    })
                    .cornerRadius(6)
                    .disabled(inputStateType != .available)
                }
            }
            Divider()
                .background(inputStateType.getInputColor())
            Text(infoStr)
                .foregroundColor(inputStateType.getInfoStateColor())
                .font(.system(size: 13, weight: .regular))
        }
        .padding(.top, 24)
    }
}
