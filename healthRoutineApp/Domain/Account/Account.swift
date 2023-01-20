//
//  Account.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/20.
//

import Foundation

typealias AccountInfo = Account.Info

enum Account {
    
    struct Info: Codable, Equatable {
        
        var id: String?
    
        var nickname: String?
        var photo: String?
    }
}
