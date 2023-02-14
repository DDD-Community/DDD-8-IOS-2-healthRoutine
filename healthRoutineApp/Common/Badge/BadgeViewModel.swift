//
//  BadgeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Combine
import UIKit

final class BadgeViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    @Published var gainBadgeIcons: [UIImage?] = []
    @Published var challengeBadgeIcons: [UIImage?] = []
    @Published var totalBadge: [UIImage?] = []
    @Published var latestBadge: Badge?
    
    func fetchInfos() {
        
        APIService.getBadgeList()
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
                
                self.updateBadgeDetailView(value.result)
            }
            .store(in: &cancellables)
    }
    
    func fetchLatestBadgeInfo() {
        
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
                
                self.updateHomeBadgeRowView(value.result)
            }
            .store(in: &cancellables)
    }
    
    private func updateBadgeDetailView(_ badgeInfo: BadgeListResult) {
        
        guard let mBadgeName = badgeInfo.myBadge else { return }
        guard let wBadgeName = badgeInfo.waitingBadge else { return }
        
        self.challengeBadgeIcons = wBadgeName.map { Badge(rawValue: $0) }.map { $0?.icon(with: false) }
        self.gainBadgeIcons = mBadgeName.map { Badge(rawValue: $0) }.map { $0?.icon(with: true) }
        
        self.totalBadge.append(contentsOf: self.gainBadgeIcons)
        self.totalBadge.append(contentsOf: self.challengeBadgeIcons)
    }
    
    private func updateHomeBadgeRowView(_ badgeInfo: BadgeListResult) {
        
        guard let badgeName = badgeInfo.latestBadge else { return }
        self.latestBadge = Badge(rawValue: badgeName)
    }
}
