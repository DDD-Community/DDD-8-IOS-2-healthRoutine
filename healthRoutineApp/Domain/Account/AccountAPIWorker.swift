//
//  AccountAPIWorker.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/15.
//

import Foundation
import Combine

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

fileprivate typealias _API = AccountAPI

final class AccountAPIWorker {

    static let shared = AccountAPIWorker()
    
    func createAccount(accountSignInRequest: AccountSignInRequest, completion: @escaping (Result<AccountResponse, NetworkError>) -> Void) {
        
        let param = ["email": accountSignInRequest.email, "password": accountSignInRequest.password] // JSON 객체로 변환할 딕셔너리 준비
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])

        guard let url = URL(string: _API.signIn.url) else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = paramData
               
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            if let str = String(data: data, encoding: .utf8) {
                debugPrint("str : \(str)")
            }
            
            let signInResponse = try? JSONDecoder().decode(AccountResponse.self, from: data)
            
            if let signInResponse = signInResponse {
                completion(.success(signInResponse))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
//    func fetchMyInfo(completion: @escaping (Result<AccountMyInfoResult, NetworkError>) -> Void) {
//        
//        guard let url = URL(string: _API.userInfo.url) else {
//            return completion(.failure(.badUrl))
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//               
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            
//            guard let data = data, error == nil else {
//                return completion(.failure(.noData))
//            }
//            
//            if let str = String(data: data, encoding: .utf8) {
//                debugPrint("str : \(str)")
//            }
//            
//            let fetchInfoResponse = try? JSONDecoder().decode(AccountMyInfoResponse.self, from: data)
//            
//            if let fetchInfoResponse = fetchInfoResponse {
//                completion(.success(fetchInfoResponse.result))
//            } else {
//                completion(.failure(.decodingError))
//            }
//            
//        }.resume()
//    }
}

//extension AccountAPIWorker {
//
//    func fetchMyInfo() -> Future<AccountMyInfoResult, NetworkError> {
//
//        let spec = _API.userInfo.url
//
//        return Just(spec)
//    }
//}
