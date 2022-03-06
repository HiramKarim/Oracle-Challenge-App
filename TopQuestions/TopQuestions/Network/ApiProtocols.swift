//
//  ApiProtocols.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Combine

protocol TopQuestionsAPI: APIClient {
    func fetchTopQuestions() -> AnyPublisher<TopQuestionsResponse, Error>
}
