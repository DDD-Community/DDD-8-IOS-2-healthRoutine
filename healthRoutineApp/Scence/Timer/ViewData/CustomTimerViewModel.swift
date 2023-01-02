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
    var timerData: DI_CusomTimer = DI_CusomTimer()
    @Published var mode: CustomTimerMode = .ready // 현재 무슨모드인가
    @Published var isRunning: Bool = false // 현재 타이머가 일시정지 모드인지 아닌지 판별하는값
    var nowCycle: Int = 1
    @Published var timerCount: TimeInterval = 0
    private var timer: Timer?
    
    func startTimer() {
        // 준비모드였을때
        if mode == .ready {
            mode = .exercise
            timerCount = timerData.exerCiseTime.changeTimeToSeconds()
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) {[weak self] _ in
                guard let self = self else { return }
                self.handleTimer()
            }
        }
        // 일시정지였을때
        else {
            
        }
    }
    
    func handleTimer() {
        timerCount -= 0.001
        if timerCount <= 0 {
            // 모든사이클 완료했으면 완료
            if nowCycle == timerData.cycle && mode == .breakTime {
                self.resetTimerInfo()
            }
            else {
                self.mode = self.mode.switchMode()
                nowCycle += 1
                self.timerCount = getTimeByMode()
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
        
    }
    
    func resetTimer() {
        
    }
    
    func resetTimerInfo() {
        self.mode = .ready
        self.isRunning = false
        self.timerCount = 0
        self.nowCycle = 1
        self.timer = nil
    }
    
}
