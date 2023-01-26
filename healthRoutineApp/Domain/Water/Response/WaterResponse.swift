//
//  WaterResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/26.
//

import Foundation

struct WaterAmountResult: Codable {
    let capacity: Int
    let unit: String
}

struct WaterAmountResponse: Decodable {
    let code: Int
    let message: String
    let result: WaterAmountResult
}
