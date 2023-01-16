//
//  ViewRouter.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2023/01/16.
//

import Foundation
import SwiftUI
import UIKit

enum AppView {
    case home
    case account
}

class ViewRouter: ObservableObject {
    @Published var changeFlag: Bool = false
    @Published var currentView: AppView

    init() {
        if KeychainService.shared.isTokenValidate() {
            currentView = .home
        }
        else {
            currentView = .account
        }
    }
}
