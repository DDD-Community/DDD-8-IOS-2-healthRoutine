//
//  TimerMainViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2023/01/10.
//

import Foundation
import SwiftUI

class TimerMainViewModel: ObservableObject {
    @Published var refresh: Bool = false // 리프레시용
    @Published var timerFlag: Bool = false // 하나의 타이머만 실행용

    func getCustomTimerViewData() -> [DI_CustomTimer] {
        var timerDataArr: [DI_CustomTimer] = []
        if let data = UserDefaults.standard.value(forKey: TIMER_PATTERN_KEY) as? Data {
            let savedArray = try? PropertyListDecoder().decode([DI_CustomTimer].self, from: data)
            timerDataArr = savedArray ?? []
        }
        return timerDataArr
    }
}
