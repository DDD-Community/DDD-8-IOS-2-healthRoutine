//
//  CalendarViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/15.
//

import Foundation
import Combine
import SwiftUI

class CalendarViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var dayOfLevel: [String: Int] = [:]
    @Published var exerciseArray: [TodayExerciseListResult] = []
    
    var dayOfLevelStream = PassthroughSubject<[String: Int], Never>()

    func getNickName() -> String {
        
        let nickname = UserDefaults.standard.string(forKey: NICKNAME_KEY)
        
        guard let nickname = nickname else { return "" }
        return "\(nickname)님 오늘도 움직여 볼까요?"
    }
    
    // TODO: 통신 값 받아서 결과처리하기
    func fetchInfo(year: Int, month: Int) {
        
        let param = MonthExerciseFetchRequest(year: year, month: month)
        
        APIService.getMonthlyExerciseInfo(param)
            .receive(on: DispatchQueue.global())
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
                
                self.getDayOfLevel(value.result.data)
            }
            .store(in: &cancellables)
    }
    
    func fetchTodayExerciseList(_ year: Int, _ month: Int, _ day: Int) {
        
        let param = ExerciseFetchForDayReqeust(year: year, month: month, day: day)
        
        APIService.fetchTodayExerciseList(param)
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
            } receiveValue: { (value: TodayExerciseListResponse) in
                
                self.exerciseArray = value.result
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    // TODO: 레벨 색상에 맞게 Cell 색칠하기
    private func getDayOfLevel(_ list: [MonthList]) {
        
        let dayToStringArr = list.map { "\($0.day)" }
        let levels = list.map { $0.level }
        
        let input = Dictionary(uniqueKeysWithValues: zip(dayToStringArr, levels))
        self.dayOfLevelStream.send(input)
    }
}
