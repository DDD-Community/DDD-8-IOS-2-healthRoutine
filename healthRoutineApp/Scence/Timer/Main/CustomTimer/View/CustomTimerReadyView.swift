//
//  CustomTimerReadyView.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2023/01/10.
//

import SwiftUI

struct CustomTimerReadyView: View {
    var timerData: DI_CustomTimer
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

struct CustomTimerRunningView: View {
    @ObservedObject var timerViewModel: CustomTimerViewModel
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(timerViewModel.getModeString())
                .lineLimit(1)
                .font(Font.pretendard(.bold, size: 16))
                .foregroundColor(timerViewModel.mode == .exercise ? Color(hex:"36383C") : .white)
                .frame(height: 47)
                .padding([.leading, .trailing], 20)
                .background(timerViewModel.mode == .exercise ? .white : .button_blue)
                .cornerRadius(32)
            Text("\(timerViewModel.convertCountToTimeString())")
                .font(Font.pretendard(.bold, size: 26))
                .foregroundColor(.white)
        }
    }
}

struct CustomTimerCycleView: View {
    @ObservedObject var timerViewModel: CustomTimerViewModel
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<timerViewModel.nowCycle, id: \.self) { _ in
                Ellipse()
                    .fill(Color.main_green)
                    .frame(width: 7, height: 7)
            }
            ForEach(0..<timerViewModel.timerData.cycle - timerViewModel.nowCycle, id: \.self) { _ in
                Ellipse()
                    .strokeBorder(.black, lineWidth: 1)
                    .background(Circle().fill(.clear))
                    .frame(width: 7, height: 7)
            }
        }
    }
}

