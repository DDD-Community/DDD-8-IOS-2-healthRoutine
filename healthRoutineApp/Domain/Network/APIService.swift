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
        return APIManager.request("http://rest-api.xyz/api/v1/user/validate/email", method: .post, parameters: parameters)
    }

    static func signIn(_ param: AccountSignInRequest)  -> AnyPublisher<AccountSignInResponse, APIError> {
        return APIManager.request("http://rest-api.xyz/API/v1/user/login", method: .post, parameters: param.dictionary)
    }
}

class APIResult: Decodable {
    var code: Int
    var message: String
    var status: String
}
