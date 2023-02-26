//
//  WaterRequest.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/26.
//

import Foundation

struct WaterAmountUpdateRequest: Codable {
    let capacity: Int
}

struct WaterAmountRequest: Codable {
    
    let year: Int
    let month: Int
    let day: Int
}
