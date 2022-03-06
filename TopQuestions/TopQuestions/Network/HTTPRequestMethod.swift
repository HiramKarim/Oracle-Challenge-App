//
//  HTTPRequestMethod.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Foundation

enum HTTPRequestMethod: String {
    case get = "GET"
}

protocol EndPoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPRequestMethod { get }
    var headers: [String:String]? { get }
}
