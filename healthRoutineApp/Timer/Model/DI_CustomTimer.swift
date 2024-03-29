//
//  DI_CustomTimer.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/01.
//

import Foundation

class DI_CustomTimer: Hashable, Codable {
    static func == (lhs: DI_CustomTimer, rhs: DI_CustomTimer) -> Bool {
        if lhs.timerId == rhs.timerId {
            return true
        }
        return false
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(timerId)
    }

    var exerCiseTime = DI_Time() // 운동시간
    var breakTime = DI_Time() // 휴식시간
    var cycle: Int = 0 // 사이클
    var timerId: Int = 0
}

class DI_Time: Codable {
    var minutes: Double = 0 // 분
    var seconds: Double = 0 // 초
    var isExerciseType: Bool = true // 운동 or 휴식
        
    func getTimeString() -> String {
        
        let minute = minutes == 0 ? "" : "\(String(format:"%.0f", minutes))분"
        return "\(minute) \(String(format:"%.0f", seconds))초 \(isExerciseType ? "운동" : "휴식")"
//        return "\(String(format:"%.0f", minutes))분 \(String(format:"%.0f", seconds))초 \(isExerciseType ? "운동" : "휴식")"
    }
    
    func changeTimeToSeconds() -> TimeInterval {
        let seconds = (minutes * 60) + seconds
        return seconds
    }
}
