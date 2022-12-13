//
//  SignUpMainView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/13.
//

import SwiftUI


struct SignUpMainView: View {
    var body: some View {
        VStack {
            SignUpInputView(SignUpManager: SignUpManager(inputType: .email))
            SignUpInputView(SignUpManager: SignUpManager(inputType: .password))
            SignUpInputView(SignUpManager: SignUpManager(inputType: .passwordconfirm))
        }
        .padding([.leading, .trailing], 20)
    }
}
 


struct SignUpMainView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpMainView()
    }
}

