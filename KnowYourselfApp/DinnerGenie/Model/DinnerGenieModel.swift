//
//  DinnerGenieModel.swift
//  KnowYourselfApp
//
//  Created by 김소희 on 6/11/24.
//

import Foundation

struct DinnerGenieModel {
    var isDrinking: Bool
    var wantsSpicy: Bool
    var wantsSoup: Bool
    
    var recommendedMenu: String {
        let drinkOptions = ["치킨", "짬뽕", "마라탕", "피자", "회,초밥", "족발,보쌈", "김치찌개", "삼겹살", "떡볶이", "팔보채", "곱창,막창", "파전", "양꼬치", "닭발", "해물탕", "감자탕", "홍합탕", "나가사끼짬뽕", "제육볶음", "아구찜", "불닭볶음면", "라면", "쭈꾸미볶음", "부대찌개", "국밥", "설렁탕", "알탕", "순대볶음", "매운족발"]
        let nonDrinkOptions = ["치킨", "짜장면", "짬뽕", "햄버거", "마라탕", "피자", "회,초밥", "족발,보쌈",  "김치찌개", "된장찌개", "불고기", "비빔밥", "삼겹살", "갈비찜", "떡볶이", "팔보채", "곱창,막창", "파스타", "양꼬치", "닭발", "해물탕", "감자탕", "홍합탕", "나가사끼짬뽕", "제육볶음", "아구찜", "순두부찌개", "김밥", "김치볶음밥", "냉면", "불닭볶음면", "라면", "돈가스", "쭈꾸미볶음", "부대찌개", "국밥", "설렁탕", "알탕", "순대볶음", "매운족발", "쌀국수"]
        var options: [String]
        
        if isDrinking {
            if wantsSpicy && wantsSoup {
                options = ["마라탕", "김치찌개", "해물탕", "부대찌개", "알탕", "감자탕", "라면", "짬뽕"]
            } else if wantsSpicy && !wantsSoup {
                options = ["닭발", "떡볶이", "제육볶음", "아구찜", "불닭볶음면", "쭈꾸미볶음", "순대볶음", "매운족발"]
            } else if !wantsSpicy && wantsSoup {
                options = ["홍합탕", "나가사끼짬뽕", "국밥", "설렁탕"]
            } else {
                options = ["치킨", "피자", "회,초밥", "족발,보쌈", "삼겹살", "팔보채", "곱창,막창", "파전", "양꼬치"]
            }
        } else {
            if wantsSpicy && wantsSoup {
                options = ["마라탕", "김치찌개", "해물탕", "부대찌개", "알탕", "감자탕", "라면", "짬뽕"]
            } else if wantsSpicy && !wantsSoup {
                options = ["닭발", "떡볶이", "제육볶음", "아구찜", "불닭볶음면", "쭈꾸미볶음", "양꼬치", "순대볶음", "김치볶음밥", "매운족발"]
            } else if !wantsSpicy && wantsSoup {
                options = ["홍합탕", "나가사끼짬뽕", "국밥", "설렁탕", "된장찌개", "냉면", "쌀국수"]
            } else {
                options = ["치킨", "피자", "회,초밥", "족발,보쌈", "삼겹살", "팔보채", "곱창,막창",  "짜장면", "햄버거", "불고기", "비빔밥", "갈비찜", "파스타", "김밥", "돈가스"]
            }
        }
            
            return options.randomElement() ?? "추천할 메뉴가 없습니다."
        }
    }
