//
//  AccountSignInRequest.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/18.
//

import Foundation

struct AccountSignInRequest: Codable {
    
    let email: String
    let password: String
}

struct AccountSignUpRequest: Codable {
    let email: String
    let password: String
    let nickname: String
}

struct AccountUpdateNicknameRequest: Codable {
    let nickname: String
}

struct AccountUpdateProfileImageRequest: Codable {
    let file: Data
}
