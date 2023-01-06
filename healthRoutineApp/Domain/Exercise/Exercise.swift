//
//  Exercise.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/06.
//

import Foundation

typealias ExPart = Exercise.Part
typealias ExKind = Exercise.Kind
typealias ExTime = Exercise.Detail.Time
typealias ExWeight = Exercise.Detail.Weight
typealias ExSet = Exercise.Detail.Set

enum Exercise {
    
    // 운동 부위
    enum Part {
        
    }
    
    // 운동 종류 (기본 제공)
    enum Kind {
        
    }
    
    // 운동 상세 : 무게, 세트, 시간
    enum Detail {
        
        enum Weight {
            
        }
        
        enum Time {
            
            
        }
        
        enum Set {
            
            case one
            case three
            case five
            case six
            
            var localized: String {
                
                switch self {
                    
                case .one: return "1세트"
                case .three: return "3세트"
                case .five: return "5세트"
                case .six: return "6세트"
                }
            }
        }
    }
}
