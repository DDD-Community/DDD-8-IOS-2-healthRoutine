//
//  TimerData.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timerCount: TimeInterval?
    
    private var timer: Timer?
    @Published var isRunning: Bool = false
    
    var startTime: Date?
    var pauseTime: Date?
    var storeCount: TimeInterval = 0
    
    func resetTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.isRunning = false
        self.timerCount = nil
        self.startTime = nil
        self.storeCount = 0
    }
    
    func startTimer() {
        if isRunning == false {
            if self.startTime == nil {
                self.startTime = Date()
            }
            self.isRunning = true
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) {[weak self] _ in
                guard let self = self, let startTime = self.startTime else { return }
                let nowTime = Date()
                let runningTime = nowTime.timeIntervalSince(startTime)
                if let pauseTime = self.pauseTime {
                    self.storeCount += nowTime.timeIntervalSince(pauseTime)
                    self.pauseTime = nil
                }
                self.timerCount = runningTime - self.storeCount
            }
        }
    }
    
    
    func pauseTimer() {
        self.isRunning = false
        self.pauseTime = Date()
        self.timer?.invalidate()
    }
    
    func convertCountToTimeString() -> String {
        guard let counter = self.timerCount else { return "00:00:00" }
        
        let millseconds = (Int)((counter - floor(counter))*100)
        let seconds = (Int)(fmod(counter, 60))
        let minutes = (Int)(fmod((counter/60), 60))
        
        return "\(String(format:"%02d", minutes)):\(String(format:"%02d", seconds)):\(String(format:"%02d", millseconds))"
    }
    
}
