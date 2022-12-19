//
//  AccountSignInResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/18.
//

import Foundation

struct AccountSignInResponse: Decodable {
    
    let code: Int
    let message: String
    let result: AccountResult
    let status: String
    let token: String
}

struct AccountResult: Codable {
    
    let email: String
    let nickname: String
}
