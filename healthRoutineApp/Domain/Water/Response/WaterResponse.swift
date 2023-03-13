//
//  WaterResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/26.
//

import Foundation

struct WaterAmountResult: Codable, Equatable {
    let capacity: Int
    let unit: String
}

struct WaterAmountResponse: Decodable, Equatable {
    
    let code: Int
    let message: String
    let result: WaterAmountResult
}

extension WaterAmountResponse {
    
    static func == (lhs: WaterAmountResponse, rhs: WaterAmountResponse) -> Bool {
        return lhs.code == rhs.code && lhs.message == rhs.message && lhs.result == rhs.result
    }
}
