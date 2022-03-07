//
//  EndPointRoute.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Foundation

enum QuestionsEndpoint {
    case fetchQuestions
    case fetchQuestionDetail
}

extension QuestionsEndpoint: EndPoint {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchQuestions:
            return Constants.topQuestionsListAPIURL
        case .fetchQuestionDetail:
            return Constants.questionDetailAPIURL
        }
    }
    
    var method: HTTPRequestMethod {
        switch self {
        case .fetchQuestions:
            return .get
        case .fetchQuestionDetail:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchQuestions:
            return nil
        case .fetchQuestionDetail:
            return nil
        }
    }
    
    
}
