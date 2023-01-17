//
//  Badge.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/12.
//

import Foundation

enum Badge: String, CaseIterable {
    
    case time = "Time"
    case routine = "Routine"
    case water = "Water"
    case waterUpgrade = "WaterUpgrade"
    case health = "Health"
    case healthUpgrade = "HealthUpgrade"
    case grass = "Grass"
    case grassUpgrade = "GrassUpgrade"
    
    var index: Int {
        switch self {
        case .time: return 1
        case .routine: return 2
        case .water: return 3
        case .waterUpgrade: return 4
        case .health: return 5
        case .healthUpgrade: return 6
        case .grass: return 7
        case .grassUpgrade: return 8
        }
    }
    
    var title: String {
        
        switch self {
        case .time: return "시간의 지배자"
        case .routine: return "루틴 왕"
        case .water: return "벌컵벌컵"
        case .waterUpgrade: return "물먹는 하마"
        case .health: return "운동의 시작"
        case .healthUpgrade: return "운동의 홀릭"
        case .grass: return "성실의 시작"
        case .grassUpgrade: return "성실 왕"
        }
    }
    
    var desc: String {
        
        switch self {
        case .time: return "당신의 시작을 응원해요!"
        case .routine: return "루틴까지 지배하는 당신 멋져요!"
        case .water: return "물먹는 재미를 느껴봐요!"
        case .waterUpgrade: return "물 먹는 습관 마스터"
        case .health: return "당신의 시작을 응원해요!"
        case .healthUpgrade: return "운동의 기쁨에 빠진 당신! 멋져요!"
        case .grass: return "멈추지마세요! 시작이 반이에요!"
        case .grassUpgrade: return "평생가는 운동 습관 형성 완료!"
        }
    }
    
    var subDesc: String {
        
        switch self {
        case .time: return "타이머 1회 사용"
        case .routine: return "타이머 100회 사용"
        case .water: return "물 기록 1회 사용"
        case .waterUpgrade: return "물 기록 100회 사용"
        case .health: return "운동 기록 1회 사용"
        case .healthUpgrade: return "운동 기록 100회 사용"
        case .grass: return "기록 100% 1회 달성"
        case .grassUpgrade: return "기록 100% 30회 달성"
        }
    }
    
    var icon: String {
        
        switch self {
        case .time: return "BadgeTime"
        case .routine: return "BadgeRoutine"
        case .water: return "BadgeWater"
        case .waterUpgrade: return "BadgeWaterUpgrade"
        case .health: return "BadgeHealth"
        case .healthUpgrade: return "BadgeHealthUpgrade"
        case .grass: return "BadgeGrass"
        case .grassUpgrade: return "BadgeGrassUpgrade"
        }
    }
}
