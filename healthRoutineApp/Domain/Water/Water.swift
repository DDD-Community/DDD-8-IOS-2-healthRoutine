//
//  Water.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/26.
//

import Foundation

fileprivate enum Water {
    
    case under500
    case under1000
    case over2000
    
    var gif: String {
        
        switch self {
            
        case .under500: return "water-500"
        case .under1000: return "water-1000"
        case .over2000: return "water-2000"
        }
    }
}
