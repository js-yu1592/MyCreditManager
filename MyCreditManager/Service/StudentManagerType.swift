//
//  StudentManagerType.swift
//  MyCreditManager
//
//  Created by 유준상 on 2022/11/16.
//

import Foundation

protocol StudentManagerType {
    mutating func addStudent(name: String)
    mutating func findStudentIndex(name: String) -> Int?
    mutating func deleteStudent(name: String)
    mutating func updateScore(name: String, subject: String, score: Score)
    mutating func deleteScore(name: String, subject: String)
    mutating func printScore(name: String)
}
