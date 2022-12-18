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
    
    func createAccount(accountSignInRequest: AccountSignInRequest, completion: @escaping (Result<AccountSignInResponse, NetworkError>) -> Void) {
        
        guard let url = URL(string: _API.signIn.url) else {
            return completion(.failure(.badUrl))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(accountSignInRequest)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let signInResponse = try? JSONDecoder().decode(AccountSignInResponse.self, from: data)
            
            if let signInResponse = signInResponse {
                completion(.success(signInResponse))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}
