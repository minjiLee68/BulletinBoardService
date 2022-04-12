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
    var preparetionImage: [String] = ["icon-job-page1", "icon-job-page2", "icon-job-page3", "icon-job-page4"]
    var preparationCount: Int {
        return preparationList.count
    }
    
    var officworkersList: [String] = ["번아웃, 나에게도 올까?", "개발자들을 위한 힐링", "후배들을 위해 재능 기부하기", "개발자들을 위한 꿀팁🍯"]
    var officworkersImage: [String] = ["icon-job-page1", "icon-job-page2", "icon-job-page3", "icon-job-page4"]
    var officworkersCount: Int {
        return officworkersList.count
    }
    
    var studentsList: [String] = ["진로는 어떻게 정해야 하나요?", "어떤 개발자가 되야할까", "예비 취준생들을 위한 꿀팁🍯"]
    var studentImage: [String] = ["icon-job-page1", "icon-job-page2", "icon-job-page3"]
    var studentsCount: Int {
        return studentsList.count
    }
    
    var hobbyList: [String] = ["나만의 어플 만들어보기", "눈 높이에 맞춘 강의 모아보기", "개발은 넘 볼 수 없는 벽이다?"]
    var hobbyImage: [String] = ["icon-job-page1", "icon-job-page2", "icon-job-page3"]
    var hobbyCount: Int {
        return hobbyList.count
    }
}

class TermSelectedViewModel {
    static let shared = TermSelectedViewModel()
    
    var shortTitleList: [String] = ["짧고 굵게 실력늘리기!", "무조건 알아야 하는 기본지식", "이론은 나중에 결과 먼저 남기기"]
    var shortImage: [String] = ["icon-term-page1", "icon-term-page2", "icon-term-page3"]
    var shortCount: Int {
        return shortTitleList.count
    }
    
    var longTitleList: [String] = ["깊은 학습이 필요해요", "시간은 여유롭지만 마음은 다급해요", "전문적인 학습"]
    var longImage: [String] = ["icon-term-page1", "icon-term-page2", "icon-term-page3"]
    var longCount: Int {
        return longTitleList.count
    }
    
    var nottingTitleList: [String] = ["스트레스는 다운 재미는 업!", "그냥저냥 해보지 뭐", "언어는 뭐부터 해야할까?"]
    var nottingImage: [String] = ["icon-term-page1", "icon-term-page2", "icon-term-page3"]
    var nottingCount: Int {
        return nottingTitleList.count
    }
    
    var shortTitle: String {
        return "우리는 8282민족 아이가!🏃‍♀️"
    }
    
    var longTitle: String {
        return "오래보아야 이쁘다 너도 그렇다🙈"
    }
    
    var nottingTitle: String {
        return "상관없어! 진행쉬켜🤟"
    }
}

extension Notification.Name {
    static let notiName = Notification.Name("observer")
    static let datapass = Notification.Name("datapass")
}
