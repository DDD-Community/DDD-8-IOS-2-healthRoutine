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
    private var cancellables: Set<AnyCancellable> = []
    weak var delegate: UpdateProtocol?
    
    @Published var categoryArray: [DI_Category] = []

    // 선택된 카테고리(부위)
    @Published var selectedCategory: DI_Category?
    @Published var selectedExercise: DI_Exercise?


    @Published var weight: String = ""
    @Published var count: String = ""
    @Published var set: String = ""

    
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
        // 운동 추가 통신
    }
    
}
