//
//  Const.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/27.
//

import Foundation

// MARK: - typealias
public typealias VoidClosure = () -> Void
public typealias BoolClosure = (_ value: Bool) -> Void
public typealias StringClosure = (_ value: String) -> Void

enum NotificationName: String {
    case timer
}
