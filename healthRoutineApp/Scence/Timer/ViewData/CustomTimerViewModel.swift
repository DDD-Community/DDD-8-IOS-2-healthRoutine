//
//  CustomTimerViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/01.
//

import Foundation
import SwiftUI

class CustomTimerViewModel: ObservableObject {
    var timerData: DI_CusomTimer = DI_CusomTimer()
    @Published var isRunning: Bool = false
}
