//
//  WaterIntakeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Combine

class WaterIntakeViewModel: ObservableObject {

    var cancellables: Set<AnyCancellable> = []
    
    @Published var waterAmount: Int = 0
    @Published var gifName: String = ""
    
    init() {
        self.bind()
    }
    
    private func bind() {
        
        $waterAmount
            .filter { $0 >= 0 }
            .receive(on: RunLoop.main)
            .map { self.updateGIFView($0) }
            .assign(to: \.gifName, on: self)
            .store(in: &cancellables)
    }
}

extension WaterIntakeViewModel {
    
    private func updateGIFView(_ amount: Int) -> String {
        
        if amount >= 2000 {
            
            return "water-2000"
            
        } else if amount < 2000 && amount > 500 {
            
            return "water-1000"
            
        } else if amount <= 500 {
            
            return "water-500"
        }
        
        return "water-500"
    }
    
    func plusAmount() {
        self.waterAmount += 250
    }
    
    func minusAmount() {
        self.waterAmount -= 250
    }
}
