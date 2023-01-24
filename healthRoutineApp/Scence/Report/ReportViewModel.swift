//
//  ReportViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/21.
//

import Foundation
import SwiftUI
import Combine

class ReportViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var exerciseArray: [TodayExerciseListResult] = []
    
    var titleStr: String {
        if exerciseArray.isEmpty {
            return "첫 운동을 기록해보세요!"
        }
        else {
            return "오늘은 어떤 운동을 하셨나요?"
        }
    }
    
    func fetchList() {
        APIService.fetchTodayExerciseList()
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
            }
            .store(in: &cancellables)
    }
    
    func getDetailViewModel() -> ReportDetailViewModel {
        let vm = ReportDetailViewModel()
        vm.delegate = self
        return vm
    }
    
}

extension ReportViewModel: UpdateProtocol {
    // 화면 갱신
    func update() {
        self.fetchList()
    }
}
