//
//  Score.swift
//  MyCreditManager
//
//  Created by 유준상 on 2022/11/16.
//

import Foundation

enum Score: Float {
    case A_plus = 4.5
    case A = 4.0
    case B_plus = 3.5
    case B = 3.0
    case C_plus = 2.5
    case C = 2.0
    case D_plus = 1.5
    case D = 1.0
    case F = 0.0
    
    var toString: String {
        switch self {
        case .A_plus:
            return "A+"
        case .A:
            return "A"
        case .B_plus:
            return "B+"
        case .B:
            return "B"
        case .C_plus:
            return "C+"
        case .C:
            return "C"
        case .D_plus:
            return "D+"
        case .D:
            return "D"
        case .F:
            return "F"
        }
    }
}
