//
//  LogInViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation
import Combine

protocol AccountSignInInfoType {
    
    var email: String? { get }
    var password: String? { get }
}

struct AccountSignInInfo: AccountSignInInfoType {
    
    var email: String? = nil
    var password: String? = nil
}

class LogInViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isEamilAble: Bool = false
    @Published var isPasswordAble: Bool = false
    
    @Published var isValidButton: Bool = false
    
    private let _signIn = PassthroughSubject<(String, String), Never>()
    func signIn(_ email: String, _ password: String) {
        self._signIn.send((email, password))
    }
    
    let apiWorker = AccountAPIWorker()
    
    init() {
        self.bindView()
    }
    
    private func bindView() {
        
        $email
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.count > 5}
//            .map { $0.isValidEmail }
            .assign(to: \.isEamilAble, on: self)
            .store(in: &cancellables)
        
        $password
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.count > 5 }
//            .map { $0.isValidPassword }
            .assign(to: \.isPasswordAble, on: self)
            .store(in: &cancellables)
        
        // 이메일 혹은 패스워드 값이 변경될 때 마다 체킹
        $email.combineLatest($password)
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .map { self.updateButtonState(email: $0, password: $1) }
            .assign(to: \.isValidButton, on: self)
            .store(in: &cancellables)
    }
    
    private func updateButtonState(email: String, password: String) -> Bool {
        return email.isValidEmail && password.isValidPassword
    }
    
    private func signInWith(email: String, password: String) {
        
    }
}
