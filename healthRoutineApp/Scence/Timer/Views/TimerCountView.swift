//
//  TimerCountView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct TimerCountView: View {
    @ObservedObject var timerData: TimerData = TimerData()
    var body: some View {
        VStack {
            Text("\(timerData.convertCountToTimeString())")
                .fontWeight(.bold)
                .font(.largeTitle)
            TimerButtonView(timerData: timerData)
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(.yellow)
        .cornerRadius(20)
    }
}

struct TimerCountView_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountView()
    }
}
