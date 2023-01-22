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

        return APIManager.request(AccountAPI.checkEmailValidation.url, method: .post, parameters: parameters)
    }

    static func signIn(_ param: AccountSignInRequest)  -> AnyPublisher<AccountResponse, APIError> {
        return APIManager.request(AccountAPI.signIn.url, method: .post, parameters: param.dictionary)
    }
    
    static func signUp(_ param: AccountSignUpRequest) -> AnyPublisher<AccountResponse, APIError> {
        return APIManager.request(AccountAPI.signUp.url, method: .post, parameters: param.dictionary)
    }
}


// MARK: - MyPage
extension APIService {
    
    static func fetchProfileInfo() -> AnyPublisher<AccountMyInfoProfileResponse, APIError> {
        
        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([AccountAPI.Header.authFieldName: AccountAPI.Header.auth(token).value])
        
        return APIManager.request(AccountAPI.userInfo.url, method: .get, headers: headers)
    }
    
    static func updateInfo(_ param: AccountUpdateInfoRequest) -> AnyPublisher<AccountResponse, APIError> {
        return APIManager.request(AccountAPI.userInfo.url, method: .post, parameters: param.dictionary)
    }
}
