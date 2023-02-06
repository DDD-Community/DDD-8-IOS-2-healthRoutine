//
//  BadgeAPI.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/28.
//

import Foundation
import Alamofire
import Combine

enum BadgeAPI {
    
    case badgeList
    
    var url: String {
        
        switch self {
        case .badgeList: return  "\(HealthRoutineAPI.baseURL)/user/badge/"
        }
    }
}

extension APIService {
    
    static func getBadgeList() -> AnyPublisher<BadgeListResponse, APIError> {
        
        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }
        
        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])
        
        return APIManager.request(BadgeAPI.badgeList.url, method: .get, headers: headers)
    }
}
