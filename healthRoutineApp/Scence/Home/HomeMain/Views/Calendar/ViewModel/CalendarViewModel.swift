//
//  CalendarViewModel.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2023/01/15.
//

import Foundation
import Combine

final class CalendarViewModel: ObservableObject {
    
    func getNickName() -> String {
        let nickname = UserDefaults.standard.string(forKey: NICKNAME_KEY)
        if let nickname = nickname {
            return "\(nickname)님 "
        }
        else {
            return ""
        }
    }
    
    
}
