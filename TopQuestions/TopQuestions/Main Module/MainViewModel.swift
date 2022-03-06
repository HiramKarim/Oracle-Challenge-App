//
//  MainViewModel.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Foundation
import Combine

protocol MainViewModelInputs {
    
}

protocol MainViewModelOutputs {
    func loadTopQuestions()
}

protocol MainViewModelResponser: MainViewModelInputs, MainViewModelOutputs {}

class MainViewModel:MainViewModelResponser {
    
    private let topQuestionsApiService: TopQuestionsAPI
    private var subscriptions = Set<AnyCancellable>()
    
    init(topQuestionsApiService: TopQuestionsAPI = TopQuestionsAPIService()) {
        self.topQuestionsApiService = topQuestionsApiService
    }
    
    func loadTopQuestions() {
        topQuestionsApiService.fetchTopQuestions()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print("Couldn't get questions: \(error)")
                case .finished: break
                }
            } receiveValue: { questionsResult in
                print("received questions \(questionsResult.items ?? [])")
            }
            .store(in: &subscriptions)
    }
}
