//
//  TimerInfoView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct TimerInfoView: View {
    @ObservedObject var timerData: TimerData = TimerData()
    var body: some View {
        VStack {
            HStack {
                Text("5분 운동 30초 휴식")
                    .fontWeight(.bold)
                    .font(.title)
                Spacer()
                Image(systemName: "xmark")
            }
            .padding(20)
            TimerButtonView(timerData: timerData)
        }
        .frame(maxWidth: .infinity, minHeight: 170)
        .background(.yellow)
        .cornerRadius(20)
    }
}

struct TimerInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TimerInfoView()
    }
}
