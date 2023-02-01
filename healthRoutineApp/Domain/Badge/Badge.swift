//
//  Badge.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/12.
//

import Foundation

enum Badge: String, CaseIterable {
    
    case exerciseStart = "ExerciseStart"
    case exerciseHappy = "ExerciseHappy"
    case exerciseHolic = "ExerciseHolic"
    case exerciseMaster = "ExerciseMaster"
    case exerciseChampion = "ExerciseChampion"
    case sincerityJunior = "SincerityJunior"
    case sincerityPro = "SincerityPro"
    case sincerityMaster = "SincerityMaster"
    case sincerityChampion = "SincerityChampion"
    case drinkHoneyHoney = "DrinkHoneyHoney"
    case drinkBulkUpBulkUp = "DrinkBulkUpBulkUp"
    case drinkHippo = "DrinkHippo"
    
    var index: Int {

        switch self {
        case .exerciseStart: return 1
        case .exerciseHappy: return 2
        case .exerciseHolic: return 3
        case .exerciseMaster: return 4
        case .exerciseChampion: return 5
        case .sincerityJunior: return 6
        case .sincerityPro: return 7
        case .sincerityMaster: return 8
        case .sincerityChampion: return 9
        case .drinkHoneyHoney: return 10
        case .drinkBulkUpBulkUp: return 11
        case .drinkHippo: return 12
        }
    }
    
    var title: String {
        
        switch self {
        case .exerciseStart: return "운동의 시작"
        case .exerciseHappy: return "운동의 기쁨"
        case .exerciseHolic: return "운동 홀릭"
        case .exerciseMaster: return "운동 마스터"
        case .exerciseChampion: return "운동 챔피언"
        case .sincerityJunior: return "성실 주니어"
        case .sincerityPro: return "성실 프로"
        case .sincerityMaster: return "성실 마스터"
        case .sincerityChampion: return "성실 챔피언"
        case .drinkHoneyHoney: return "꿀컵꿀컵"
        case .drinkBulkUpBulkUp: return "벌컵벌컵"
        case .drinkHippo: return "물 먹는 하마"
        }
    }
    
    var desc: String {
        
        switch self {
        case .exerciseStart: return "당신의 시작을 응원해요!"
        case .exerciseHappy: return "운동의 기쁨에 빠졌군요 파이팅!"
        case .exerciseHolic: return "운동 홀릭 당신 멋져요!"
        case .exerciseMaster: return "평생 가는 운동 습관 형성 완료!"
        case .exerciseChampion: return "챔피언 달성!"
        case .sincerityJunior: return "멈추지 마세요! 시작이 반이에요!"
        case .sincerityPro: return "누구보다 꾸준한 당신 멋져요!"
        case .sincerityMaster: return "꾸준한 의인화는 당신 아닐까요?"
        case .sincerityChampion: return "성실의 끝판왕! 감히 이길 자가 없네요!"
        case .drinkHoneyHoney: return "물먹는 재미를 느껴봐요!"
        case .drinkBulkUpBulkUp: return "물 먹는 습관 마스터!"
        case .drinkHippo: return "수분 충전 완료! 내 안에 물 있다."
        }
    }
    
    var subDesc: String {
        
        switch self {
        case .exerciseStart: return "운동 기록 1회 사용"
        case .exerciseHappy: return "운동 기록 20회 사용"
        case .exerciseHolic: return "운동 기록 30회 사용"
        case .exerciseMaster: return "운동 기록 50회 사용"
        case .exerciseChampion: return "운동 기록 100회 사용"
        case .sincerityJunior: return "기록 100% 1회 달성"
        case .sincerityPro: return "기록 100% 30회 달성"
        case .sincerityMaster: return "기록 100% 50회 달성"
        case .sincerityChampion: return "기록 100% 100회 달성"
        case .drinkHoneyHoney: return "물 기록 1회 사용"
        case .drinkBulkUpBulkUp: return "물 기록 50회 사용"
        case .drinkHippo: return "물 기록 100회 사용"
        }
    }
    
    var icon: String {
        
        switch self {
        case .exerciseStart: return "1운동의시작"
        case .exerciseHappy: return "2운동의기쁨"
        case .exerciseHolic: return "3운동홀릭"
        case .exerciseMaster: return "4운동마스터"
        case .exerciseChampion: return "5운동챔피언"
        case .sincerityJunior: return "6성실주니어"
        case .sincerityPro: return "7성실프로"
        case .sincerityMaster: return "8성실마스터"
        case .sincerityChampion: return "9성실챔피언"
        case .drinkHoneyHoney: return "10꿀컵꿀컵"
        case .drinkBulkUpBulkUp: return "11벌컵벌컵"
        case .drinkHippo: return "12물먹는하마"
        }
    }
}
