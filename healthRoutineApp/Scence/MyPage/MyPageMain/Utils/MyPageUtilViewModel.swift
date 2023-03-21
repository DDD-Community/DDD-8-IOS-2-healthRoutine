//
//  MyPageUtilViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/02/26.
//

import Foundation
import Combine
import SwiftUI

final class MyPageUtilsViewModel: ObservableObject {
    
    var cancellables: Set<AnyCancellable> = []
    
    var showToastView = PassthroughSubject<Bool, Never>()
    var signOutFinished = PassthroughSubject<Bool, Never>()
    var withdrawFinished = PassthroughSubject<Bool, Never>()
    var deletAccessToken = PassthroughSubject<Bool, Never>()
    
    func withDraw() {
        
        APIService.withdraw()
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
                self.withdrawFinished.send(true)
            }
            .store(in: &self.cancellables)
    }
}
