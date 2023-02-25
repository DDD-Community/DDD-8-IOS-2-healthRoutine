//
//  WaterAPI.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/26.
//

import Foundation
import Alamofire
import Combine

enum WaterAPI {
    
    case waterAmount
    
    var url: String {
        
        switch self {
        case .waterAmount: return "\(HealthRoutineAPI.baseURL)/water"       // 상세
        }
    }
}

extension APIService {
    
    static func getWaterAmount() -> AnyPublisher<WaterAmountResponse, APIError> {

        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])

        return APIManager.request(WaterAPI.waterAmount.url, method: .get, headers: headers)
    }

    static func updateWaterAmount(_ param: WaterAmountUpdateRequest) -> AnyPublisher<DI_Base, APIError> {

        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])

        return APIManager.request(WaterAPI.waterAmount.url, method: .post, parameters: param.intDictionary, headers: headers)
    }
}
