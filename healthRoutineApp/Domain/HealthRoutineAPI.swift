//
//  HealthRoutineAPI.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation

enum HealthRoutineAPI {
    
    static let baseURL: String = "http://rest-api.xyz/api/v1"
    
    // 개발 진행 예정
    struct Response: Codable {
        let status: String?
        let code: Int?
    }
}
