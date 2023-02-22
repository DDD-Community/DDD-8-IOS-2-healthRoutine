//
//  localized.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/06.
//

import Foundation

typealias ExPart = Exercise.Part
typealias ExWeight = Exercise.Detail.Weight
typealias ExSet = Exercise.Detail.Set
typealias ExCount = Exercise.Detail.Count

enum Exercise {

    // 운동 부위
    enum Part: CaseIterable, Comparable, Identifiable {
        
        var id: Self {
            return self
        }
        
        static let ordered: [ExPart] = Self.allCases.sorted()
        
        case chest
        case arm
        case leg
        case body
        case hip
        case back
        case shoulder
        case abs
        
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
            }
        }
    }


    // 운동 상세 : 무게, 세트, 시간
    enum Detail {
        
        enum Weight: Int, CaseIterable {
            
            case two = 2
            case five = 5
            case ten = 10
            case twenty = 20
            
            var localized: String {
                
                switch self {
                case .two: return "+2kg"
                case .five: return "+5kg"
                case .ten: return "+10kg"
                case .twenty: return "+20kg"
                }
            }
        }

        
        enum Count: Int, CaseIterable {
            case one = 1
            case three = 3
            case five = 5
            case ten = 10
            
            var localized: String {
                
                switch self {
                    
                case .one: return "+1번"
                case .three: return "+3번"
                case .five: return "+5번"
                case .ten: return "+10번"
                }
            }
        }
        
        enum Set: Int, CaseIterable {
            
            case one = 1
            case three = 3
            case five = 5
            case ten = 10
            
            var localized: String {
                
                switch self {
                    
                case .one: return "+1세트"
                case .three: return "+3세트"
                case .five: return "+5세트"
                case .ten: return "+10세트"
                }
            }
        }
    }
}
