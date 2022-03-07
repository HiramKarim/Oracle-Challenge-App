//
//  DetailViewModel.swift
//  TopQuestions
//
//  Created by Hiram Castro on 06/03/22.
//

import Foundation
import Combine

protocol DetailViewModelInputs {
    var showErrorCallback:((_ error: Error)->Void)? { get set }
    var loadDetailsCallback:(()->Void)? { get set }
    func setQuestionID(questionID:Int)
}

protocol DetailViewModelOutputs {
    func fetchQuestionDetail()
    func getQuestionDetailInfo() -> Items?
}

protocol DetailViewModelResponser: DetailViewModelInputs, DetailViewModelOutputs {}

class DetailViewModel:DetailViewModelResponser {
    
    private var questionDetail: Items?
    private let topQuestionsApiService: TopQuestionsAPI
    private var subscriptions = Set<AnyCancellable>()
    private var questionID:Int!
    
    var showErrorCallback:((_ error: Error)->Void)?
    var loadDetailsCallback:(()->Void)?
    
    init(topQuestionsApiService: TopQuestionsAPI = TopQuestionsAPIService()) {
        self.topQuestionsApiService = topQuestionsApiService
    }
    
    func setQuestionID(questionID:Int) {
        self.questionID = questionID
    }
    
    func fetchQuestionDetail() {
        topQuestionsApiService.fetchQuestionDetail(questionID: self.questionID)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case let .failure(error):
                    self.showErrorCallback?(error)
                case .finished: break
                }
            } receiveValue: { [weak self] questionsResult in
                guard let self = self else { return }
                self.questionDetail = questionsResult.items?.first
                self.loadDetailsCallback?()
            }
            .store(in: &subscriptions)
    }
    
    func getQuestionDetailInfo() -> Items? {
        return questionDetail
    }
    
}
