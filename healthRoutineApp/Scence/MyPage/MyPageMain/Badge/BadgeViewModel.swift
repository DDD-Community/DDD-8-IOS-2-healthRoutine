//
//  BadgeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Combine
import UIKit

struct BadgeIteViewInfo {
    
    var type: Badge?
    var icon: UIImage?
    var title: String
    var desc: String
}

protocol BadgeViewModelInputs {
    
    func tapped()
}

protocol BadgeViewModelOutputs {
    
    var icon: AnyPublisher<UIImage?, Never> { get }
    var title: AnyPublisher<String, Never> { get }
    var desc: AnyPublisher<String, Never> { get }
}


final class BadgeViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    var badgeTapped = PassthroughSubject<Badge, Never>()
    
    @Published var latestedBadgeInfo: Badge = .exerciseStart
    @Published var gainBadges: [Badge] = []
    
    @Published var showBadgeModal: Bool = false
    
    
    var icon: AnyPublisher<UIImage?, Never>
    var title: AnyPublisher<String, Never>
    var desc: AnyPublisher<String, Never>
    
    private let _viewInfo: CurrentValueSubject<BadgeIteViewInfo, Never>
    
    // MARK: Inputs
    func tapped() {
        self.fetchBadgeInfos()
    }
    
    init(with viewInfo: BadgeIteViewInfo) {
        
        self._viewInfo = CurrentValueSubject<BadgeIteViewInfo, Never>(viewInfo)
        
        self.icon = self._viewInfo.map { $0.icon }.eraseToAnyPublisher()
        self.title = self._viewInfo.map { $0.title }.eraseToAnyPublisher()
        self.desc = self._viewInfo.map { $0.desc }.eraseToAnyPublisher()
        
        self.bind()
    }
    
    private func bind() {
        
        
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
    
    private func getLatestBadgeInfo(_ badgeInfos: BadgeListResponse) {
        
        guard let _ = badgeInfos.result.latestBadge else {
            return
        }
        
        if badgeInfos.result.exerciseStart {
            
            self.gainBadges.append(.exerciseStart)
        }
    }
}
