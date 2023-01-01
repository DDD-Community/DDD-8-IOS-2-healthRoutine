//
//  TimerButtonView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct NormalTimerButtonView: View {
    @ObservedObject var timerData: TimerViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 112) {
            Button(action: startTimer){
                Image("timer_start")
                    .frame(width: 40, height: 40)
            }
            if timerData.isRunning {
                Button(action: pauseTimer){
                    Image("timer_pause")
                        .frame(width: 40, height: 40)
                }
            }
            else {
                Button(action: resetTimer){
                    Image("timer_reset")
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
    
    func startTimer() {
        timerData.startTimer()
    }
    
    
    func pauseTimer() {
        timerData.pauseTimer()
    }
    
    func resetTimer() {
        timerData.resetTimer()
    }
}

struct NormalTimerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NormalTimerButtonView(timerData: TimerViewModel())
    }
}
