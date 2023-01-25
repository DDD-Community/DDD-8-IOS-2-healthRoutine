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

extension String {
    
    func load() -> UIImage {
        
        do {
            
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
            
        } catch {
            
        }
        
        return UIImage()
    }
}


extension Int {
    public var isPositive: Bool { return (self > 0) }
}

