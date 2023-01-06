//
//  CustomTimerViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/01.
//

import Foundation
import SwiftUI

enum CustomTimerMode {
    case ready
    case exercise
    case breakTime
    
    func switchMode() -> CustomTimerMode {
        switch self {
        case .breakTime:
            return .exercise
        case .exercise:
            return .breakTime
        default:
            return .ready
        }
    }
}

class CustomTimerViewModel: ObservableObject {
    var timerData: DI_CusomTimer = DI_CusomTimer() // 운동.휴식시간 정보가 들어있는 DI
    private var timer: Timer? // NSTimer
    @Published var mode: CustomTimerMode = .ready // 현재 무슨모드인가 (준비/운동/휴식)
    var nowCycle: Int = 1 // 현재 몇번째 사이클중인가 (default: 1)

    var timerCount: TimeInterval = 0 // (운동시간 or 휴식시간 정보)
    @Published var remainTime: TimeInterval = 0 // 몇시간 흘렀는지 (모드 변경될때마다 리셋)
    @Published var isRunning: Bool = false // 일시정지 or 실행중 판별값

    var startTime: Date? // 시작한시각 (모드변경될때마다 리셋)
    var pauseTime: Date? // 일시정지한시각
    var storeTime: TimeInterval = 0 // 일시정지한 시간(얼만큼 정지했는지)

    func startTimer() {
        // 준비모드였을때
        if mode == .ready {
            mode = .exercise
            self.startTime = Date()
            timerCount = timerData.exerCiseTime.changeTimeToSeconds()
        }
        else {
            if let pauseTime = pauseTime {
                storeTime += Date().timeIntervalSince(pauseTime)
                self.pauseTime = nil
            }
        }

        self.isRunning = true
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) {[weak self] _ in
            guard let self = self else { return }
            self.handleTimer()
        }
    }
    
    func handleTimer() {
        guard let startTime = startTime else { return }
        let nowTime = Date()
        var runningTime = nowTime.timeIntervalSince(startTime)
        runningTime = runningTime - storeTime
        remainTime = self.timerCount - runningTime
        if remainTime <= 0 {
            // 모든사이클 완료했으면 완료
            if nowCycle == timerData.cycle && mode == .breakTime {
                self.resetTimer()
            }
            else {
                if mode == .breakTime {
                    nowCycle += 1
                }
                self.mode = self.mode.switchMode()
                self.timerCount = getTimeByMode()
                self.storeTime = 0
                self.startTime = Date()
            }
        }
    }
    
    func getTimeByMode() -> TimeInterval {
        if self.mode == .exercise {
            return timerData.exerCiseTime.changeTimeToSeconds()
        }
        else {
            return timerData.breakTime.changeTimeToSeconds()
        }
    }
    
    func pauseTimer() {
        isRunning = false
        pauseTime = Date()
        self.timer?.invalidate()
    }
    
    func resetTimer() {
        self.mode = .ready
        self.timerCount = 0
        self.nowCycle = 1
        self.isRunning = false
        self.timer = nil
        self.startTime = nil
    }

    func getModeString() -> String {
        if mode == .exercise {
            return timerData.exerCiseTime.getTimeString()
        }
        else if mode == .breakTime {
            return timerData.breakTime.getTimeString()
        }
        else {
            return ""
        }
    }

    func convertCountToTimeString() -> String {
        let counter = self.remainTime
        let millseconds = (Int)((counter - floor(counter)) * 100)
        let seconds = (Int)(fmod(counter, 60))
        let minutes = (Int)(fmod((counter/60), 60))

        return "\(String(format:"%02d", minutes)):\(String(format:"%02d", seconds)):\(String(format:"%02d", millseconds))"
    }

}
