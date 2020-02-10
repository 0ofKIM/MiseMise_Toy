//
//  MiseDataModel.swift
//  MiseMise_Toy
//
//  Created by base soft on 05/02/2020.
//  Copyright © 2020 studygroup. All rights reserved.
//

import Foundation

class MiseDataModel {
    //static let shared = MiseDataModel()
    
    var strResultCode = "" // 결과코드
    var strResultMessage = "" // 결과메시지
    var strNumOfRows = "" // 한 페이지 결과 수
    var strPageNo = "" // 페이지 번호
    var strTotalCount = "" // 전체 결과 수
    var strItem = "" // 목록
    var strDataTime = "" // 측정일시
    var strCityName = "" // 시군구
    var so2Value = "" // 아황산가스 평균농도
    var coValue = "" // 일산화탄소 평균농도
    var o3Value = "" // 오존 평균농도
    var no2Value = "" // 이산화질소 평균농도
    var pm10Value = "" // 미세먼지 평균농도 (pm10)
    var pm25Value = "" // 미세먼지 평균농도 (pm2.5)
    
    init(strResultCode: String, strResultMessage: String, strNumOfRows: String, strPageNo: String, strTotalCount: String, strItem: String, strDataTime: String, strCityName: String, so2Value: String, coValue: String, o3Value: String, no2Value: String, pm10Value: String, pm25Value: String) {
        self.strResultCode = strResultCode
        self.strResultMessage = strResultMessage
        self.strNumOfRows = strNumOfRows
        self.strPageNo = strPageNo
        self.strTotalCount = strTotalCount
        self.strItem = strItem
        self.strDataTime = strDataTime
        self.strCityName = strCityName
        self.so2Value = so2Value
        self.coValue = coValue
        self.o3Value = o3Value
        self.no2Value = no2Value
        self.pm10Value = pm10Value
        self.pm25Value = pm25Value
    }
  
//    var strResultCode_: String {
//        get {
//            return strResultCode
//        } set {
//            strResultCode = newValue
//        }
//    }
//
//    var strResultMessage_: String {
//        get {
//            return strResultMessage
//        } set {
//            strResultMessage = newValue
//        }
//    }
//
//    var strNumOfRows_: String {
//        get {
//            return strNumOfRows
//        } set {
//            strNumOfRows = newValue
//        }
//    }
//
//    var strPageNo_: String {
//        get {
//            return strPageNo
//        } set {
//            strPageNo = newValue
//        }
//    }
    
}
