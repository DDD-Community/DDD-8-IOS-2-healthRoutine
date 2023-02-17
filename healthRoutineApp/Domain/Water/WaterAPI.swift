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
    
    case updateWaterAmount
    case detailWaterAmount
    
    var url: String {
        
        switch self {
        case .updateWaterAmount: return "\(HealthRoutineAPI.baseURL)/water/today" // 기존 (금일)
        case .detailWaterAmount: return "\(HealthRoutineAPI.baseURL)/water"       // 상세
        }
    }
}

extension APIService {
    
    static func getWaterAmount() -> AnyPublisher<WaterAmountResponse, APIError> {

        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])

        return APIManager.request(WaterAPI.updateWaterAmount.url, method: .get, headers: headers)
    }

    static func updateWaterAmount(_ param: WaterAmountUpdateRequest) -> AnyPublisher<DI_Base, APIError> {

        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])

        return APIManager.request(WaterAPI.updateWaterAmount.url, method: .post, parameters: param.intDictionary, headers: headers)
    }
}
