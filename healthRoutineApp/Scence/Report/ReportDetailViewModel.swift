//
//  ReportDetailViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/21.
//

import Foundation
import SwiftUI

protocol UpdateProtocol: AnyObject {
    func update()
}

// 상상으로 데이터 모델 구현. 이후 서버 데이터에 맞춰서 변경할 예정.

// 운동부위
class PartInfo: Codable {
    var partName: String = ""
    var partId: String = ""
    var exerciseArr: [ExerciseInfo] = []
    
    init(_ name: String, _ id: String, _ arr: [ExerciseInfo]) {
        self.partName = name
        self.partId = id
        self.exerciseArr = arr
    }
}

// 부위별 운동
class ExerciseInfo: Codable {
    var exerciseName: String = ""
    var exerciseId: String = ""
    
    init(_ name: String, _ id: String) {
        self.exerciseName = name
        self.exerciseId = id
    }
}

// 임시 샘플데이터
let exercsieInfoSampleList = [ExerciseInfo("스쿼트", "1"), ExerciseInfo("스쿼트", "1"), ExerciseInfo("스쿼트", "1"), ExerciseInfo("스쿼트", "1"), ExerciseInfo("스쿼트", "1"), ExerciseInfo("스쿼트", "1")]

let partInfoSampleList = [PartInfo("어깨", "1", exercsieInfoSampleList), PartInfo("어깨", "1", exercsieInfoSampleList), PartInfo("어깨", "1", exercsieInfoSampleList), PartInfo("어깨", "1", exercsieInfoSampleList)]

class ReportDetailViewModel: ObservableObject {
    weak var delegate: UpdateProtocol?
    
    @Published var partArray: [PartInfo] = []
    
    
    // 아래는 임시
    @Published var exercise: Exercise.Part = .chest
    
    @Published var weight: String = ""
    @Published var count: String = ""
    @Published var set: String = ""
    
    func fetchExerciseInfo() {
        // fetch통신 로직
        self.partArray = partInfoSampleList
    }
    
}
