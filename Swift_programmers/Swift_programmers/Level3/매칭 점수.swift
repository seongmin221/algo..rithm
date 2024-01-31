//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/30/24.
//

import Foundation

func solution(_ word:String, _ pages:[String]) -> Int {
    
    func extractURL(_ page: String) -> (content: String, upper: String.Index) {
        let lower = page.range(of: "<meta property=\"og:url\" content=\"")!.upperBound
        let upper = page[lower...].range(of: "\"/>")!.lowerBound
        return (String(page[lower..<upper]), upper)
    }
    
    func extractBody(_ page: String) -> String{
        let lower = page.range(of: "<body>")!.upperBound
        let upper = page[lower...].range(of: "</body>")!.lowerBound
        var temp = String(page[lower..<upper])
        while true {
            guard let aTagLower = temp.range(of: "<a")?.lowerBound,
                  let aTagUpper = temp[aTagLower...].range(of: "\">")?.upperBound
            else { break }
            temp.removeSubrange(aTagLower..<aTagUpper)
            
            let aTagCloser = temp.range(of: "</a>")!
            temp.removeSubrange(aTagCloser)
        }
        return temp.lowercased()
    }
    
    func extractLink(_ page: String) -> [String] {
        var result: [String] = []
        var start = page.startIndex
        while true {
            guard let lower = page[start...].range(of: "<a href=\"")?.upperBound,
                  let upper = page[lower...].range(of: "\">")?.lowerBound
            else { break }
            start = upper
            result.append(String(page[lower..<upper]))
        }
        return result
    }
    
    func calculatePoints(byFinding text: String, from body: String) -> Int {
        var points = 0
        var string = body
        while true {
            guard let range = string.range(of: text) else { break }
            var offset = range.lowerBound == string.startIndex ? 0 : -1
            let indexBefore = string.index(range.lowerBound, offsetBy: offset)
            if !(string[range.upperBound].isLetter || string[indexBefore].isLetter) {
                points += 1
            }
            string = String(string[range.upperBound...])
        }
        return points
    }
    
    var webMap: [String: (i: Int, myPoint: Int, links: [String])] = [:]
    
    for (index, page) in pages.enumerated() {
        let (url, bodyStart) = extractURL(page)
        let body = extractBody(String(page[bodyStart...]))
        let links = extractLink(String(page[bodyStart...]))
        webMap[url] = (index, calculatePoints(byFinding: word.lowercased(), from: body), links)
    }
    
    var points: [String: CGFloat] = [:]
    for url in webMap.keys { points[url] = 0 }
    for web in webMap {
        let url = web.key
        points[url]! += CGFloat(web.value.myPoint)
        
        for link in webMap[url]!.links {
            points[link]? += CGFloat(web.value.myPoint) / CGFloat(web.value.links.count)
        }
    }
    
    let highest = points.sorted(by: {
        if $0.value > $1.value { return true }
        else if $0.value == $1.value { return webMap[$0.key]!.i < webMap[$1.key]!.i }
        else { return false }
    }).first!.key
    
    
    return webMap[highest]!.i
}


//print(solution("blind", [
//    "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://a.com\"/>\n</head>  \n<body>\nBlind Lorem Blind ipsum dolor Blind test sit amet, consectetur adipiscing elit. \n<a href=\"https://b.com\"> Link to b </a>\n</body>\n</html>",
//    "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://b.com\"/>\n</head>  \n<body>\nSuspendisse potenti. Vivamus venenatis tellus non turpis bibendum, \n<a href=\"https://a.com\"> Link to a </a>\nblind sed congue urna varius. Suspendisse feugiat nisl ligula, quis malesuada felis hendrerit ut.\n<a href=\"https://c.com\"> Link to c </a>\n</body>\n</html>",
//    "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://c.com\"/>\n</head>  \n<body>\nUt condimentum urna at felis sodales rutrum. Sed dapibus cursus diam, non interdum nulla tempor nec. Phasellus rutrum enim at orci consectetu blind\n<a href=\"https://a.com\"> Link to a </a>\n</body>\n</html>"
//]))

//print(solution("Muzi", ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://careers.kakao.com/interview/list\"/>\n</head>  \n<body>\n<a href=\"https://programmers.co.kr/learn/courses/4673\"></a>#!MuziMuzi!)jayg07con&&\n\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://www.kakaocorp.com\"/>\n</head>  \n<body>\ncon%\tmuzI92apeach&2<a href=\"https://hashcode.co.kr/tos\"></a>\n\n\t^\n</body>\n</html>"]))
