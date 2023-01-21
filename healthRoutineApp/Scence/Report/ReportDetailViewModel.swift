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

class ReportDetailViewModel: ObservableObject {
    weak var delegate: UpdateProtocol?
    
    @Published var exercise: Exercise.Part = .chest
    
    @Published var weight: String = ""
    @Published var count: String = ""
    @Published var set: String = ""
    
}
