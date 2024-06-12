struct DinnerGenieModel {
    var isDrinking: Bool
    var wantsSpicy: Bool
    var wantsSoup: Bool
    var recommendedMenu: [String] {
        let drinkOptions: [[String]] = [
            ["Chicken", "치킨"],
            ["Jjamppong", "짬뽕"],
            ["Malatang", "마라탕"],
            ["Pizza", "피자"],
            ["Sushi", "회,초밥"],
            ["Porktrotter", "족발,보쌈"],
            ["Kimchistew", "김치찌개"],
            ["GrilledPork", "삼겹살"],
            ["Tteokbokki", "떡볶이"],
            ["Palbochae", "팔보채"],
            ["Intestine", "곱창,막창"],
            ["Pancake", "파전"],
            ["Lambskewer", "양꼬치"],
            ["Chickenfeet", "닭발"],
            ["Seafoodstew", "해물탕"],
            ["Potatostew", "감자탕"],
            ["Musselsoup", "홍합탕"],
            ["NagasakiJjamppong", "나가사끼짬뽕"],
            ["StirfriedPork", "제육볶음"],
            ["GrilledCutlassfish", "아구찜"],
            ["SpicyFireChickenNoodles", "불닭볶음면"],
            ["InstantNoodles", "라면"],
            ["StirfriedSquid", "쭈꾸미볶음"],
            ["ArmyStew", "부대찌개"],
            ["RiceSoup", "국밥"],
            ["OxBoneSoup", "설렁탕"],
            ["FishRoeSoup", "알탕"],
            ["BloodSausage", "순대볶음"],
            ["SpicyPorktrotter", "매운족발"]
        ]
        
        let nonDrinkOptions: [[String]] = [
            ["Chicken", "치킨"],
            ["BlackBeanNoodles", "짜장면"],
            ["Jjamppong", "짬뽕"],
            ["Hamburger", "햄버거"],
            ["Malatang", "마라탕"],
            ["Pizza", "피자"],
            ["Sushi", "회,초밥"],
            ["Porktrotter", "족발,보쌈"],
            ["Kimchistew", "김치찌개"],
            ["SoybeanPasteStew", "된장찌개"],
            ["Bulgogi", "불고기"],
            ["Bibimbap", "비빔밥"],
            ["GrilledPork", "삼겹살"],
            ["Braised", "갈비찜"],
            ["Tteokbokki", "떡볶이"],
            ["Palbochae", "팔보채"],
            ["Intestine", "곱창,막창"],
            ["Pasta", "파스타"],
            ["Lambskewer", "양꼬치"],
            ["Chickenfeet", "닭발"],
            ["Seafoodstew", "해물탕"],
            ["Potatostew", "감자탕"],
            ["Musselsoup", "홍합탕"],
            ["NagasakiJjamppong", "나가사끼짬뽕"],
            ["StirfriedPork", "제육볶음"],
            ["GrilledCutlassfish", "아구찜"],
            ["SoftTofuStew", "순두부찌개"],
            ["Kimbap", "김밥"],
            ["KimchiFriedRice", "김치볶음밥"],
            ["ColdNoodles", "냉면"],
            ["SpicyFireChickenNoodles", "불닭볶음면"],
            ["InstantNoodles", "라면"],
            ["PorkCutlet", "돈가스"],
            ["StirfriedSquid", "쭈꾸미볶음"],
            ["ArmyStew", "부대찌개"],
            ["RiceSoup", "국밥"],
            ["OxBoneSoup", "설렁탕"],
            ["FishRoeSoup", "알탕"],
            ["BloodSausage", "순대볶음"],
            ["SpicyPorktrotter", "매운족발"],
            ["RiceNoodles", "쌀국수"]
        ]
        
        var options: [[String]]
        
        if isDrinking {
            if wantsSpicy && wantsSoup {
                options = [
                    ["Malatang", "마라탕"],
                    ["Kimchistew", "김치찌개"],
                    ["Seafoodstew", "해물탕"],
                    ["ArmyStew", "부대찌개"],
                    ["FishRoeSoup", "알탕"],
                    ["Potatostew", "감자탕"],
                    ["InstantNoodles", "라면"],
                    ["Jjamppong", "짬뽕"]
                ]
            } else if wantsSpicy && !wantsSoup {
                options = [
                    ["Chickenfeet", "닭발"],
                    ["Tteokbokki", "떡볶이"],
                    ["StirfriedPork", "제육볶음"],
                    ["GrilledCutlassfish", "아구찜"],
                    ["SpicyFireChickenNoodles", "불닭볶음면"],
                    ["StirfriedSquid", "쭈꾸미볶음"],
                    ["BloodSausage", "순대볶음"],
                    ["SpicyPorktrotter", "매운족발"]
                ]
            } else if !wantsSpicy && wantsSoup {
                options = [
                    ["Musselsoup", "홍합탕"],
                    ["NagasakiJjamppong", "나가사끼짬뽕"],
                    ["RiceSoup", "국밥"],
                    ["OxBoneSoup", "설렁탕"]
                ]
            } else {
                options = [
                    ["Chicken", "치킨"],
                    ["Pizza", "피자"],
                    ["Sushi", "회,초밥"],
                    ["Porktrotter", "족발,보쌈"],
                    ["GrilledPork", "삼겹살"],
                    ["Palbochae", "팔보채"],
                    ["Intestine", "곱창,막창"],
                    ["Pancake", "파전"],
                    ["Lambskewer", "양꼬치"]
                ]
            }
        } else {
            if wantsSpicy && wantsSoup {
                options = [
                    ["Malatang", "마라탕"],
                    ["Kimchistew", "김치찌개"],
                    ["Seafoodstew", "해물탕"],
                    ["ArmyStew", "부대찌개"],
                    ["FishRoeSoup", "알탕"],
                    ["Potatostew", "감자탕"],
                    ["InstantNoodles", "라면"],
                    ["Jjamppong", "짬뽕"]
                ]
            } else if wantsSpicy && !wantsSoup {
                options = [
                    ["Chickenfeet", "닭발"],
                    ["Tteokbokki", "떡볶이"],
                    ["StirfriedPork", "제육볶음"],
                    ["GrilledCutlassfish", "아구찜"],
                    ["SpicyFireChickenNoodles", "불닭볶음면"],
                    ["Lambskewer", "양꼬치"],
                    ["BloodSausage", "순대볶음"],
                    ["KimchiFriedRice", "김치볶음밥"],
                    ["SpicyPorktrotter", "매운족발"]
                ]
            } else if !wantsSpicy && wantsSoup {
                options = [
                    ["Musselsoup", "홍합탕"],
                    ["NagasakiJjamppong", "나가사끼짬뽕"],
                    ["RiceSoup", "국밥"],
                    ["OxBoneSoup", "설렁탕"],
                    ["SoybeanPasteStew", "된장찌개"],
                    ["ColdNoodles", "냉면"],
                    ["RiceNoodles", "쌀국수"]
                ]
            } else {
                options = [
                    ["Chicken", "치킨"],
                    ["Pizza", "피자"],
                    ["Sushi", "회,초밥"],
                    ["Porktrotter", "족발,보쌈"],
                    ["GrilledPork", "삼겹살"],
                    ["Palbochae", "팔보채"],
                    ["Intestine", "곱창,막창"],
                    ["BlackBeanNoodles", "짜장면"],
                    ["Hamburger", "햄버거"],
                    ["Bulgogi", "불고기"],
                    ["Bibimbap", "비빔밥"],
                    ["Braised", "갈비찜"],
                    ["Pasta", "파스타"],
                    ["Kimbap", "김밥"],
                    ["PorkCutlet", "돈가스"]
                ]
            }
        }
        let randomOption = options.randomElement()
        return randomOption ?? ["", "추천할 메뉴가 없습니다."]
    }
}
