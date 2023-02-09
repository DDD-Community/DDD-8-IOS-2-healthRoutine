//
//  ExerciseAPI.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation

enum ExerciseAPI {
    
    case todayExerciseList
    case montly
    
    var url: String {
        
        switch self {
            
        case .todayExerciseList: return "\(HealthRoutineAPI.baseURL)/exercise/today"
        case .montly: return "\(HealthRoutineAPI.baseURL)/exercise/monthly"
        }
    }
}
