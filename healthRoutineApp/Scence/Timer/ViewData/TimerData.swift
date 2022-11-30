//
//  TimerData.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import Foundation
import SwiftUI
typealias TimeUpdated = (_ time: Double)->Void

class TimerData: ObservableObject {
    @Published var timerCount: Int = 0
    var timer: Timer?
    var isRunning: Bool = false
    
    func resetTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.isRunning = false
        self.timerCount = 0
    }
    
    func startTimer() {
        if isRunning == false {
            self.isRunning = true
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] _ in
                guard let self = self else { return }
                self.timerCount += 1
            }
        }
    }
    
    func pauseTimer() {
        if let timer = timer {
            self.isRunning = false
            timer.invalidate()
        }
    }
    
    func convertCountToTimeString() -> String {
        let counter = self.timerCount
        let millseconds = counter % 100
        let seconds = counter / 100
        let minutes = seconds / 60
        
        var millsecondsString = "\(millseconds)"
        var secondsString = "\(seconds)"
        var minutesString = "\(minutes)"
        
        if millseconds < 10 {
            millsecondsString = "0" + millsecondsString
        }
        
        if seconds < 10 {
            secondsString = "0" + secondsString
        }
        
        if minutes < 10 {
            minutesString = "0" + minutesString
        }
        return "\(minutesString):\(secondsString):\(millsecondsString)"
    }
    
}
