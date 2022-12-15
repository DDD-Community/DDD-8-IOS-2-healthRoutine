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
    
    @Published var form = AccountSignInInfo()
    
    @Published var id: String = ""
    @Published var password: String = ""
    
    private let _signIn = PassthroughSubject<(String?, String?), Never>()
    func signIn(_ email: String?, _ password: String?) {
        self._signIn.send((email, password))
    }
    
    init() {
        self.bindView()
    }
    
    private func bindView() {
        
//        self._signIn
    }
    
    private func signInWith(email: String, password: String) {
        
    }
}
