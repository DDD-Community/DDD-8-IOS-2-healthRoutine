//
//  DI_Category.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/02/10.
//

import Foundation

class DI_Category: Codable, Hashable {
    static func == (lhs: DI_Category, rhs: DI_Category) -> Bool {
        if lhs.id == rhs.id {
            return true
        }
        else {
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id: Int
    let subject: String
    var exercise: [DI_Exercise]
}

class DI_Exercise: Codable, Hashable {
    static func == (lhs: DI_Exercise, rhs: DI_Exercise) -> Bool {
        if lhs.id == rhs.id {
            return true
        }
        else {
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    let subject: String
    
    init(_ id: Int, _ subject: String) {
        self.id = id
        self.subject = subject
    }
}
