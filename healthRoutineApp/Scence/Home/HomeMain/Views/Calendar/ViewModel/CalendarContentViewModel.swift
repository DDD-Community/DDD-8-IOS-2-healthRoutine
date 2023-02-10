//
//  CalendarContentCellViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/02/09.
//

import Foundation
import Combine
import SwiftUI

final class CalendarContentViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var weekCnt: Int = 0
}

extension CalendarContentViewModel {
    
    private func getMonthLevel() {
        
        APIService.getMonthlyExerciseInfo()
            .receive(on: RunLoop.main)
            .sink {  completion in
                switch completion {
                case .failure(let error):
                    switch error {
                    case .http: do {}
                    default: do {}
                    }
                case .finished:
                    break
                }
            } receiveValue: { (value: MonthlyExerciseListResponse) in
                
                value.result.data.forEach { list in
                    self.fillColorCell(list.level)
                }
                
                self.weekCnt = value.result.data.count
            }
            .store(in: &cancellables)
    }
    
    private func fillColorCell(_ level: Int) -> Color {
        
        switch level {
        case 0: return Color.init(hex: "F9F9F9")
        case 1...3: return Color.init(hex: "CAFFEB")
        case 4...5: return Color.init(hex: "6AFFC9")
        case 6...10: return Color.init(hex: "00FFA3")
        default: return Color.init(hex: "363740") // 비활성화 인 경우
        }
    }
}
