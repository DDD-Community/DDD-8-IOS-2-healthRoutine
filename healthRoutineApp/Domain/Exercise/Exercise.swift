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
        
        var subPart: [String] {
            
            switch self {
            case .chest: return ["덤벨 플라이",
                                 "딥스",
                                 "디클라인 벤치프레스",
                                 "스퀴즈 프레스",
                                 "시티드 체스트 프레스",
                                 "인클라인 해머 프레스",
                                 "인플라인 덤벨 프레스",
                                 "케이블 크로스 오버",
                                 "푸쉬 업"]
                
            case .shoulder: return ["덤벨 숄더 프레스",
                               "덤벨 레이즈",
                               "리어 델트 로우",
                               "리버스 펙덱 플라이",
                               "바벨 업라이트 로우",
                               "바벨 숄더 프레스",
                               "밀리터리 프레스",
                               "리어델트 레이즈",
                               "벤트 오버 레터럴 레이즈",
                               "사이드 레터럴 레이즈",
                               "비하인드 숄더 프레스",
                               "비하인드 넥 프레스",
                               "오버헤드 숄더프레스",
                               "아놀드 프레스",
                               "익스터널 로테이션",
                               "케이블 플라이"]
                
            case .back: return ["랫 풀 다운",
                                "로우풀리",
                                "루마니안 데드리프트",
                                "바벨 슈러그",
                                "벤트 오버 덤벨 로우",
                                "스트레이트 암 킥백",
                                "시티 드로우",
                                "펜레이 로우",
                                "케이블 하이로우"]
                
            case .abs: return ["AB 슬라이더", "로만 체어 사이드밴드", "사이드 크런치"]
                
            case .arm: return ["라잉 트라이셉스 익스텐션",
                               "덤벨 컬",
                               "로프 풀오버",
                               "바벨 컬",
                               "바이셉스 컬",
                               "벤치 딥스",
                               "스컬크러셔",
                               "얼터네이트 덤벨 컬",
                               "컨센트레이션 컬",
                               "케이블 푸쉬다운"]
                
            case .leg: return ["레그컬",
                               "레그레이즈",
                               "레그 익스텐션",
                               "백 스쿼트",
                               "브이 스쿼트",
                               "스테퍼",
                               "와이드 스쿼트",
                               "시티드 레그 컬",
                               "원 레그 프레스",
                               "워킹 런지",
                               "카프 프레스",
                               "핵 스쿼트"]
            
            case .hip: return ["힙 런지",
                               "힙 어덕션",
                               "힙 리프트",
                               "크램쉘",
                               "킥백"]
            
            case .body: return ["덤벨 쓰러스터",
                                "데드리프트",
                                "버피테스트"]
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
                case .two: return "+2kg"
                case .five: return "+5kg"
                case .ten: return "+10kg"
                case .twenty: return "+20kg"
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
                    
                case .tenMin: return "+10분"
                case .quarter: return "+15분"
                case .half: return "+30분"
                case .hour: return "+60분"
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
                    
                case .one: return "+1세트"
                case .three: return "+3세트"
                case .five: return "+5세트"
                case .six: return "+6세트"
                }
            }
        }
    }
}
