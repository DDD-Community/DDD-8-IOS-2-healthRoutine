//
//  SignUpManager.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/13.
//

import Foundation
import SwiftUI

enum SignUpInputType: String, CaseIterable {
    case email
    case password
    case passwordconfirm

    func getPlaceHolderStr() -> String {
        switch self {
        case .email:
            return "이메일 주소"
        case .password:
            return "비밀번호"
        case .passwordconfirm:
            return "비밀번호 확인"
        }
    }

    func getHelpStr() -> String {
        switch self {
        case .email:
            return "*최초 인증 및 비밀번호 분실에 안내 메일이 발송됩니다."
        case .password:
            return "*영문, 숫자, 특수문자 조합 8자리 이상"
        default:
            return ""
        }
    }

    func getWarningStr() -> String {
        switch self {
        case .email:
            return "*올바르지 않은 이메일입니다."
        case .password:
            return "*영문, 숫자, 특수문자 조합 8자리 이상"
        case .passwordconfirm:
            return "*비밀번호가 일치하지 않습니다."
        }
    }

    func getSuccessStr() -> String {
        switch self {
        case .email:
            return "*사용 가능한 아이디입니다."
        case .password:
            return "*사용 가능한 비밀번호입니다."
        case .passwordconfirm:
            return "비밀번호가 일치합니다."
        }
    }
}

class SignUpManager: ObservableObject {
    @Published var inputStr: String = ""
    var inputType: SignUpInputType
    
    init(inputType: SignUpInputType) {
        self.inputType = inputType
    }
}
