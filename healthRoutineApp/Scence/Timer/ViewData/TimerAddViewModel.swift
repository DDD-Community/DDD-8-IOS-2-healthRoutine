//
//  TimerAddViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/07.
//

import Foundation
import SwiftUI

enum TimerPatternViewType: String, CaseIterable {
    case exerciseTime = "운동시간을 선택해주세요"
    case breakTime = "휴식시간을 선택해주세요"
    case cycle = "반복횟수를 선택해주세요"
    
    func getButtonArray() -> [DI_ButtonInfo] {
        switch self {
        case .exerciseTime:
            return [DI_ButtonInfo(seconds: 5), DI_ButtonInfo(seconds: 10), DI_ButtonInfo(seconds: 15), DI_ButtonInfo(seconds: 30), DI_ButtonInfo(minutes: 1), DI_ButtonInfo(minutes: 5), DI_ButtonInfo(minutes: 10), DI_ButtonInfo(minutes: 20)]
        case .breakTime:
            return [DI_ButtonInfo(seconds: 10), DI_ButtonInfo(seconds: 30), DI_ButtonInfo(seconds: 60), DI_ButtonInfo(seconds: 120)]
        case .cycle:
            return [DI_ButtonInfo(cycle: 1), DI_ButtonInfo(cycle: 2), DI_ButtonInfo(cycle: 3), DI_ButtonInfo(cycle: 5)]
        }
    }
}

struct DI_ButtonInfo: Hashable {
    var minutes: Int = 0
    var seconds: Int = 0
    var cycle: Int = 0
    var buttonStr: String = ""
    var buttonColor: Color = .background_gray
    
    init(minutes: Int) {
        self.minutes = minutes
        self.buttonStr = "+\(minutes)분"
        self.buttonColor = .background_gray2
    }
    
    init(seconds: Int) {
        self.seconds = seconds
        self.buttonStr = "+\(seconds)초"
        self.buttonColor = .background_gray
    }
    
    init(cycle: Int) {
        self.cycle = cycle
        self.buttonStr = "x\(cycle)세트"
        self.buttonColor = .background_gray2
    }
}

class TimerAddViewModel: ObservableObject {
    var customTimerData: DI_CusomTimer?
    
}
