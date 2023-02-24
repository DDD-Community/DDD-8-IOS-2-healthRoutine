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
    var timerData: DI_CustomTimer // 운동.휴식시간 정보가 들어있는 DI
    private var timer: Timer? // NSTimer
    @Published var mode: CustomTimerMode = .ready // 현재 무슨모드인가 (준비/운동/휴식)
    var nowCycle: Int = 1 // 현재 몇번째 사이클중인가 (default: 1)

    var timerCount: TimeInterval = 0 // (운동시간 or 휴식시간 정보)
    @Published var remainTime: TimeInterval = 0 // 몇시간 흘렀는지 (모드 변경될때마다 리셋)
    @Published var isRunning: Bool = false // 일시정지 or 실행중 판별값

    var startTime: Date? // 시작한시각 (모드변경될때마다 리셋)
    var pauseTime: Date? // 일시정지한시각
    var storeTime: TimeInterval = 0 // 일시정지한 시간(얼만큼 정지했는지)

    @Binding var refresh: Bool // 부모뷰 리프레시

    init(timerData: DI_CustomTimer, refresh: Binding<Bool>) {
        self._refresh = refresh
        self.timerData = timerData
        NotificationCenter.default.addObserver(self, selector: #selector(resetTimer), name: Notification.Name(NotificationName.timer.rawValue), object: nil)
    }

    func startTimer() {
        // 준비모드였을때
        if mode == .ready {
            NotificationCenter.default.post(name: Notification.Name(NotificationName.timer.rawValue), object: nil)
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
        self.timer = nil
    }
    
    @objc func resetTimer() {
        self.mode = .ready
        self.timerCount = 0
        self.nowCycle = 1
        self.isRunning = false
        self.timer?.invalidate()
        self.timer = nil
        self.startTime = nil
        self.pauseTime = nil
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

    func deleteTimer() {
        self.resetTimer()
        let defaults = UserDefaults.standard
        var timerArray: [DI_CustomTimer] = []
        if let data = defaults.value(forKey: TIMER_PATTERN_KEY) as? Data {
            let savedArray = try? PropertyListDecoder().decode([DI_CustomTimer].self, from: data)
            timerArray = savedArray ?? []
        }

        if let index = timerArray.firstIndex(of: self.timerData) {
            timerArray.remove(at: index)
        }
        defaults.set(try? PropertyListEncoder().encode(timerArray), forKey: TIMER_PATTERN_KEY)
        
    }

    deinit {
        self.resetTimer()
    }
}
