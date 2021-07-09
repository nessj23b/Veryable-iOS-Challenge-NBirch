//
//  Account.swift
//  Veryable-iOS-Challenge-NBirch
//
//  Created by Birch, Nathan J on 7/7/21.
//

import Foundation

struct Account: Decodable, Identifiable {
    
    let id: Int
    let accountType: String
    let accountName: String
    let desc: String
}
