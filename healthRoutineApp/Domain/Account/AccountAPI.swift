//
//  AccountAPIs.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation

enum AccountAPI {
    
    case checkEmailValidation
    case signUp
    case signIn
    
    case userInfo // 업로드 이후 해당 통신사용
    case updateProfileImage // 임시 업로드
    
    var url: String {
        
        switch self {
    
        case .checkEmailValidation: return "\(HealthRoutineAPI.baseURL)/user/validate/email"
        case .signUp: return "\(HealthRoutineAPI.baseURL)/user/register"
        case .signIn: return "\(HealthRoutineAPI.baseURL)/user/login"
        case .userInfo: return "\(HealthRoutineAPI.baseURL)/user/profile"
        case .updateProfileImage: return  "\(HealthRoutineAPI.baseURL)/user/profile/img-upload"
        }
    }
}
