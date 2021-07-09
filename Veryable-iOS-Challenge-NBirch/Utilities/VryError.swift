//
//  VryError.swift
//  Veryable-iOS-Challenge-NBirch
//
//  Created by Birch, Nathan J on 7/9/21.
//

import Foundation

enum VryError: String, Error {
    case invalidURL = "The URL for this request was invalid, please try again."
    case unableToComplete = "Unable to complete your request, please check your internet connection."
    case invalidResponse = "Invalid response from the server, please try again."
    case invalidData = "The data sent from the server was invalid, please try again."
}

