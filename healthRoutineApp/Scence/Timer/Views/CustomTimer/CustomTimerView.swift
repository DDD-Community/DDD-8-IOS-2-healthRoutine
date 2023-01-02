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

struct CustomTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimerView()
    }
}
