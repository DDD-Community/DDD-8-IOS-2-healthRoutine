//
//  BadgeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Combine

class BadgeViewModel: ObservableObject {
    
    // Badge Id값 받아서 Tap에 해당하는 id값 전달해서 뿌릴예정
    var cancellables: Set<AnyCancellable> = []
    
    @Published var latestBadge: Badge = .water
    
    init() {
        self.bindView()
    }
    
    private func bindView() {
        
    }
}

extension BadgeViewModel {
    
    func fetchBadgeInfos() {
     
        APIService.getBadgeList()
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
            } receiveValue: { (value: BadgeListResponse) in
                self.updateBadgeView(value.result)
            }
            .store(in: &cancellables)
    }
    
    
}

extension BadgeViewModel {
    
    private func updateBadgeView(_ badgeInfos: BadgeListResult) {
        
    }
}
