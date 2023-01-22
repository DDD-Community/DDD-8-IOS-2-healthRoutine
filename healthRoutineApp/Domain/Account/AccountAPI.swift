//
//  AccountAPIs.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation


// MARK: API Header Protocol
protocol APIHeader {
    var key: String { get }
    var value: String { get }
}

enum AccountAPI {
    
    case checkEmailValidation
    case signUp
    case signIn
    
    case userInfo
    
    var url: String {
        
        switch self {
        case .checkEmailValidation: return "\(HealthRoutineAPI.baseURL)/user/validate/email"
        case .signUp: return "\(HealthRoutineAPI.baseURL)/user/register"
        case .signIn: return "\(HealthRoutineAPI.baseURL)/user/login"
        case .userInfo: return "\(HealthRoutineAPI.baseURL)/user/profile"
        }
    }
    
    enum Header: APIHeader {
        
        static let authFieldName: String = "Authorization"
        
        case auth(String)
        
        var key: String {
            
            switch self {
            case .auth: return AccountAPI.Header.authFieldName
            }
        }
        
        var value: String {
            
            switch self {
            case .auth(let value): return "Bearer \(value)"
            }
        }
    }

    /*

    enum Param: APIParameter {
        
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
    }*/
}
