//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/03.
//

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result = [Int]()
    
    let todayDate = today.components(separatedBy: ".")
    let todayDateInt = Int(todayDate[0] + todayDate[1] + todayDate[2])!
    
    var termsDict: Dictionary<String, String> = [:]
    for term in terms {
        let temp = term.components(separatedBy: " ")
        termsDict[temp[0]] = temp[1]
    }
    
    var privaciesDict: Dictionary<String, [(Int, [String])]> = [:]
    var cnt = 1
    for privacy in privacies {
        let temp = privacy.components(separatedBy: " ")
        let type = temp[1]
        let date = temp[0].components(separatedBy: ".")
        if privaciesDict[type] == nil {
            privaciesDict[type] = [(cnt, date)]
        } else {
            privaciesDict[type]!.append((cnt, date))
        }
        cnt += 1
    }
    
    for key in privaciesDict.keys {
        var days = privaciesDict[key]!
        let expirDate = Int(termsDict[key]!)!
        for day in days {
            var newYear = Int(day.1[0])!
            var newMonth = Int(day.1[1])! + expirDate
            var newDay = Int(day.1[2])! - 1
            
            if newDay == 0 {
                newMonth -= 1
                newDay = 28
            }
            if newMonth % 12 == 0 {
                newYear += newMonth / 12 - 1
                newMonth = 12
            } else {
                newYear += newMonth / 12
                newMonth = newMonth % 12
            }

            if newYear * 10000 + newMonth * 100 + newDay < todayDateInt {
                result.append(day.0)
            }
        }
    }
    
    return result.sorted()
}

print(solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]))

//print(day.0, newYear * 10000 + newMonth * 100 + newDay)

//    print("todayDate: \(todayDate)")
//    print("todayDateInt: \(todayDateInt)")
//    print("termsDict: \(termsDict)")
//    print("privaciesDict: \(privaciesDict)")

//today    terms    privacies    result
//"2022.05.19"    ["A 6", "B 12", "C 3"]    ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]    [1, 3]
//"2020.01.01"    ["Z 3", "D 5"]    ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]    [1, 4, 5]
