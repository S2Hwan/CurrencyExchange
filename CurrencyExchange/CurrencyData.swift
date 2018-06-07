//
//  CurrencyData.swift
//  CurrencyExchange
//
//  Created by S2H on 2018. 6. 7..
//  Copyright © 2018년 S2H. All rights reserved.
//

import Foundation

struct CurrencyData : Decodable {
    let cur_unit : String // 통화코드
    let cur_nm : String // 국가 / 통화명
    let bkpr : String // 장부가격
    let deal_bas_r : String // 매매 기준율
    
}

