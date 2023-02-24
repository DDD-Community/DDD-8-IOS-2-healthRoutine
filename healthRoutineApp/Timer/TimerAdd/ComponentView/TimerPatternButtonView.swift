//
//  TimerPatternButtonView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

struct TimerPatternButtonView: View {
    
    @State var buttonData: DI_ButtonInfo
    var timerAddViewModel: TimerAddViewModel
    var viewType: TimerPatternViewType
    
    var body: some View {

        Button {
            self.buttonAction()
        } label: {
            Text(buttonData.buttonStr)
                .font(Font.pretendard(.semiBold, size: 14))
        }
        .padding([.horizontal], 16)
        .padding([.vertical], 10)
        .foregroundColor(Color(hex: "353535"))
        .background(buttonData.buttonColor)
        .cornerRadius(32)
    }

    func buttonAction() {
        timerAddViewModel.buttonAction(buttonData, viewType)
    }
}

struct TimerPatternButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPatternButtonView(buttonData: DI_ButtonInfo(seconds: 1), timerAddViewModel: TimerAddViewModel(refresh: .constant(false)), viewType: TimerPatternViewType.exerciseTime)
    }
}
