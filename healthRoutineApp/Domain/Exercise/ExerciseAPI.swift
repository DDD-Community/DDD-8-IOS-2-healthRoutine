//
//  ExerciseAPI.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation

enum ExerciseAPI {
    
    case todayExerciseList
    
    var url: String {
        
        switch self {
            
        case .todayExerciseList: return "\(HealthRoutineAPI.baseURL)/exercise/today"
        }
    }
}
