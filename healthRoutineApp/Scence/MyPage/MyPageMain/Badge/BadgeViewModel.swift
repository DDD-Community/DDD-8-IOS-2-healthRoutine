//
//  BadgeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Combine

class BadgeViewModel: ObservableObject {
    
    @Published var badge: Badge = .water
    var cancellables: Set<AnyCancellable> = []
    
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
