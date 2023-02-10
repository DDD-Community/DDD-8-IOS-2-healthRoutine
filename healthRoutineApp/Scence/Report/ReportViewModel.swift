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
        let param = ExerciseFetchReqeust(time: Int(Date().millisecondsSince1970))
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
                self.exerciseArray = [TodayExerciseListResult(id: "1", exerciseSubject: "덤벨 숄더 프레스", categorySubject: "어깨", weight: 5, reps: 10, set: 3), TodayExerciseListResult(id: "1", exerciseSubject: "덤벨 플라이", categorySubject: "가슴", weight: 20, reps: 10, set: 3)]
            }
            .store(in: &cancellables)
    }
    
    func deleteReport(_ id: String) {
        self.updateUI(id) // 통신전 삭제 UI 업데이트
        APIService.deleteReport(id)
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
            } receiveValue: { _ in
                self.fetchList()
            }
            .store(in: &cancellables)
    }
    
    func updateUI(_ deleteId: String) {
        let index = exerciseArray.firstIndex{ $0.id == deleteId }
        if let index = index {
            exerciseArray.remove(at: index)
        }
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
    
    func add() {
        self.exerciseArray.append(TodayExerciseListResult(id: "1", exerciseSubject: "덤벨 플라이", categorySubject: "가슴", weight: 2, reps: 10, set: 3))
    }
}
 
