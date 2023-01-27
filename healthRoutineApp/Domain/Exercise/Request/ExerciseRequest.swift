//
//  ExerciseRequest.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/24.
//

import Foundation

struct ExerciseAddRequest: Codable {
    
    let categoryId: Int
    let subject: String
}

struct ExerciseTotalAddRequest: Codable {
    
    let exerciseId: Int
    let weight: Int?
    let set: Int?
    let reps: Int?
}

struct ExerciseFetchReqeust: Codable {
    
    let time: Int
}


