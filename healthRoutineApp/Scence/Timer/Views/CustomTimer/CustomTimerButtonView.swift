//
//  TimerButtonView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct CustomTimerButtonView: View {
    @ObservedObject var timerData: CustomTimerViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 36) {
            Button(action: resetTimer){
                Image("custom_timer_reset")
                    .frame(width: 40, height: 40)
            }
            if timerData.isRunning {
                Button(action: pauseTimer){
                    Image("custom_timer_pause")
                        .frame(width: 40, height: 40)
                }
            }
            else {
                Button(action: startTimer){
                    Image("custom_timer_start")
                        .frame(width: 40, height: 40)
                }
            }
            Button(action: deleteTimer){
                Image("custom_timer_delete")
                    .frame(width: 40, height: 40)
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
    
    func deleteTimer() {
        
    }
}

struct CustomTimerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimerButtonView(timerData: CustomTimerViewModel())
    }
}

