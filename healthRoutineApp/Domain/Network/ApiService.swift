//
//  ApiRepository.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/16.
//

import Foundation
import Alamofire
import Combine

//enum ApiRepository {
//    static func requestCheckEmailValidation(_ email: String) -> AnyPublisher<ApiResult?, ApiError> {
//        return ApiService.checkEmailValidation(email)
//            .tr
//    }
//}


class ApiService {
    static func checkEmailValidation(_ email: String) -> AnyPublisher<ApiResult, ApiError> {
        var parameters = Parameters()
        parameters["email"] = email
        return ApiManager.request("http://rest-api.xyz/user/validate/email", method: .post, parameters: parameters)
    }

    static func signIn(_ param: AccountSignInRequest)  -> AnyPublisher<AccountSignInResponse, ApiError> {
        return ApiManager.request("http://rest-api.xyz/api/v1/user/login", method: .post, parameters: param.dictionary)
    }
}

class ApiResult: Decodable {
    var code: Int
    var message: String
    var status: String
}
