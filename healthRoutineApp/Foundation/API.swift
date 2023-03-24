//
//  API.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/23.
//

import Foundation
import Alamofire

// MARK: API Constants
enum APIConst {
    static let boundary = UUID().uuidString
}

// MARK: API Header Protocol
protocol APIHeader {
    var key: String { get }
    var value: String { get }
}

// MARK: API Prameter Protocol
protocol APIParameter {
    var key: String { get }
    var value: Any? { get }
}

// MARK: API Media Prameter
struct APIMediaParameter {
    let name: String
    let fileName: String
    let mimeType: String
    let fileURL: URL?
    let fileData: Data?
}
