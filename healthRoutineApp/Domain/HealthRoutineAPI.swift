//
//  HealthRoutineAPI.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation
import Combine

protocol APIParameter {

    var key: String { get }
    var value: Any? { get }
}

enum HealthRoutineAPI {
    
    static let baseURL: String = "http://rest-api.xyz/api/v1"
    
    // 개발 진행 예정
    struct Response: Codable {
        let status: String?
        let code: Int?
    }

    // 아래에 api호출 리스트 정의? 이런식으로 하는게 좋을까여
    // sample
    static func sample() -> AnyPublisher<DI_Sample, ApiError> {
        return ApiManager.request("\(baseURL)/samplelele")
    }
}

class ResultBase: Decodable {
    var resultCode: String?
    var resultMsg: String?
}

class DI_Sample: ResultBase {
    var data: Any?
}
