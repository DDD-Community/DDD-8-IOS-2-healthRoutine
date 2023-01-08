//
//  localized.swift
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
    enum Part: CaseIterable, Comparable {
        
        static let ordered: [ExPart] = Self.allCases.sorted()
        
        case chest
        case arm
        case leg
        case body
        case hip
        case back
        case shoulder
        case abs
        case test
        
        var index: Int {
            switch self {
            case .chest: return 0
            case .arm: return 1
            case .leg: return 2
            case .hip: return 3
            case .back: return 4
            case .shoulder: return 5
            case .abs: return 6
            case .body: return 7
            case .test: return 8
            }
        }
        
        var localized: String {
            
            switch self {
                
            case .chest: return "가슴"
            case .arm: return "팔"
            case .leg: return "하체"
            case .hip: return "엉덩이"
            case .back: return "등"
            case .shoulder: return "어깨"
            case .abs: return "복근"
            case .body: return "전신"
            case .test: return "테스트"
            }
        }
    }
    
    // 운동 상세 : 무게, 세트, 시간
    enum Detail {
        
        enum Weight: CaseIterable {
            
            case two
            case five
            case ten
            case twenty
            
            var localized: String {
                
                switch self {
                case .two: return "+ 2분"
                case .five: return "+ 5분"
                case .ten: return "+ 10분"
                case .twenty: return "+ 20분"
                }
            }
        }
        
        enum Time: CaseIterable {
            
            case tenMin
            case quarter
            case half
            case hour
            
            var localized: String {
                
                switch self {
                    
                case .tenMin: return "+ 10분"
                case .quarter: return "+ 15분"
                case .half: return "+ 30분"
                case .hour: return "+ 60분"
                }
            }
        }
        
        enum Set: CaseIterable {
            
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
