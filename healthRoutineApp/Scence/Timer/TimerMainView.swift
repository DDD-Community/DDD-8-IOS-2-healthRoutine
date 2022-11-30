//
//  TimerMainView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/11/30.
//

import SwiftUI

struct TimerMainView: View {
    var body: some View {
        VStack {
            TopMenuVeiw(mainTitle: "타이머")
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                     TimerCountView()
                     TimerInfoView()
                }
            }
            .padding(20)
            Button {
                debugPrint("timer add click")
            } label: {
                Text("자주 쓰는 타이머 패턴 추가")
                    .frame(maxWidth: .infinity, minHeight: 59)
                    .background(.gray)
                    .cornerRadius(30)
            }
            .padding(20)
        }
    }
}

struct TimerMainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView()
    }
}
