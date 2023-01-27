//
//  APIRepository.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/16.
//

import Foundation
import Alamofire
import Combine
import UIKit

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

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])
        
        return APIManager.request(AccountAPI.userInfo.url, method: .get, headers: headers)
    }
    
    static func updateProfileImage(_ photoImg: UIImage?) -> AnyPublisher<AccountMyInfoImageUploadResponse, APIError> {
        
        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }
        
//        guard let photoData = photoImg.jpegData(compressionQuality: 1.0) else {
//            return Fail(error: NSError(domain: "Missing Photo", code: -10002, userInfo: nil) as! APIError).eraseToAnyPublisher()
//        }
        
        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])
        
//        let mediaParams: [APIMediaParameter] = [APIMediaParameter(name: "image", fileName: "image.jpg", mimeType: "image/jpeg", fileURL: nil, fileData: photoData)]
        
        return APIManager.requestMultipart(AccountAPI.updateProfileImage.url, method: .put, headers: headers, photoFile: photoImg)
    }
    
    static func updateProfile(_ param: AccountProfileUpdateRequest) -> AnyPublisher<DI_Base, APIError> {
     
        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }
        
        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])
        
        return APIManager.request(AccountAPI.userInfo.url, method: .put, parameters: param.dictionary, headers: headers)
    }
}

// MARK: - 운동기록
extension APIService {
    
    static func fetchTodayExerciseList(_ param: ExerciseFetchReqeust) -> AnyPublisher<TodayExerciseListResponse, APIError> {
        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])
        
        return APIManager.request(ExerciseAPI.todayExerciseList.url, method: .get, parameters: param.intDictionary, encoding: URLEncoding.queryString, headers: headers)
    }
    
    static func deleteReport(_ healthId: String) -> AnyPublisher<DI_Base, APIError> {
        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])
        
        return APIManager.request("\(ExerciseAPI.todayExerciseList.url)/\(healthId)", method: .delete, headers: headers)
    }
}
