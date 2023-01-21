//
//  ReportViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/21.
//

import Foundation
import SwiftUI

class ReportViewModel: ObservableObject {
    
    // 운동리스트이며 임시로 [Int]로 선언합니다.
    @Published var exerciseArray: [Int] = []
    
    func fetchList() {
        // 통신후 exerciseArray업데이트해주는 함수
        
        //샘플 데이터입니다.
        self.exerciseArray = [0,1,2,3]
    }
    
    func getDetailViewModel() -> ReportDetailViewModel {
        let vm = ReportDetailViewModel()
        vm.delegate = self
        return vm
    }
    
}

extension ReportViewModel: UpdateProtocol {
    // 화면 갱신
    func update() {
        self.fetchList()
    }
}
