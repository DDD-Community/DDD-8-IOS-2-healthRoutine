//
//  Encodable+Ext.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/19.
//

import Foundation

extension Encodable {
    var dictionary: [String: String]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: String]}
    }
}
