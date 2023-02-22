//
//  ReportDetailViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/21.
//

import Foundation
import SwiftUI
import Combine

protocol UpdateProtocol: AnyObject {
    func update()
    func add()
}

class ReportDetailViewModel: ObservableObject {
    var cancellables: Set<AnyCancellable> = []
    weak var delegate: UpdateProtocol?
    
    @Published var categoryArray: [DI_Category] = []

    // 선택된 카테고리(부위)
    @Published var selectedCategory: DI_Category?
    // 선택된 운동
    @Published var selectedExercise: DI_Exercise?

    @Published var weight: String = ""
    @Published var count: String = ""
    @Published var set: String = ""
    @Published var isAddAble: Bool = false

    var addFinished = PassthroughSubject<Bool, Never>()

    init() {
        self.bind()
    }

    func bind() {
        $selectedExercise
            .map { $0 != nil }
            .assign(to: \.isAddAble, on: self)
            .store(in: &cancellables)
    }

    func fetchList() {
        APIService.fetchCategoryExerciseList()
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
            } receiveValue: { (value: CategoryExerciseListResponse) in
                self.categoryArray = value.result
            }
            .store(in: &cancellables)
    }

    func addRepport() {
        guard let selectedExercise = selectedExercise else { return }
        let weight: Int? = self.weight.toInt() == 0 ? nil : self.weight.toInt()
        let set: Int? = self.set.toInt() == 0 ? nil : self.set.toInt()
        let reps: Int? = self.count.toInt() == 0 ? nil : self.count.toInt()

        let requestData = ExerciseTotalAddRequest(exerciseId: selectedExercise.id, weight: weight, set: set, reps: reps)
        APIService.addExerciseReport(requestData)
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
                self.addFinished.send(true)
            }
            .store(in: &cancellables)
    }
}
