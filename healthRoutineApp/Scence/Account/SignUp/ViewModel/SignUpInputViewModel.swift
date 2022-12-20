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
    case nickname

    func getPlaceHolderStr() -> String {
        switch self {
        case .email:
            return "이메일 주소"
        case .password:
            return "비밀번호"
        case .passwordconfirm:
            return "비밀번호 확인"
        case .nickname:
            return "닉네임"
        }
    }

    func getHelpStr() -> String {
        switch self {
        case .email:
            return "*비밀번호 분실에 안내 메일이 발송됩니다."
        case .password:
            return "*영문, 숫자, 특수문자 조합 8자리 이상"
        case .nickname:
            return "*2자 이상 8자 이하 한글, 영문, 숫자로 구성"
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
        case .nickname:
            return "*2자 이상 8자 이하 한글, 영문, 숫자로 구성"
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
        case .nickname:
            return "사용가능한 닉네임입니다."
        }
    }
}


class SignUpInputViewModel: ObservableObject {
    @Published var inputStr: String = ""
    var inputType: SignUpInputType

    init(inputType: SignUpInputType) {
        self.inputType = inputType
    }

    enum InputInfoState: String {
        case invalid
        case success
        case warning

        func getInfoStateColor() -> Color {
            switch self {
            case .invalid:
                return Color(hex: "888888")
            case .success:
                return Color(hex: "22FFAF")
            case .warning:
                return Color(hex: "FF0000")
            }
        }
    }

    func getInputColor() -> Color {
        if self.inputStr.isValid {
            return Color(hex: "C9C9C9")
        }
        else {
            return Color(hex: "888888")
        }
    }

    func getInputState() -> InputInfoState {
        if self.inputStr.isValid {
            if self.checkInputValid() {
                return .success
            }
            else {
                return .warning
            }
        }
        else {
            return .invalid
        }
    }

    func checkInputValid() -> Bool {
        switch inputType {
        case .email:
            if self.inputStr.isValidEmail {
                return true
            }
            else {
                return false
            }
        case .password:
            if self.inputStr.isValidPassword {
                return true
            }
            else {
                return false
            }
        case .passwordconfirm:
            return false
        case .nickname:
            if self.inputStr.isValidNickname {
                return true
            }
            else {
                return false
            }
        }
    }

    func getInfoStr() -> String {
        let state = getInputState()
        switch state {
        case .invalid:
            return self.inputType.getHelpStr()
        case .success:
            return self.inputType.getSuccessStr()
        case .warning:
            return self.inputType.getWarningStr()
        }
    }
}
