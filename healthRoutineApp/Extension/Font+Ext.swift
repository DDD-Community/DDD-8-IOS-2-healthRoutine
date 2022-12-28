//
//  Font+Ext.swift
//  healthRoutineApp
//
//  Created by 유지은(파트너) - 서비스개발담당App개발팀 on 2022/12/16.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretendard {
        case bold
        case extraBold
        case medium
        case semiBold
        case regular

        var value: String {
            switch self {
            case .bold:
                return "Pretendard-Bold"
            case .medium:
                return "Pretendard-Medium"
            case .semiBold:
                return "Pretendard-SemiBold"
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .regular:
                return "Pretendard-Regular"
            }
        }
    }

    static func pretendard(_ type: Pretendard, size: CGFloat = 13) -> Font {
        return .custom(type.value, size: size)
    }
}
