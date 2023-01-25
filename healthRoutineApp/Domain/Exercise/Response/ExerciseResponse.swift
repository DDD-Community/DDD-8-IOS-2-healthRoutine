//
//  ExerciseResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/24.
//

import Foundation

struct TodayExerciseListResponse: Decodable {
    let code: Int
    let message: String
    let result: [TodayExerciseListResult]
}
