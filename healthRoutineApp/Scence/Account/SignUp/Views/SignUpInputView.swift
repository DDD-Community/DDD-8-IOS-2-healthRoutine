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
    
    var placeholder: String
    @Binding var inputStr: String
    
    var infoStr: String
    var inputStateType: SignUpInputStateType

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
                        print("인증하기")
                    }
                    .frame(width: 63, height: 36)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.black)
                    .background(Color(.darkGray))
                    .cornerRadius(6)
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
