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
    
    @Published var email: String = "test@test.com"
    @Published var isActiveEmailField: Bool = false
    
    @Published var password: String = "Rjsgml!3246%"
    @Published var isActivePasswordField: Bool = false
    
    @Published var errrorMsg: String = ""
    
    @Published var canSubmit: Bool = false
    
    private var _close = PassthroughSubject<Bool, Never>()
    func close(with result: Bool) {
        self._close.send(result)
    }
   
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
        
        _close.receive(on: RunLoop.main)
            .sink { self.close(with: $0) }
            .store(in: &cancellables)
    }
    
    func signInWith() {
        
        let request = AccountSignInRequest(email: self.email, password: self.password)
        
        APIService.signIn(request)
            .sink { completion in
                switch completion {
                case .failure:
                    self.errrorMsg = "회원정보 조회에 실패했습니다."
                case .finished:
                    print("Finish")
                }
            } receiveValue: { (value: AccountSignInResponse?) in
                
                self._close.send(true)
            }
            .store(in: &cancellables)
    }
}
