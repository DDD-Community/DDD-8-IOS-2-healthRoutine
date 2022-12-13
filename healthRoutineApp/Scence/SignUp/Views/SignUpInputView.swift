//
//  SignUpInputView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/13.
//

import SwiftUI

struct SignUpInputView: View {
    @ObservedObject var SignUpManager: SignUpManager

    var body: some View {
        HStack {
            VStack {
                HStack {
                    TextField(SignUpManager.inputType.getPlaceHolderStr(), text: $SignUpManager.inputStr)
                    Image(systemName: "checkmark")
                }
                Divider()
                    .background(Color(hex: "888888"))
            }
        }
        .padding(.top, 24)
    }
}

struct SignUpInputView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInputView(SignUpManager: SignUpManager(inputType: .email))
    }
}
