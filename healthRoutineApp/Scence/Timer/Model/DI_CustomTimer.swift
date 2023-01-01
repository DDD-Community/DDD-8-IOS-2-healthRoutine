//
//  DI_CustomTimer.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/01.
//

import Foundation

class DI_CusomTimer {
    var exerCiseTime = DI_Time() // 운동시간
    var breakTime = DI_Time() // 휴식시간
    var cycle: Int = 0 // 사이클
}

class DI_Time {
    var minutes: Int = 0 // 분
    var seconds: Int = 0 // 초
    var isExerciseType: Bool = true // 운동 or 휴식
        
    func getTimeString() -> String {
        return "\(String(format:"%02d", minutes))분 \(String(format:"%02d", seconds))초 \(isExerciseType ? "운동" : "휴식")"
    }
}
