//
//  TimerInfoView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct CustomTimerView: View {
    @ObservedObject var timerViewModel: CustomTimerViewModel
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            if timerViewModel.mode == .ready {
                CustomTimerReadyView(timerData: timerViewModel.timerData)
            }
            else {
                if timerViewModel.timerData.cycle > 1 {
                    CustomTimerCycleView(timerViewModel: timerViewModel)
                }
                CustomTimerRunningView(timerViewModel: timerViewModel)
            }
            CustomTimerButtonView(timerData: timerViewModel)
        }
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity, minHeight: 151)
        .background(Color.background_gray2)
        .cornerRadius(16)
    }
}

struct CustomTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimerView(timerViewModel: CustomTimerViewModel(timerData: DI_CustomTimer(), refresh: .constant(false)))
    }
}
