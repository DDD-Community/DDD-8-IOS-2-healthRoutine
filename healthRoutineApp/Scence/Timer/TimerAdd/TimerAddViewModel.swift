//
//  TimerAddViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/07.
//

import Foundation
import Combine
import SwiftUI

enum TimerPatternViewType: String, CaseIterable {
    case exerciseTime = "운동시간을 선택해주세요"
    case breakTime = "휴식시간을 선택해주세요"
    case cycle = "반복횟수를 선택해주세요"
    
    func getButtonArray() -> [[DI_ButtonInfo]] {
        switch self {
        case .exerciseTime:
            return [[DI_ButtonInfo(seconds: 5), DI_ButtonInfo(seconds: 10), DI_ButtonInfo(seconds: 15), DI_ButtonInfo(seconds: 30)], [DI_ButtonInfo(minutes: 1), DI_ButtonInfo(minutes: 5), DI_ButtonInfo(minutes: 10), DI_ButtonInfo(minutes: 20)]]
        case .breakTime:
            return [[DI_ButtonInfo(seconds: 10), DI_ButtonInfo(seconds: 30), DI_ButtonInfo(seconds: 60), DI_ButtonInfo(seconds: 120)]]
        case .cycle:
            return [[DI_ButtonInfo(cycle: 1), DI_ButtonInfo(cycle: 2), DI_ButtonInfo(cycle: 3), DI_ButtonInfo(cycle: 5)]]
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
    private var cancellables: Set<AnyCancellable> = []

    init(refresh: Binding<Bool>){
        self._refresh = refresh
        bindView()
    }

    @Binding var refresh: Bool

    @Published var exerciseMinute: Int = 0 {
        didSet {
            if exerciseMinute > 59 {
                exerciseMinute = 59
            }
        }
    }

    @Published var exerciseSecond: Int = 0 {
        didSet {
            if exerciseSecond > 59 {
                exerciseSecond = 59
            }
        }
    }
    

    @Published var breakSecond: Int = 0 {
        didSet {
            if breakSecond > 300 {
                breakSecond = 300
            }
        }
    }

    @Published var cycle: Int = 0 {
        didSet {
            if cycle > 10 {
                cycle = 10
            }
        }
    }

    @Published var isAvailableButton: Bool = false

    func bindView() {
        Publishers.CombineLatest4($exerciseMinute, $exerciseSecond, $breakSecond, $cycle)
            .map { exMin, exSec, brSec, cycle in
                if (exMin > 0 || exSec > 0) && brSec > 0 && cycle > 0 {
                    return true
                }
                return false
            }
            .assign(to: \.isAvailableButton, on: self)
            .store(in: &cancellables)
    }

    func buttonAction(_ item: DI_ButtonInfo, _ viewType: TimerPatternViewType) {
        if viewType == .exerciseTime {
            if item.minutes.isPositive {
                self.exerciseMinute += item.minutes
            }
            else if item.seconds.isPositive {
                self.exerciseSecond += item.seconds
            }
        }
        else if viewType == .breakTime {
            if item.seconds.isPositive {
                self.breakSecond += item.seconds
            }
        }
        else if viewType == .cycle {
            if item.cycle.isPositive {
                self.cycle += item.cycle
            }
        }
    }

    func addTimer() {
        let customTimerData = DI_CustomTimer()
        customTimerData.breakTime.isExerciseType = false
        customTimerData.exerCiseTime.minutes = Double(exerciseMinute)
        customTimerData.exerCiseTime.seconds = Double(exerciseSecond)
        customTimerData.breakTime.seconds = Double(breakSecond)
        customTimerData.cycle = cycle

        let defaults = UserDefaults.standard
        var timerArray: [DI_CustomTimer] = []
        if let data = defaults.value(forKey: TIMER_PATTERN_KEY) as? Data {
            let savedArray = try? PropertyListDecoder().decode([DI_CustomTimer].self, from: data)
            timerArray = savedArray ?? []
        }
        customTimerData.timerId = timerArray.count
        timerArray.append(customTimerData)
        defaults.set(try? PropertyListEncoder().encode(timerArray), forKey: TIMER_PATTERN_KEY)
    }
}
