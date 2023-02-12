//
//  BadgeResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/28.
//

import Foundation

struct BadgeListResponse: Codable {
    let code: Int
    let message: String
    let result: BadgeListResult
}

struct BadgeListResult: Codable {
    
    let myBadge: [String]?
    let waitingBadge: [String]?
    let latestBadge: String?
}



