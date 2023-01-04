//
//  TimerInfoView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct CustomTimerView: View {
    @ObservedObject var timerViewModel: CustomTimerViewModel = CustomTimerViewModel()
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            if timerViewModel.mode == .ready {
                CustomTimerReadyView(timerData: timerViewModel.timerData)
            }
            else {
                CustomTimerRunningView(timerViewModel: timerViewModel)
            }
            CustomTimerButtonView(timerData: timerViewModel)
        }
        .frame(maxWidth: .infinity, minHeight: 155)
        .background(Color.background_gray2)
        .cornerRadius(16)
    }
}

struct CustomTimerReadyView: View {
    var timerData: DI_CusomTimer
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 4) {
                Text(timerData.exerCiseTime.getTimeString())
                    .lineLimit(1)
                    .foregroundColor(Color(hex:"36383C"))
                    .font(Font.pretendard(.bold, size: 16))
                    .frame(height: 47)
                    .padding([.leading, .trailing], 20)
                    .background(.white)
                    .cornerRadius(32)
                Text(timerData.breakTime.getTimeString())
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .font(Font.pretendard(.bold, size: 16))
                    .frame(height: 47)
                    .padding([.leading, .trailing], 20)
                    .background(Color(hex:"6563FF"))
                    .cornerRadius(32)
                Text("x\(timerData.cycle)")
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .font(Font.pretendard(.bold, size: 16))
                    .padding([.leading, .trailing], 20)
                    .frame(height: 47)
                    .background(Color(hex:"444444"))
                    .cornerRadius(32)
            }
        }
        .padding([.leading], 24)
    }
}

struct CustomTimerRunningView: View {
    @ObservedObject var timerViewModel: CustomTimerViewModel
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(timerViewModel.getModeString())
                .lineLimit(1)
                .font(Font.pretendard(.bold, size: 16))
                .foregroundColor(timerViewModel.mode == .exercise ? Color(hex:"36383C") : .white)
                .frame(height: 47)
                .padding([.leading, .trailing], 20)
                .background(timerViewModel.mode == .exercise ? .white : .button_blue)
                .cornerRadius(32)
            Text("\(timerViewModel.convertCountToTimeString())")
                .font(Font.pretendard(.bold, size: 26))
                .foregroundColor(.white)
        }
    }
}

struct CustomTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimerView()
    }
}
