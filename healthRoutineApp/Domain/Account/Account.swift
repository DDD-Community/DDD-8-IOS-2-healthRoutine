//
//  Account.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/24.
//

import Foundation

typealias AccountInfo = Account.Info
enum Account {
    
    struct Info {
        
        var id: String?
        var nickname: String?
        var profileImage: String?
    }
}
