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
    
    let dayOfLevelStream = PassthroughSubject<[String: Int], Never>()
    @Published var dayOfLevel: [String: Int] = [:]
    @Published var backColor = Color.yellow
    
    init() {
        
        self.dayOfLevelStream
            .sink(receiveValue: { dicts in
                
                debugPrint("dict: \(dicts)")
                
                for value in dicts.values {
                    
                    debugPrint("value: \(value)")
                    
                    switch value {
                    case 0: return self.backColor = Color(hex: "F9F9F9")
                    case 1: return self.backColor = Color(hex: "CAFFEB")
                    case 2: return self.backColor = Color(hex: "6AFFC9")
                    case 3: return self.backColor = Color(hex: "00FFA3")
                    default: return self.backColor = Color(hex: "363740")
                    }
                }
            })
            .store(in: &self.cancellables)
    }
    
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
                self.getDayOfLevel(value.result.data)
            }
            .store(in: &cancellables)
    }
    
    // TODO: 레벨 색상에 맞게 Cell 색칠하기
    private func getDayOfLevel(_ list: [MonthList]) {
        
        let dayToStringArr = list.map { "\($0.day)" }
        let levels = list.map { $0.level }
        
        //        for (index, key) in dayToStringArr.enumerated() {
        //            self.dayOfLevel[key] = levels[index]
        //        }
        
        dayOfLevel = Dictionary(uniqueKeysWithValues: zip(dayToStringArr, levels))
        dayOfLevelStream.send(Dictionary(uniqueKeysWithValues: zip(dayToStringArr, levels)))
        
        print("dict2: \(dayOfLevel)")
    }
}
