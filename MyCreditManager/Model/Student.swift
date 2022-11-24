//
//  Student.swift
//  MyCreditManager
//
//  Created by 유준상 on 2022/11/16.
//

import Foundation

struct Student {
    let id: String = UUID().uuidString
    var name: String
    var subjectAndScore: Dictionary<String, Score> = [:]
}
