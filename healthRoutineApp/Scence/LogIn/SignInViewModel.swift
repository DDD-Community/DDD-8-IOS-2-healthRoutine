//
//  LogInViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation
import Combine

class SignInViewModel: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var email: String = ""
    @Published var isActiveEmailField: Bool = false
    
    @Published var password: String = ""
    @Published var isActivePasswordField: Bool = false
    
    @Published var canSubmit: Bool = false
    
    let apiWorker = AccountAPIWorker()
    
    init() {
        self.bindView()
    }
    
    private func bindView() {
        
        $email
            .map { $0.count > 0 } // 입력되면 활성화로 기획되어 있음
            .assign(to: \.isActiveEmailField, on: self)
            .store(in: &cancellables)
        
        $password
            .map { $0.count > 0 } // 입력되면 활성화로 기획되어 있음
            .assign(to: \.isActivePasswordField, on: self)
            .store(in: &cancellables)
        
        Publishers.CombineLatest($isActiveEmailField, $isActivePasswordField) // 둘중에 하나의 값이라도 바뀌면 해당 구문 실행
            .map { $0 && $1 }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellables)
    }
    
    func signInWith() {
        debugPrint("로그인 시도!!")
        self.apiWorker.signInWith(email: email, password: password)
    }
}
