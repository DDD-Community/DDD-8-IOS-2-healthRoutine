//
//  HealthRoutineAPI.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/27.
//

import Foundation

enum HealthRoutineAPI {
    
    static let baseURL: String = "https://rest-api.xyz/api/v1"
    
    enum Header: APIHeader {
        
        static let authFieldName: String = "Authorization"
        
        case auth(String)
        case contentMulti
        
        var key: String {
            
            switch self {
            case .auth: return HealthRoutineAPI.Header.authFieldName
            case .contentMulti: return "Content-Type"
            }
        }
        
        var value: String {
            
            switch self {
            case .auth(let value): return "Bearer \(value)"
            case .contentMulti:return "multipart/form-data; boundary=\(APIConst.boundary)"
            }
        }
    }
}
