//
//  TimerPatternButtonView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

struct TimerPatternButtonView: View {
    @State var buttonTitle: String
    var body: some View {
        Button(buttonTitle, action: {
            print("버튼눌림 ㅋ")
        })
//        .lineLimit(1)
//        .fixedSize(horizontal: true, vertical: false)
        .padding(16)
        .foregroundColor(.black)
        .background(Color(.systemGray4))
        .cornerRadius(15)
    }
}

struct TimerPatternButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPatternButtonView(buttonTitle: "+ 1kg")
    }
}
