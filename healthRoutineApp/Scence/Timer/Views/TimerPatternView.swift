//
//  TimerPatternView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

struct TimerPatternView: View {
    @State var viewType: TimerPatternViewType
    var body: some View {
        VStack(spacing: 16) {
            Text(viewType.rawValue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.pretendard(.bold, size: 20))
//            HStack {
//                ForEach(viewType.getButtonArray(), id: \.self) { str in
//                    TimerPatternButtonView(buttonTitle: str.buttonStr)
//                }
//            }
        }
        .frame(maxWidth: .infinity, minHeight: 183)
        .padding([.leading], 20) 
        .background(Color.box_color)
        .cornerRadius(16)
    }
}

struct TimerPatternView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPatternView(viewType: .exerciseTime)
    }
}
