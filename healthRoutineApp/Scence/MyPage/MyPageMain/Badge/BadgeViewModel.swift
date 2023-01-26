//
//  BadgeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation

class BadgeViewModel: ObservableObject {
    
    @Published var badge: Badge = .water
    
    init() {
        self.bindView()
    }
    
    private func bindView() {
        
    }
//    var badgeTapped = Cur
}

extension BadgeViewModel {
    
    func fetchBadgeInfos() {
        
    }
}
