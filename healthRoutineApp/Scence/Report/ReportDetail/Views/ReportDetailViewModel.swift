//
//  ReportDetailViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/08.
//

import Foundation
import Combine
import SwiftUI

final class ReportDetailViewModel: ObservableObject {
    
    @Published var exercise: Exercise.Part = .chest
    
    @Published var weight: String = ""
    @Published var count: String = ""
    @Published var set: String = ""
    
//    var exerciseValue = CurrentValueSubject<Exercise, Never>(value)
}
