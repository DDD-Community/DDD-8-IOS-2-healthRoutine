//
//  TimerButtonView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct TimerButtonView: View {
    @ObservedObject var timerData: TimerData
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Button(action: startTimer){
                Image(systemName: "play")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
            }
            Button(action: pauseTimer){
                Image(systemName: "pause")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
            }
            Button(action: resetTimer){
                Image(systemName: "stop")
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
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

struct TimerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TimerButtonView(timerData: TimerData())
    }
}
