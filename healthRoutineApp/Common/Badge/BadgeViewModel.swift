//
//  BadgeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Combine
import SwiftUI
import UIKit

struct BadgeInfo {
    
    var image: UIImage?
    var title: String
    var desc: String
    var subDesc: String
}

final class BadgeViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    let queue = DispatchQueue(label: "Badge")
    
    @Published var gainBadge: [Badge?] = []
    @Published var challengeBadge: [Badge?] = []
    
    @Published var gainBadgeIcons: [UIImage?] = []
    @Published var challengeBadgeIcons: [UIImage?] = []
    @Published var totalBadge: [UIImage?] = []
    @Published var latestBadge: Badge?

    @Published var selectedBadge: BadgeInfo?
    
    var isPreseted = PassthroughSubject<Bool, Never>()
    
    func fetchInfos() {
        
        APIService.getBadgeList()
            .subscribe(on: queue)
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
                self.getNowBadgeList(value.result)
            }
            .store(in: &cancellables)
    }
    
    func fetchLatestBadgeInfo() {
        
        APIService.getBadgeList()
            .subscribe(on: queue)
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
    
    private func getNowBadgeList(_ badgeInfo: BadgeListResult) {
        
        guard let mBadge = badgeInfo.myBadge else { return }
        guard let wBadge = badgeInfo.waitingBadge else { return }
        
        self.gainBadge = mBadge.map { Badge(rawValue: $0) }
        self.challengeBadge = wBadge.map { Badge(rawValue: $0) }
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
    
    func showDetailView(_ idx: Int) {
        
        let gainBadgeCnt = self.gainBadgeIcons.count
        
        if gainBadgeCnt > idx {
            
            guard let info = self.gainBadge[idx], let icon = info.icon(with: true) else {
                return
            }
            
            let badgeInfo = BadgeInfo(image: icon, title: info.title, desc: info.desc, subDesc: info.subDesc)
            self.selectedBadge = badgeInfo
            
            self.isPreseted.send(true)
        }
    }
}
