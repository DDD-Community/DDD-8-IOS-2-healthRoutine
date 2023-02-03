//
//  BadgeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Combine

class BadgeViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    var badgeTapped = PassthroughSubject<Badge, Never>()
    @Published var showBadgeModal: Bool = false
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
    
    func fetchLatestBadgeInfo() {
        
        APIService.getLatestBadge()
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
                
            } receiveValue: { (value: BadgeLastestResponse) in
               
                
            }
            .store(in: &cancellables)
    }
}

extension BadgeViewModel {
    
    private func updateBadgeView(_ badgeInfos: BadgeListResult) {
        
    }
}
