//
//  TimerPatternView.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/10.
//

import SwiftUI

enum TimerPatternViewType: String, CaseIterable {
    case exerciseTime = "운동시간을 선택해주세요"
    case breakTime = "휴식시간을 선택해주세요"
    case repeatType = "반복횟수를 선택해주세요"
    
    func getButtonArray() -> [String] {
        switch self {
        case .exerciseTime :
            return ["10분", "20분", "30분", "40분"]
        case .breakTime:
            return ["1분", "2분", "3분", "4분"]
        case .repeatType:
            return ["1회", "2회", "3회", "4회"]
        }
    }
}

struct TimerPatternView: View {
    @State var viewType: TimerPatternViewType
    var body: some View {
        VStack {
            HStack {
                Text(viewType.rawValue)
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(alignment: .trailing)
                Spacer()
            }
            .padding([.leading], 20)
            HStack {
                ForEach(viewType.getButtonArray(), id: \.self) { str in
                    TimerPatternButtonView(buttonTitle: str)
                }
            }
        }
        .frame(maxWidth: .infinity, minHeight: 160)
        .background(.yellow)
        .cornerRadius(20)
    }
}

struct TimerPatternView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPatternView(viewType: .exerciseTime)
    }
}
