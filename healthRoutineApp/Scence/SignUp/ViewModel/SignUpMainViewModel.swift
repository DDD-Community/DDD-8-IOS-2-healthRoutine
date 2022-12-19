//
//  SignUpMainViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/15.
//

import Foundation
import Combine

class SignUpMainViewModel: ObservableObject {
    var something = Set<AnyCancellable>()

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordconfirm: String = ""
    @Published var nickname: String = ""

    init() {
        test()
    }

    func test() {
        /*
        $email.map {
            $0.em
        }*/
    }

    func requestTest() {
        var sample = AccountSignInRequest(email: "test@test.com", password: "Rjsgml!3246%")
        APIService.signIn(sample)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("\(err)")
                case .finished:
                    print("Finish")
                }
            } receiveValue: { (value: AccountSignInResponse?) in
                print("dddddd")
                print(value)
            }
            .store(in: &something)
    }

    func requestSignup() {

    }
}
