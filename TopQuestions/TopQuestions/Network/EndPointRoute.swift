//
//  EndPointRoute.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Foundation

enum QuestionsEndpoint {
    case fetchQuestions
}

extension QuestionsEndpoint: EndPoint {
    var baseURL: URL {
        guard let url = URL(string: "") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchQuestions:
            return ""
        }
    }
    
    var method: HTTPRequestMethod {
        switch self {
        case .fetchQuestions:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchQuestions:
            return nil
        }
    }
    
    
}
