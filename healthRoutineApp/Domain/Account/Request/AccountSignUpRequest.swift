//
//  AccountSignUpRequest.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/25.
//

import Foundation

struct AccountSignUpRequest: Codable {
    
    let email: String
    let password: String
    let nickname: String
}
