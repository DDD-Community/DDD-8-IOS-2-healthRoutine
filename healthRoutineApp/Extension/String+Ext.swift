//
//  String+Ext.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/15.
//

import Foundation
import UIKit

extension String {
    
    var isValidEmail: Bool {
        return RegExp.isMatchToEmail(self)
    }
    
    var isValidPassword: Bool {
        return RegExp.isMatchToPassword(self)
    }
    
    var isValidNickname: Bool {
        return RegExp.isMatchToNickname(self)
    }

    public var isValid: Bool {
        if self.isEmpty || self.count == 0 || self.trim().count == 0 || self == "(null)" || self == "null" || self == "nil" {
            return false
        }
        return true
    }

    public func trim() -> String {
        let str: String = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return str
    }

    public func toInt() -> Int {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        }
        else {
            return 0
        }
    }
}

extension Int {
    public var isPositive: Bool { return (self > 0) }
}

