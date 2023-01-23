//
//  API.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/23.
//

import Foundation
import Alamofire


// MARK: API Header Protocol
protocol APIHeader {
    var key: String { get }
    var value: String { get }
}

// MARK: API Media Prameter
struct APIMediaParameter {
    let name: String
    let fileName: String
    let mimeType: String
    let fileURL: URL?
    let fileData: Data?
}

struct NoResponse: Codable {
    // 응답의 정상 혹은 오류 여부만 체크하는 응답 (닉네임 변경)
    var code: Int?
}
