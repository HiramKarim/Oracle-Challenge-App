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
    let creationDate:Double?
    let lastEditDate:Double?
    let questionID:Int?
    let contentLicense:String?
    let link:String?
    let title:String?
    let body:String?
    
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
        case body
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

extension TopQuestionsResponse {
    static func returnEmptyQuestionMock() -> Items {
        return Items(tags: [],
                     owner: nil,
                     isAnswered: nil,
                     viewCount: nil,
                     acceptedAnswerID: nil,
                     answerCount: nil,
                     score: nil,
                     lastActivityDate: nil,
                     creationDate: nil,
                     lastEditDate: nil,
                     questionID: nil,
                     contentLicense: nil,
                     link: nil,
                     title: nil,
                     body: nil)
    }
}

extension Items {
    func getFormattedTags() -> String {
        var newTags:String = ""
        
        _ = self.tags?.compactMap({ tag in
            newTags += tag + ","
        })
        
        _ = newTags.removeLast()
        
        return newTags
    }
    
    func getCreationDateFormatted() -> String {
        return Date.convertToFormattedDate(from: creationDate ?? 0)
    }
}
