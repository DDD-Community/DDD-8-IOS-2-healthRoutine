//
//  APIManager.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/16.
//

import Foundation
import Combine
import Alamofire


enum APIError: Error {
    case http(ErrorData)
    case parsing(String, String)
    case unknown
}

struct ErrorData: Codable {
    var errorCode: Int
    var errorDescription: String?
}

enum APIManager {
    private static let REQUEST_TIMEOUT = TimeInterval(40) // 서버 타임아웃

    static func request<T: Decodable>(_ url: String,
                                      method: HTTPMethod = .get,
                                      parameters: Parameters? = nil,
                                      encoding: ParameterEncoding = JSONEncoding.default,
                                      headers: HTTPHeaders? = nil,
                                      decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, APIError> {
        let request = AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers) { urlRequest in
            urlRequest.timeoutInterval = REQUEST_TIMEOUT
        }
        return request.validate(statusCode: 200..<600).publishData(emptyResponseCodes: [200, 204, 205]) // 200, 204, 205 응답은 서버 응답 데이터가 비어있어도 성공ㄱ ㄱ
            .tryMap { result -> T in
                do {
                    return try handleResponse(result: result, decoder: decoder)
                }
                catch let error {
                    throw error
                }
            }
            .mapError({ (error) -> APIError in
                return handleError(error)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private static func handleResponse<T: Decodable>(result: DataResponsePublisher<Data>.Output,
                                                     decoder: JSONDecoder = JSONDecoder()) throws -> T {
        print(result.debugDescription)
        if let error = result.error {
            if let responseCode = error.responseCode {
                throw APIError.http(ErrorData(errorCode: responseCode, errorDescription: error.errorDescription))
            }
            else {
                throw error
            }
        }
        if let data = result.data {
            guard let value = try? decoder.decode(T.self, from: data) else {
                throw APIError.parsing("에러", "파싱오류") // 임시 하드코딩
            }
            return value
        }
        else {
            return Empty.emptyValue() as! T
        }
    }

    private static func handleError(_ error: Error) -> APIError {
        if let apiError = error as? APIError {
            return apiError
        }
        else {
            return .unknown
        }
    }
}
