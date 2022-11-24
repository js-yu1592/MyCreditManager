//
//  main.swift
//  MyCreditManager
//
//  Created by 유준상 on 2022/11/16.
//

import Foundation

start()

private func start() {
    var studentManager = StudentManager()
    
    while(true) {
        print("원하는 기능을 입력해주세요.")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
        if let input = readLine() {
            switch input {
            case "1":
                print("추가할 학생의 이름을 입력해주세요.")
                if let name = readLine() {
                    if name.isEmpty {
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    } else {
                        studentManager.addStudent(name: name)
                    }
                }
                
            case "2":
                print("삭제할 학생의 이름을 입력해주세요.")
                if let name = readLine() {
                    if name.isEmpty {
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    } else {
                        studentManager.deleteStudent(name: name)
                    }
                }
                
            case "3":
                print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
                print("입력예) Mickey Swift A+")
                print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
                if let input = readLine() {
                    let studentInfo = input.components(separatedBy: " ")
                    
                    if let name = studentInfo[safe: 0],
                       let subject = studentInfo[safe: 1],
                       let score = studentInfo[safe: 2],
                       let changedScore = changeScoreType(score: score) {
                        studentManager.updateScore(name: name, subject: subject, score: changedScore)
                    } else {
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    }
                }
                
            case "4":
                print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
                print("입력예) Mickey Swift")
                if let input = readLine() {
                    let studentInfo = input.components(separatedBy: " ")
                    
                    if let name = studentInfo[safe: 0],
                       let subject = studentInfo[safe: 1] {
                        studentManager.deleteScore(name: name, subject: subject)
                    } else {
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    }
                }
                
            case "5":
                print("평점을 알고싶은 학생의 이름을 입력해주세요.")
                if let name = readLine() {
                    if name.isEmpty {
                        print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    } else {
                        studentManager.printScore(name: name)
                    }
                }
                
            case "X":
                print("프로그램을 종료합니다...")
                return
                
            default:
                print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            }
        }
    }
}

private func changeScoreType(score: String) -> Score? {
    switch score {
    case "A+": return .A_plus
    case "A": return .A
    case "B+": return .B_plus
    case "B": return .B
    case "C+": return .C_plus
    case "C": return .C
    case "D+": return .D_plus
    case "D": return .D
    case "F": return .F
    default:
        return nil
    }
}
