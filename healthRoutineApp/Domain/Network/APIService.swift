//
//  APIRepository.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/16.
//

import Foundation
import Alamofire
import Combine

class APIService {
    static func checkEmailValidation(_ email: String) -> AnyPublisher<DI_Base, APIError> {
        var parameters = Parameters()
        parameters["email"] = email
        return APIManager.request("https://rest-api.xyz/api/v1/user/validate/email", method: .post, parameters: parameters)
    }

    static func signIn(_ param: AccountSignInRequest)  -> AnyPublisher<AccountResponse, APIError> {
        return APIManager.request("https://rest-api.xyz/API/v1/user/login", method: .post, parameters: param.dictionary)
    }
    
    static func signUp(_ param: AccountSignUpRequest) -> AnyPublisher<AccountResponse, APIError> {
        return APIManager.request("https://rest-api.xyz/api/v1/user/register", method: .post, parameters: param.dictionary)
    }
}
