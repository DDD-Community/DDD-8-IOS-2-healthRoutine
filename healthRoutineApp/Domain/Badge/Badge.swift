//
//  Badge.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/12.
//

import Foundation

enum Badge: String, CaseIterable {
    
    case water = "Water"
    case waterUpgrade = "WaterUpgrade"
    case sincerity = "Sincerity"
    case sincerityUpgrade = "SincerityUpgrade"
    case exBeginner = "ExBeginner"
    case exPreIntermediate = "ExPreIntermediate"
    case exUpperIntermediate = "ExUpperIntermediate"
    case exExpert = "ExExpert"
    
    var index: Int {
        switch self {
        case .water: return 1
        case .waterUpgrade: return 2
        case .sincerity: return 3
        case .sincerityUpgrade: return 4
        case .exBeginner: return 5
        case .exPreIntermediate: return 6
        case .exUpperIntermediate: return 7
        case .exExpert: return 8
        }
    }
    
    var title: String {
        
        switch self {
        case .water: return "벌컵 벌컵"
        case .waterUpgrade: return "물먹는 하마"
        case .sincerity: return  "운동 시작"
        case .sincerityUpgrade: return "운동의 기쁨"
        case .exBeginner: return "운동의 홀릭"
        case .exPreIntermediate: return "운동의 마스터"
        case .exUpperIntermediate: return "성실은 성장 중"
        case .exExpert: return "성실 왕"
        }
    }
    
    var desc: String {
        
        switch self {
        case .water: return "물먹는 재미를 느껴봐요!"
        case .waterUpgrade: return "물 먹는 습관 마스터!"
        case .sincerity: return  "멈추지 마세요! 시작이 반이에요!"
        case .sincerityUpgrade: return "누구보다 꾸준한 당신 멋져요!"
        case .exBeginner: return "당신의 시작을 응원해요!"
        case .exPreIntermediate: return "운동의 기쁨에 바졌군요 파이팅!"
        case .exUpperIntermediate: return "운동 홀릭 당신 멋져요!"
        case .exExpert: return "평생 가는 운동 습관 형성 완료!"
        }
    }
    
    var subDesc: String {
        
        switch self {
        case .water: return "물기록 1회 사용"
        case .waterUpgrade: return "물기록 100회 사용"
        case .sincerity: return  "기록 100% 1회 달성"
        case .sincerityUpgrade: return "기록 100% 30회 달성"
        case .exBeginner: return "운동 기록 1회 사용"
        case .exPreIntermediate: return "운동 기록 30회 사용"
        case .exUpperIntermediate: return "운동 기록 50회 사용"
        case .exExpert: return "운동 기록 100회 사용"
        }
    }
    
    var icon: String {
        
        switch self {
        case .water: return "water1"
        case .waterUpgrade: return "water2"
        case .sincerity: return  "sincerity1"
        case .sincerityUpgrade: return "sincerity2"
        case .exBeginner: return "exercise1"
        case .exPreIntermediate: return "exercise2"
        case .exUpperIntermediate: return "exercise3"
        case .exExpert: return "exercise4"
        }
    }
}
