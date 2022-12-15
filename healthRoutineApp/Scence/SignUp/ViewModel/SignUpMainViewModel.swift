//
//  SignUpMainViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/15.
//

import Foundation

class DI_SignUp {
    var email: String = ""
    var password: String = ""
}

class SignUpMainViewModel: ObservableObject {
    var signUpData: DI_SignUp = DI_SignUp()

    func requestSignup() {

    }
}
