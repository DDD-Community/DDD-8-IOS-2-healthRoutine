//
//  TimerMainView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct TimerMainView: View {
    var body: some View {
        CustomNavigationView {
            VStack {
                TopMenuVeiw(mainTitle: "타이머")
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 16) {
                        NormalTimerView()
                        CustomTimerView()
                    }
                }
                CustomNavigationLink(destination: TimerAddView().customNavigationTitle("타이머")
                ) {
                    Text("자주 쓰는 타이머 패턴 추가")
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color.available_green)
                        .foregroundColor(Color(hex: "353535"))
                        .cornerRadius(10)
                }
            }
            .customNavigationBarBackButtonHidden(true)
        }
    }
}

struct TimerMainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView()
    }
}
