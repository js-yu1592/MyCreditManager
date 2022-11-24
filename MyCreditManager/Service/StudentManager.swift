//
//  StudentManager.swift
//  MyCreditManager
//
//  Created by 유준상 on 2022/11/16.
//

import Foundation

struct StudentManager: StudentManagerType {
    var studentList: [Student] = []
    
    mutating func addStudent(name: String) {
        guard findStudentIndex(name: name) == nil else {
            print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            return
        }
        let newStudent: Student = Student(name: name)
        studentList.append(newStudent)
        print("\(name) 학생을 추가했습니다.")
    }
    
    mutating func findStudentIndex(name: String) -> Int? {
        if let index = studentList.firstIndex(where: { student in
            student.name == name
        }) {
            return index
        } else {
            return nil
        }
    }
    
    mutating func deleteStudent(name: String) {
        guard let index = findStudentIndex(name: name) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        studentList.remove(at: index)
        print("\(name) 학생을 삭제하였습니다.")
    }
    
    mutating func updateScore(name: String, subject: String, score: Score) {
        guard let index = findStudentIndex(name: name) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        studentList[index].subjectAndScore[subject] = score
        print("\(name) 학생의 \(subject) 과목이 \(score.toString)로 추가(변경)되었습니다.")
    }
    
    mutating func deleteScore(name: String, subject: String) {
        guard let index = findStudentIndex(name: name) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        studentList[index].subjectAndScore.removeValue(forKey: subject)
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
    }
    
    mutating func printScore(name: String) {
        guard let index = findStudentIndex(name: name) else {
            print("\(name) 학생을 찾지 못했습니다.")
            return
        }
        var averageScore: Float = 0.0
        studentList[index].subjectAndScore.forEach {
            print("\($0): \($1.toString)")
            averageScore += $1.rawValue
        }
        
        if averageScore != 0.0 {
            averageScore /= Float(studentList[index].subjectAndScore.count)
        }
        print("평점: \(averageScore)")
    }
}
