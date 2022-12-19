//
//  healthRoutineRepository.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/14.
//

import Foundation
import Combine
import SwiftUI

typealias HealthRoutineRepository = HealthRoutine.Repository

enum HealthRoutine {
    
    final class Repository {
        
        @AppStorage("token") var token: String = ""
    }
}

