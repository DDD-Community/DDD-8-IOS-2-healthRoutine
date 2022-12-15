//
//  RegExp.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/15.
//

import Foundation

protocol RegExpRulesType {
    
    var email: String { get }
    var password: String { get }
    var nickname: String { get }
}

struct RegExpRules: RegExpRulesType {
    
    let email: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let password: String = ""
    let nickname: String = ""
}


enum RegExp {
    
    private static let _rules: RegExpRulesType = RegExpRules()
    
    private static func isMatch(text: String, to exp: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", exp).evaluate(with: text)
    }
    
    static func isMatchToEmail(_ targetStr: String) -> Bool {
        return isMatch(text: targetStr, to: _rules.email)
    }
    
    static func isMatchToPassword(_ targetStr: String) -> Bool {
        return isMatch(text: targetStr, to: _rules.password)
    }
    
    static func isMatchToNickname(_ targetStr: String) -> Bool {
        return isMatch(text: targetStr, to: _rules.nickname)
    }
}
