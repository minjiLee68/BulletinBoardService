//
//  FavoriteViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/05.
//

import UIKit

class FavoriteViewModel {
    static let shared = FavoriteViewModel()
    
    var preparation: Favorite = Favorite()
    var prepara = Favorite(page1: "취준생을 위한 꿀팁🍯", page2: "합격률 높은 포트폴리오", page3: "회사가 원하는 신입이란", page4: "코딩이 막힐 땐 이렇게 해봐")
    
    func setPrepara() -> [Favorite] {
        let preparaList: [Favorite] = [prepara]
        return preparaList
    }
    
}

extension Notification.Name {
    static let notiName = Notification.Name("observer")
}

struct Favorite {
    var page1: String = "취준생을 위한 꿀팁🍯"
    var page2: String = "합격률 높은 포트폴리오"
    var page3: String = "회사가 원하는 신입이란"
    var page4: String = "코딩이 막힐 땐 이렇게 해봐"
//    var preparation: [String] = ["취준생을 위한 꿀팁🍯", "합격률 높은 포트폴리오", "회사가 원하는 신입이란", "코딩이 막힐 땐 이렇게 해봐!"]
//    var officeworkers: [String] = ["번아웃, 나에게도 올까?", "개발자들을 위한 힐링", "후배들을 위해 재능 기부하기", "개발자들을 위한 꿀팁🍯"]
//    var students: [String] = ["진로는 어떻게 정해야 하나요?", "어떤 개발자가 되야할까", "예비 취준생들을 위한 꿀팁🍯"]
//    var hobby: [String] = ["나만의 어플 만들어보기", "눈 높이에 맞춘 강의 모아보기", "개발은 넘 볼 수 없는 벽이다?"]
}
