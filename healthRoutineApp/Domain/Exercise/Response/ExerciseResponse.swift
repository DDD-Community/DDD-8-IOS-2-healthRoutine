//
//  ExerciseResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/24.
//

import Foundation

struct TodayExerciseListResult: Codable, Hashable {
    let id: String // 기록 id
    let exerciseSubject: String // 운동명
    let categorySubject: String // 부위명
    let weight: Int // 무게
    let reps: Int // 횟수
    let set: Int // 세트
    
    func getInfoStr() -> String {
        var weightStr: String?
        var repsStr: String?
        var setStr: String?
        if weight != 0 {
            weightStr = "\(weight)kg"
        }
        if reps != 0 {
            repsStr = "\(reps)번"
        }
        if set != 0 {
            setStr = "\(set)세트"
        }
        let infoStr = [weightStr, repsStr, setStr]
            .compactMap { $0 }
            .joined(separator: " X")
        return infoStr
    }
}

struct TodayExerciseListResponse: Decodable {
    let code: Int
    let message: String
    let result: [TodayExerciseListResult]
}
