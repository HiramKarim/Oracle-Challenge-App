//
//  APIClient.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Foundation
import Combine

protocol APIClient {
    func fetch<T>(endpoint: EndPoint, type: T.Type) -> AnyPublisher<T, Error> where T:Decodable
}

extension APIClient {
    func fetch<T>(endpoint: EndPoint, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        let newURL = "\(endpoint.baseURL)\(endpoint.path)"
        var urlRequest = URLRequest(url: URL(string: newURL)!)
        urlRequest.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach {
            urlRequest.setValue($0.key, forHTTPHeaderField: $0.value)
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
