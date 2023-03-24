//
//  Alertor.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/01/27.
//

import Foundation

typealias AlertorViewInfo = Alertor.ViewInfo
enum Alertor {
    
    typealias OkCompletion = (() -> Void)?
    typealias CancelCompletion = (() -> Void)?
    
    struct ViewInfo {
        
        let title: String
        let message: String
        
        let okTitle: String
        let cancelTitle: String
        
        let okCompletion: OkCompletion
        let cancelCompletion: CancelCompletion
    }
}
