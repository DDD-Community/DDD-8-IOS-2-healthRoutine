//
//  SignUpInputView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/13.
//

import SwiftUI

struct SignUpInputView: View {
    var isSecureMode: Bool = false
    var isAuthButtonVisible: Bool = false
    var placeholder: String

    @Binding var inputStr: String
    var infoStr: String
    var inputStateType: SignUpInputStateType

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if isSecureMode {
                    SecureField(placeholder, text: $inputStr)
                        .foregroundColor(inputStateType.getInputColor())
                        .font(.system(size: 16, weight: .medium))
                }
                else {
                    TextField(placeholder, text: $inputStr)
                        .foregroundColor(inputStateType.getInputColor())
                        .font(.system(size: 16, weight: .medium))
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

/*struct SignUpInputView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInputView()
    }
}
*/
