//
//  LogInViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation
import Combine

class LogInViewModel: ObservableObject {
    
    @Published var id: String = ""
    @Published var password: String = ""
    
    private let _signIn = PassthroughSubject<(String?, String?), Never>()
    func signIn(_ email: String?, _ password: String?) {
        self._signIn.send((email, password))
    }
    
    
}
