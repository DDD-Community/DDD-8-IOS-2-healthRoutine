//
//  DI_Category.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/02/10.
//

import Foundation

struct DI_Category: Codable {
    let id: Int
    let subject: String
    let exerciseList: [DI_Exercise]
}

struct DI_Exercise: Codable {
    let id: Int
    let subject: String
}
