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
        case .waterAmount: return "\(HealthRoutineAPI.baseURL)/water"
        }
    }
}

extension APIService {
    
    // MARK: 물 섭취량 확인
    static func getWaterAmount(_ param: WaterAmountRequest) -> AnyPublisher<WaterAmountResponse, APIError> {

        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])

        return APIManager.request(WaterAPI.waterAmount.url, method: .get, parameters: param.intDictionary, encoding: URLEncoding.queryString, headers: headers)
    }

    // MARK: 오늘 마신 물 추가 및 업데이트
    static func updateWaterAmount(_ param: WaterAmountUpdateRequest) -> AnyPublisher<DI_Base, APIError> {

        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])

        return APIManager.request(WaterAPI.waterAmount.url, method: .post, parameters: param.intDictionary, headers: headers)
    }
    
    // MARK: 오늘 물량 조회 (년, 월, 일)
    static func fetchTodayWaterAmount(_ param: WaterAmountRequest) -> AnyPublisher<WaterAmountResponse, APIError> {
        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])
        
        return APIManager.request(WaterAPI.waterAmount.url, method: .get, parameters: param.intDictionary, encoding: URLEncoding.queryString, headers: headers)
    }
}
