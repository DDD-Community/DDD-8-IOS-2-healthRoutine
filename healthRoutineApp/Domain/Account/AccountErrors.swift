//
//  AccountErrors.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation

enum AccountErrors: Error {
    
    public enum SignUpErrorReason {
        
        case invalidEmail
        case invalidPassword
        case duplicatedEmail
        case duplicatedNickname
    }
    
    public enum SignInErrorReason {
        
        case accountNotExist
        case wrongPassword
    }
}

extension AccountErrors.SignUpErrorReason: CaseIterable {
    
    var errorCode: Int {
        
        switch self {
        case .invalidEmail: return 400
        case .invalidPassword: return 400
        case .duplicatedEmail: return 409
        case .duplicatedNickname: return 409
        }
    }
    
    var errorDescription: String? {
        
        switch self {
        case .invalidEmail: return "형식에 맞지 않는 이메일"
        case .invalidPassword: return "형식에 맞지 않는 비밀번호"
        case .duplicatedEmail: return "이미 있는 이메일"
        case .duplicatedNickname: return "이미 있는 닉네임"
        }
    }
}

extension AccountErrors.SignInErrorReason: CaseIterable {
    
    var errorCode: Int {
        switch self {
        case .accountNotExist: return 401
        case .wrongPassword: return 404
        }
    }
    
    var errorDescription: String? {

        switch self {
        case .accountNotExist: return "잘못 된 비밀번호를 입력했을 시"
        case .wrongPassword: return "없는 이메일을 입력했을 시"
        }
    }
}
