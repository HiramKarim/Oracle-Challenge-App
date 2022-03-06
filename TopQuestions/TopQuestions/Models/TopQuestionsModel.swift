//
//  TopQuestionsModel.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Foundation

struct TopQuestionsResponse: Decodable {
    let items:[Items]?
}

struct Items:Decodable {
    let tags:[String]?
    let owner:Owner?
    
    let isAnswered: Bool?
    let viewCount:Int?
    let acceptedAnswerID:Int?
    let answerCount:Int?
    let score:Int?
    let lastActivityDate:Int?
    let creationDate:Int?
    let lastEditDate:Int?
    let questionID:Int?
    let contentLicense:String?
    let link:String?
    let title:String?
    
    private enum CodingKeys : String, CodingKey {
        case tags
        case owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case acceptedAnswerID = "accepted_answer_id"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case lastEditDate = "last_edit_date"
        case questionID = "question_id"
        case contentLicense = "content_license"
        case link
        case title
    }
}

struct Owner:Decodable {
    let reputation: Int?
    let userID: Int?
    let userType: String?
    let profileImage:String?
    let displayName:String?
    let link:String?
    
    private enum CodingKeys : String, CodingKey {
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
}
