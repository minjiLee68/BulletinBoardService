//
//  FavoriteViewModel.swift
//  CalorieControl
//
//  Created by 이민지 on 2022/04/05.
//

import UIKit

class FavoriteViewModel {
    static let shared = FavoriteViewModel()
    
    var preparationList: [String] = ["취준생을 위한 꿀팁🍯", "합격률 높은 포트폴리오", "회사가 원하는 신입이란", "코딩이 막힐 땐 이렇게 해봐"]
    var preparationCount: Int {
        return preparationList.count
    }
    
    var officworkersList: [String] = ["번아웃, 나에게도 올까?", "개발자들을 위한 힐링", "후배들을 위해 재능 기부하기", "개발자들을 위한 꿀팁🍯"]
    var officworkersCount: Int {
        return officworkersList.count
    }
    
    var studentsList: [String] = ["진로는 어떻게 정해야 하나요?", "어떤 개발자가 되야할까", "예비 취준생들을 위한 꿀팁🍯"]
    var studentsCount: Int {
        return studentsList.count
    }
    
    var hobbyList: [String] = ["나만의 어플 만들어보기", "눈 높이에 맞춘 강의 모아보기", "개발은 넘 볼 수 없는 벽이다?"]
    var hobbyCount: Int {
        return hobbyList.count
    }
}

extension Notification.Name {
    static let notiName = Notification.Name("observer")
    static let jobNoti = Notification.Name("jobNoti")

}
