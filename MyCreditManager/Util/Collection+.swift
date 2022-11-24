//
//  Collection+.swift
//  MyCreditManager
//
//  Created by 유준상 on 2022/11/16.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
