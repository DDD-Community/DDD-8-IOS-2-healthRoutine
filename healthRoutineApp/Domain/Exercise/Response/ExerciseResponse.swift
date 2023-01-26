//
//  ExerciseResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/24.
//

import Foundation

struct TodayExerciseListResult: Codable, Hashable {
    let exerciseId: Int
    let exerciseSubject: String
    let categorySubject: String
    let weight: Int
    let set: Int
    let count: Int
    let createdAt: Int
}

struct TodayExerciseListResponse: Decodable {
    let code: Int
    let message: String
    let result: [TodayExerciseListResult]
}
