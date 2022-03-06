//
//  APIService.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Combine

struct TopQuestionsAPIService: TopQuestionsAPI {
    func fetchTopQuestions() -> AnyPublisher<TopQuestionsResponse, Error> {
        return fetch(endpoint: QuestionsEndpoint.fetchQuestions, type: TopQuestionsResponse.self)
    }
}
