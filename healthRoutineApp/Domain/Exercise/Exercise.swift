//
//  Exercise.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/06.
//

import Foundation

typealias ExPart = Exercise.Part
typealias ExTime = Exercise.Detail.Time
typealias ExWeight = Exercise.Detail.Weight
typealias ExSet = Exercise.Detail.Set

enum Exercise {
    
    // 운동 부위
    enum Part {
        
    }
    
    // 운동 상세 : 무게, 세트, 시간
    enum Detail {
        
        enum Weight {
            
            case two
            case five
            case ten
            case twenty
            
            var localized: String {
                
                switch self {
                case .two: return "2분"
                case .five: return "5분"
                case .ten: return "10분"
                case .twenty: return "20분"
                }
            }
        }
        
        enum Time {
            
            case tenMin
            case quarter
            case half
            case hour
            
            var localized: String {
                
                switch self {
                    
                case .tenMin: return "10분"
                case .quarter: return "15분"
                case .half: return "30분"
                case .hour: return "60분"
                }
            }
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
