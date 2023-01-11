//
//  TimerMainView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct TimerMainView: View {
    @ObservedObject var timerMainViewModel: TimerMainViewModel = TimerMainViewModel()
    var body: some View {
        CustomNavigationView {
            
            BaseView {
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 16) {
                            NormalTimerView(timerData: NormalTimerViewModel())
                            ForEach(timerMainViewModel.getCustomTimerViewData(), id: \.self) { item in
                                CustomTimerView(timerViewModel: CustomTimerViewModel(timerData: item, refresh: $timerMainViewModel.refresh))
                            }
                        }
                    }
                    CustomNavigationLink(destination: TimerAddView(timerData: TimerAddViewModel(refresh: $timerMainViewModel.refresh)).customNavigationTitle("타이머")
                    ) {
                        Text("자주 쓰는 타이머 패턴 추가")
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(Color.available_green)
                            .foregroundColor(Color(hex: "353535"))
                            .cornerRadius(10)
                    }
                }
                .customNavigationTitle("타이머")
                .customNavigationBarBackButtonHidden(true)
            }
        }
    }
}

struct TimerMainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView()
    }
}
