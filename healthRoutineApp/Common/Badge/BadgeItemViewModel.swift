//
//  BadgeItemViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/02/08.
//

import Foundation
import Combine
import UIKit

struct BadgeItemViewInfo {
    
    var gainItems: [Badge] = []
    var challengeItems: [Badge] = []
    var icon: UIImage?

    fileprivate init(fetchResult: BadgeListResult) {
        
        let result = fetchResult
        
        result.exerciseStart ? self.gainItems.append(.exerciseStart) : self.challengeItems.append(.exerciseStart)
        result.exerciseHappy ? self.gainItems.append(.exerciseHappy) : self.challengeItems.append(.exerciseHappy)
        result.exerciseHolic ? self.gainItems.append(.exerciseHolic) : self.challengeItems.append(.exerciseHolic)
        result.exerciseMaster ? self.gainItems.append(.exerciseMaster) : self.challengeItems.append(.exerciseMaster)
        result.exerciseChampion ? self.gainItems.append(.exerciseChampion) : self.challengeItems.append(.exerciseChampion)
        result.sincerityJunior ? self.gainItems.append(.sincerityJunior) : self.challengeItems.append(.sincerityJunior)
        result.sincerityPro ? self.gainItems.append(.sincerityPro) : self.challengeItems.append(.sincerityPro)
        result.sincerityMaster ? self.gainItems.append(.sincerityMaster) : self.challengeItems.append(.sincerityMaster)
        result.sincerityChampion ? self.gainItems.append(.sincerityChampion) : self.challengeItems.append(.sincerityChampion)
        result.drinkHoneyHoney ? self.gainItems.append(.drinkHoneyHoney) : self.challengeItems.append(.drinkHoneyHoney)
        result.drinkBulkUpBulkUp ? self.gainItems.append(.drinkBulkUpBulkUp) : self.challengeItems.append(.drinkBulkUpBulkUp)
        result.drinkHippo ? self.gainItems.append(.drinkHippo) : self.challengeItems.append(.drinkHippo)
    }
}

protocol BadgeViewModelInputs {}

protocol BadgeViewModelOutputs {
    
    var icon: AnyPublisher<UIImage?, Never> { get }
}

final class BadgeItemViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    var icon: AnyPublisher<UIImage?, Never>
    private let _viewInfo: CurrentValueSubject<BadgeItemViewInfo, Never>
    
    // MARK: Inputs
    private let _fetchInfo = PassthroughSubject<Void, Never>()
    func tapped() {
        self._fetchInfo.send(())
    }
    
    init(with viewInfo: BadgeItemViewInfo) {
        
        self._viewInfo = CurrentValueSubject<BadgeItemViewInfo, Never>(viewInfo)
        
        self.icon = self._viewInfo.map { $0.icon }.eraseToAnyPublisher()
        self.bind()
    }
    
    private func bind() {
        
        self._fetchInfo
            .receive(on: RunLoop.main)
            .flatMap { APIService.getBadgeList() }
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

            }
            .store(in: &cancellables)
    }
    
    private func updateBadgeView() {
        
        
    }
}
