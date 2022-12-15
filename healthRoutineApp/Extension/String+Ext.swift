//
//  String+Ext.swift
//  healthRoutineApp
//
//  Created by geonhui Yu on 2022/12/15.
//

import Foundation

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
}
