//
//  SignUpViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/20.
//

import Foundation
import Combine
import SwiftUI

enum SignUpInputStateType: String {
    case empty // input 비어있음
    case available
    case unavailable
    case authWaiting
    case authComplete
    case authFail

    func getInputColor() -> Color {
        switch self {
        case .empty:
            return .gray_888
        default:
            return Color(hex: "C9C9C9")
        }
    }

    func getInfoStateColor() -> Color {
        switch self {
        case .empty:
            return .gray_888
        case .available, .authComplete, .authWaiting:
            return .available_green
        case .unavailable, .authFail:
            return .error_red
        }
    }
}

enum SignUpStringType: String, CaseIterable {
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
            return "*이메일 형식으로 입력해주세요."
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
            return "*사용 가능한 이메일입니다."
        case .password:
            return "*사용 가능한 비밀번호입니다."
        case .passwordconfirm:
            return "비밀번호가 일치합니다."
        case .nickname:
            return "사용가능한 닉네임입니다."
        }
    }
}

class SignUpViewModel: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []

    // 이메일
    @Published var email: String = ""
    @Published var emailState: SignUpInputStateType = .empty
    @Published var emailInfo: String = ""


    // 비밀번호
    @Published var password: String = ""
    @Published var passwordState: SignUpInputStateType = .empty
    var passwordInfo: String = ""

    // 비밀번호 확인
    @Published var passwordConfirm: String = ""
    @Published var passwordConfirmState: SignUpInputStateType = .empty
    var passwordConfirmInfo: String = ""

    // 닉네임
    @Published var nickname: String = ""
    @Published var nicknameState: SignUpInputStateType = .empty
    var nicknameInfo: String = ""
    
    // 다음버튼용
    @Published var canNextNicknameStep: Bool = false
    @Published var canNextCompleteStep: Bool = false

    let apiWorker = AccountAPIWorker()

    init() {
        self.bindView()
    }

    private func bindView() {
        $email
            .removeDuplicates()
            .sink(receiveValue: { str in
                print(str)
                if self.emailState == .authWaiting { return }
                if str.isValid {
                    if str.isValidEmail {
                        self.emailState = .available
                        self.emailInfo = SignUpStringType.email.getSuccessStr()
                    }
                    else {
                        self.emailState = .unavailable
                        self.emailInfo = SignUpStringType.email.getWarningStr()
                    }
                }
                else {
                    self.emailInfo = SignUpStringType.email.getHelpStr()
                    self.emailState = .empty
                }

            })
            .store(in: &cancellables)
        
        $password
            .sink(receiveValue: { str in
                if str.isValid {
                    if str.isValidPassword {
                        self.passwordState = .available
                        self.passwordInfo = SignUpStringType.password.getSuccessStr()
                    }
                    else {
                        self.passwordState = .unavailable
                        self.passwordInfo = SignUpStringType.password.getWarningStr()
                    }
                }
                else {
                    self.passwordInfo = SignUpStringType.password.getHelpStr()
                    self.passwordState = .empty
                }
                if self.passwordConfirm.isValid {
                    self.comparePassword(str, self.passwordConfirm)
                }
            })
            .store(in: &cancellables)
        
        $passwordConfirm
            .sink(receiveValue: { str in
                if str.isValid {
                    self.comparePassword(self.password, str)
                }
                else {
                    self.passwordConfirmInfo = SignUpStringType.passwordconfirm.getHelpStr()
                    self.passwordConfirmState = .empty
                }
                
            })
            .store(in: &cancellables)

        $emailState
            .sink(receiveValue: { state in
                if state == .authWaiting {
                    self.emailInfo = ""
                    self.requestEmailValidation()
                }
            })
            .store(in: &cancellables)
        
        $nickname
            .sink(receiveValue: { str in
                if str.isValid {
                    if str.isValidNickname {
                        self.nicknameState = .available
                        self.nicknameInfo = SignUpStringType.nickname.getSuccessStr()
                        self.canNextCompleteStep = true
                    }
                    else {
                        self.nicknameState = .unavailable
                        self.nicknameInfo = SignUpStringType.nickname.getWarningStr()
                        self.canNextCompleteStep = false
                    }
                }
                else {
                    self.nicknameState = .empty
                    self.nicknameInfo = SignUpStringType.nickname.getHelpStr()
                    self.canNextCompleteStep = false
                }
            })
            .store(in: &cancellables)
        
        Publishers.CombineLatest3($emailState, $passwordState, $passwordConfirmState)
            .map { email, password, passwordConfirm in
                if email == .authComplete && password == .available && passwordConfirm == .available {
                    return true
                }
                else {
                    return false
                }
            }
            .assign(to: \.canNextNicknameStep, on: self)
            .store(in: &cancellables)
        
    }
    
    func comparePassword(_ password: String, _ passwordConfirm: String) {
        if password == passwordConfirm {
            self.passwordConfirmState = .available
            self.passwordConfirmInfo = SignUpStringType.passwordconfirm.getSuccessStr()
        }
        else {
            self.passwordConfirmState = .unavailable
            self.passwordConfirmInfo = SignUpStringType.passwordconfirm.getWarningStr()
        }
    }
    
    func requestEmailValidation() {
        APIService.checkEmailValidation(self.email)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.emailState = .authFail
                    switch error {
                    case .http(let error):
                        if error.errorCode == 409 {
                            self.emailInfo = "*중복된 이메일입니다."
                        }
                        else {
                            self.emailInfo = "*이메일 인증 오류입니다."
                        }
                    default:
                        self.emailInfo = "*이메일 인증 오류입니다."
                    }
                case .finished:
                    break
                }
            } receiveValue: { _ in
                self.emailInfo = "*인증이 완료되었습니다."
                self.emailState = .authComplete
            }
            .store(in: &cancellables)
    }
    
    func requestSignUp(_ completeClosure: BoolClosure?) {
        let request = AccountSignUpRequest(email: self.email, password: self.password, nickname: self.nickname)
        
        APIService.signUp(request)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    switch error {
                    case .http(let error):
                        if error.errorCode == 409 {
                            print("얼럿 띄우기 : 이미 있는 이메일입니다.")
                        }
                        else {
                            print("얼럿 띄우기 : 회원가입 오류입니다.")
                        }
                    default:
                        print("얼럿 띄우기 : 회원가입 오류입니다.")
                        break
                    }
                case .finished:
                    self.signIn(completeClosure)
                }
            } receiveValue: { _ in
            }
            .store(in: &cancellables)
    }
    
    func signIn(_ completeClosure: BoolClosure?) {
        let request = AccountSignInRequest(email: self.email, password: self.password)
        
        APIService.signIn(request)
            .sink { completion in
                switch completion {
                case .failure:
                    completeClosure?(false)
                case .finished:
                    completeClosure?(true)
                }
            } receiveValue: { (value: AccountResponse?) in
                if let value = value, let token = value.result.token {
                    KeychainService.shared.saveToken(token: token)
                    UserDefaults.standard.set(value.result.nickname, forKey: NICKNAME_KEY)
                }
            }
            .store(in: &cancellables)
    }
}
