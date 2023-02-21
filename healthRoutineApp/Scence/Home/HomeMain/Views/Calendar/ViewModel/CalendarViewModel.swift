//
//  CalendarViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/15.
//

import Foundation
import Combine
import SwiftUI

final class CalendarViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var day: Int = 0
    @Published var level: Int = 4
    
    func getNickName() -> String {
        
        let nickname = UserDefaults.standard.string(forKey: NICKNAME_KEY)
        
        guard let nickname = nickname else { return "" }
        return "\(nickname)님 "
    }
    
    // TODO: 통신 값 받아서 결과처리하기
    func fetchInfo(year: Int, month: Int) {
        
        let param = MonthExerciseFetchRequest(year: year, month: month)
        
        APIService.getMonthlyExerciseInfo(param)
            .receive(on: RunLoop.main)
            .sink { completion in
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
                self.fetchInfos(value.result.data)
            }
            .store(in: &cancellables)
    }
    
    // TODO: 레벨 색상에 맞게 Cell 색칠하기
    func fetchInfos(_ list: [MonthList]) {
        
        let levels = list.map { $0.level }
        
        for (index, level) in levels.enumerated() {
            
            self.day = index + 1
            self.level = level
        }
    }
    
    // TODO: 오늘이후 날짜 값 변경 처리
}
