//
//  UserDefault+Ext.swift
//  healthRoutineApp
//
//  Created by 유지은 on 2022/12/25.
//

import Foundation

let TIMER_PATTERN_KEY = "timer_pattern_key"

extension UserDefaults {
    public static func isFirstAppLaunch() -> Bool {
        let firstLaunchFlag = "firstLaunchFlag"
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: firstLaunchFlag)
        if isFirstLaunch {
            UserDefaults.standard.set(true, forKey: firstLaunchFlag)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }
}
