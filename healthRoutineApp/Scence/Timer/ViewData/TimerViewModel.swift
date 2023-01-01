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
    var storeCount: TimeInterval?
    
    func resetTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.isRunning = false
        self.timerCount = nil
        self.startTime = nil
        self.storeCount = nil
    }
    
    func startTimer() {
        if isRunning == false {
            self.startTime = Date()
            self.isRunning = true
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) {[weak self] _ in
                guard let self = self, let startTime = self.startTime else { return }
                let timeSeconds = Date().timeIntervalSince(startTime)
                if let storeCount = self.storeCount {
                    self.timerCount = timeSeconds + storeCount
                }
                else {
                    self.timerCount = timeSeconds
                }
            }
        }
    }
    
    
    func pauseTimer() {
        if let timer = timer, let startTime = self.startTime {
            if var storeCount = self.storeCount {
                storeCount += Date().timeIntervalSince(startTime)
            }
            else {
                storeCount = Date().timeIntervalSince(startTime)
            }
            self.isRunning = false
            timer.invalidate()
        }
    }
    
    func convertCountToTimeString() -> String {
        guard let counter = self.timerCount else { return "00:00:00" }
        
        let millseconds = (Int)((counter - floor(counter))*100)
        let seconds = (Int)(fmod(counter, 60))
        let minutes = (Int)(fmod((counter/60), 60))
        
        return "\(String(format:"%02d", minutes)):\(String(format:"%02d", seconds)):\(String(format:"%02d", millseconds))"
    }
    
}
