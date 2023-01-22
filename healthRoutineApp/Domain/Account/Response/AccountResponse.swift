//
//  AccountSignInResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/18.
//

import Foundation

struct AccountResponse: Decodable {
    let code: Int
    let message: String
    let result: AccountResult
}

struct AccountResult: Codable {
    let token: String?
    let email: String
    let nickname: String
}

struct AccountMyInfoProfileResponse: Decodable {
    
    let code: Int
    let message: String
    let result: AccountMyInfoProfileResult
}

struct AccountMyInfoProfileResult: Codable {
    
    let id: String
    let nickname: String
    let profileImage: String?
}
