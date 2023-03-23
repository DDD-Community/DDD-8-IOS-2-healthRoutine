//
//  TimerPatternView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

struct TimerPatternView: View {
    
    var viewType: TimerPatternViewType
    @ObservedObject var timerData: TimerAddViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text(viewType.rawValue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.pretendard(.bold, size: 20))
                .foregroundColor(Color(hex: "F9F9F9"))

            TimerPatternInputView(viewType: viewType, timerData: timerData)
            VStack(alignment: .leading, spacing: 6) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewType.getButtonArray().first ?? [], id: \.self) { item in
                            TimerPatternButtonView(buttonData: item, timerAddViewModel: timerData, viewType: viewType)
                        }
                    }
                }
                if viewType.getButtonArray()[safe: 1] != nil {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewType.getButtonArray()[safe: 1] ?? [], id: \.self) { item in
                                TimerPatternButtonView(buttonData: item, timerAddViewModel: timerData, viewType: viewType)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(Color.box_color)
        .cornerRadius(16)
    }
}


struct TimerPatternView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPatternView(viewType: .exerciseTime, timerData: TimerAddViewModel(refresh: .constant(false)))
    }
}
