//
//  TimerPatternInputView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2023/01/09.
//

import Foundation
import SwiftUI

struct TimerPatternInputView: View {
    var viewType: TimerPatternViewType
    @ObservedObject var timerData: TimerAddViewModel
    var body: some View {
        HStack(spacing: 14) {
            if viewType == .exerciseTime {
                UnderlineTextFieldView(value: $timerData.exerciseMinute)
                Text("분")
                    .font(Font.pretendard(.bold, size: 20))
                    .foregroundColor(.white_text)
                UnderlineTextFieldView(value: $timerData.exerciseSecond)
                Text("초")
                    .font(Font.pretendard(.bold, size: 20))
                    .foregroundColor(.white_text)
            }
            else if viewType == .breakTime {
                UnderlineTextFieldView(value: $timerData.breakSecond)
                Text("초")
                    .font(Font.pretendard(.bold, size: 20))
                    .foregroundColor(.white_text)
            }
            else if viewType == .cycle {
                UnderlineTextFieldView(value: $timerData.cycle)
                Text("세트")
                    .font(Font.pretendard(.bold, size: 20))
                    .foregroundColor(.white_text)
            }
        }
    }
}

struct TimerPatternInputModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.main_green)
            .font(Font.pretendard(.bold, size: 20))
    }
}

struct UnderlineTextFieldView: View {
    @Binding var value: Int
     var body: some View {
          HStack {
               VStack {
                   TextField("", value: $value, formatter: NumberFormatter())
                       .modifier(TimerPatternInputModifier())

                    Rectangle()
                         .frame(height: 1)
                         .foregroundColor(.main_green)
               }
          }
     }
}
