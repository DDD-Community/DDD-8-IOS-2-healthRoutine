//
//  AccountAPIs.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation

enum AccountAPI {
    
    case signUp
    case signIn
    
    var url: String {
        
        switch self {
            
        case .signUp: return "\(HealthRoutineAPI.baseURL)/user/register"
        case .signIn: return "\(HealthRoutineAPI.baseURL)/user/login"
        }
    }
    
    enum Parm {
        
        case email(String)
        case password(String)
        case nickname(String)
        
        var key: String {
            switch self {
            case .email: return "email"
            case .password: return "password"
            case .nickname: return "nickname"
            }
        }
        
        var value: Any? {
            switch self {
            case .email(let value): return value
            case .password(let value): return value
            case .nickname(let value): return value
            }
        }
    }
}
