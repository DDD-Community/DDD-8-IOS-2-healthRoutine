//
//  MyPageMainViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/23.
//

import Foundation
import Combine

fileprivate protocol MyPageMainViewModelInputs {
    
    func tapProfile()
}

fileprivate protocol MyPageMainViewModelOutputs {
    
    var showDetailView: Published<Bool> { get }
    
    var showBadgeView: Published<Badge> { get }
    var showExerciseSummary: Published<String> { get }
}

class MyPageMainViewModel: ObservableObject {
   
    var cancellables: Set<AnyCancellable> = []

    @Published var nickname: String = ""
    
    
    
    
    private func bindView() {
        
    }
    
    private func fetchInfos() {
        
    }
    
    init() {
        self.bindView()
    }
}
