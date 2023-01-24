//
//  AccountSignInResponse.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/18.
//

import Foundation

struct AccountResponse: Decodable {
    let code: Int
    let message: String
    let result: AccountResult
}

struct AccountResult: Codable {
    let token: String?
    let email: String
    let nickname: String
}

struct AccountMyInfoProfileResponse: Decodable {
    
    let code: Int
    let message: String
    let result: AccountMyInfoProfileResult
}

struct AccountMyInfoProfileResult: Codable {
    
    let id: String
    let nickname: String
    let profileImage: String?
}


// MARK: - update profile
struct AccountMyInfoImageUploadResponse: Decodable {
    let code: Int
    let message: String
    let result: AccountMyInfoProfileUpdateResult
}

struct AccountMyInfoProfileUpdateResult: Codable {
    let profileImageUrl: String
}


// MARK: - exercise
struct TodayExerciseListResponse: Decodable {
    let code: Int
    let message: String
    let result: [TodayExerciseListResult]
}

struct TodayExerciseListResult: Codable, Hashable {
    let exerciseId: Int
    let exerciseSubject: String
    let categorySubject: String
    let weight: Int
    let set: Int
    let count: Int
    let createdAt: Int
}
