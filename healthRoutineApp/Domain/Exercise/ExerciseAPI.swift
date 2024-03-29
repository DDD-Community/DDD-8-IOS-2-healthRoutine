//
//  ExerciseAPI.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/25.
//

import Foundation
import Alamofire
import Combine

enum ExerciseAPI {
    
    case montly // 메인 월 별 잔디
    case todayExerciseList // 오늘 운동기록
    case exercise // 전체 운동기록
    case history
    
    
    var url: String {
        
        switch self {
            
        case .todayExerciseList: return "\(HealthRoutineAPI.baseURL)/exercise/today"
        case .exercise: return "\(HealthRoutineAPI.baseURL)/exercise"
        case .montly: return "\(HealthRoutineAPI.baseURL)/exercise/monthly"
        case .history: return "\(HealthRoutineAPI.baseURL)/exercise/history"
        }
    }
}

extension APIService {
    
    static func getMonthlyExerciseInfo(_ parm: MonthExerciseFetchRequest) -> AnyPublisher<MonthlyExerciseListResponse, APIError> {
        
        // MARK: Token
        guard let token = KeychainService.shared.loadToken() else {
            return Fail(error: NSError(domain: "Missing Token", code: -10001, userInfo: nil) as! APIError).eraseToAnyPublisher()
        }

        let headers: HTTPHeaders? = HTTPHeaders([HealthRoutineAPI.Header.authFieldName: HealthRoutineAPI.Header.auth(token).value])
        
        return APIManager.request(ExerciseAPI.montly.url, method: .get, parameters: parm.intDictionary, encoding: URLEncoding.queryString, headers: headers)
    }
}
