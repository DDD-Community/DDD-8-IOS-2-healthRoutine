//
//  HomeWaterIntakeViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Combine

final class HomeWaterIntakeViewModel: ObservableObject {

    var cancellables: Set<AnyCancellable> = []
    
    @Published var waterAmount: Int = 0
    @Published var todayWaterAmount: Int = 0
    @Published var gifName: String = ""
    
    func fetchInfos() {
        
        let date = Date()
        let calendar = Calendar.current
    
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let request = WaterAmountRequest(year: year, month: month, day: day)
        
        APIService.getWaterAmount(request)
            .removeDuplicates()
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
            } receiveValue: { (value: WaterAmountResponse) in
                
                self.waterAmount = value.result.capacity
                self.updateView(self.waterAmount)
            }
            .store(in: &cancellables)
    }
    
    func fetchTodayWaterAmount(_ year: Int, _ month: Int, _ day: Int) {
        
        let param = WaterAmountRequest(year: year, month: month, day: day)
        
        APIService.getWaterAmount(param)
            .removeDuplicates()
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
            } receiveValue: { (value: WaterAmountResponse) in
                
                self.todayWaterAmount = value.result.capacity
                self.updateTodayView(self.todayWaterAmount)
            }
            .store(in: &cancellables)
    }
    
    func updateInfos(_ amount: Int) {
        
        let param = WaterAmountUpdateRequest(capacity: amount)

        APIService.updateWaterAmount(param)
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
            } receiveValue: { (value: DI_Base) in
                
            }
            .store(in: &cancellables)
    }
}

extension HomeWaterIntakeViewModel {
    
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
    
    private func updateTodayGIFView(_ amount: Int) -> String {
        
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
        if self.waterAmount < 0 {
            self.waterAmount = 0
        }
    }
    
    func updateView(_ waterAmount: Int) {
        
        let waterAmountStream = $waterAmount
            .removeDuplicates()
            .filter { $0 >= 0 }
            .receive(on: RunLoop.main)
        
        waterAmountStream
            .map { self.updateGIFView($0) }
            .assign(to: \.gifName, on: self)
            .store(in: &cancellables)
        
        waterAmountStream
            .sink { self.updateInfos($0) }
            .store(in: &cancellables)
    }
    
    func updateTodayView(_ waterAmount: Int) {
        
         $todayWaterAmount
            .removeDuplicates()
            .filter { $0 >= 0 }
            .receive(on: RunLoop.main)
            .map { self.updateTodayGIFView($0) }
            .assign(to: \.gifName, on: self)
            .store(in: &cancellables)
    }
}
