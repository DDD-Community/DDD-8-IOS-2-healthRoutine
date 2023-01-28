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
}

struct BadgeLastestResponse: Codable {
    
    let code: Int
    let message: String
    let result: BadgeLatestResult
}

struct BadgeLatestResult: Codable {
    
    let subject: String
}
