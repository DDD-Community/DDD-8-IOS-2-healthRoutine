//
//  TimerCountView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct TimerCountView: View {
    @ObservedObject var timerData: TimerViewModel = TimerViewModel()
    var body: some View {
        VStack(alignment: .center, spacing: 18) {
            Text("\(timerData.convertCountToTimeString())")
                .font(Font.pretendard(.bold, size: 42))
                .foregroundColor(.white)
            TimerButtonView(timerData: timerData)
        }
        .frame(maxWidth: .infinity, minHeight: 172)
        .background(Color.box_color)
        .cornerRadius(16)
    }
}

struct TimerCountView_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountView()
    }
}
