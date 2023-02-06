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

struct BadgeLatestResult: Codable {
    let index: Int
    let subject: String
}

struct BadgeListResult: Codable {
    
    let exerciseStart: Bool
    let exerciseHappy: Bool
    let exerciseHolic: Bool
    let exerciseMaster: Bool
    let exerciseChampion: Bool
    let sincerityJunior: Bool
    let sincerityPro: Bool
    let sincerityMaster: Bool
    let sincerityChampion: Bool
    let drinkHoneyHoney: Bool
    let drinkBulkUpBulkUp: Bool
    let drinkHippo: Bool
    let latestBadge: BadgeLatestResult
}



