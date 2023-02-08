//
//  BadgeDetailViewModel.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2023/02/08.
//

import Foundation
import Combine
import UIKit

struct BadgeDetailViewInfo {
    
    var icon: UIImage?
    var title: String?
    var desc: String?
    var subDesc: String?
    
    init(badge: Badge) {
        
//        let icon = badge.icon(with: <#T##Bool#>)
        let title = badge.title
        let desc = badge.desc
        let subDesc = badge.subDesc
    }
}

final class BadgeDetailViewModel: ObservableObject {
    
}
