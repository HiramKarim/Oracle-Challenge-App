//
//  TopQuestionsModel.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Foundation

struct TopQuestionsResponse: Decodable {
    let topQuestions:[TopQuestions]?
}

struct TopQuestions:Decodable {
    let tags:[String]?
    let owner:Owner?
}

struct Owner:Decodable {
    let reputation: Int?
    let userID: Int?
    let userType: String?
    let profileImage:String?
    
    private enum CodingKeys : String, CodingKey {
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case profileImage = "profile_image"
    }
}
