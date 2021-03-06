//
//  MainViewModel.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import Foundation
import Combine

protocol MainViewModelInputs {
    var showErrorCallback:((_ error: Error)->Void)? { get set }
    var loadTableCallback:(()->Void)? { get set }
    func goToQuestionDetails(usingQuestionID questionID:Int)
}

protocol MainViewModelOutputs {
    var showErrorCallback:((_ error: Error)->Void)? { get set }
    var loadTableCallback:(()->Void)? { get set }
    func loadTopQuestions()
    func getTotalItemList() -> Int
    func getQuestionItem(at index:Int) -> Items
    func getQuestionID(at index:Int) -> Int
}

protocol MainViewModelResponser: MainViewModelInputs, MainViewModelOutputs {}

class MainViewModel:MainViewModelResponser {
    
    weak var coordinator: AppCoordinator!
    
    private var topQuestionsArray: [Items]?
    private let topQuestionsApiService: TopQuestionsAPI
    private var subscriptions = Set<AnyCancellable>()
    
    var showErrorCallback:((_ error: Error)->Void)?
    var loadTableCallback:(()->Void)?
    
    init(topQuestionsApiService: TopQuestionsAPI = TopQuestionsAPIService()) {
        self.topQuestionsApiService = topQuestionsApiService
    }
    
    func loadTopQuestions() {
        topQuestionsApiService.fetchTopQuestions()
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
                self.topQuestionsArray = questionsResult.items
                self.loadTableCallback?()
            }
            .store(in: &subscriptions)
    }
    
    func getTotalItemList() -> Int {
        return topQuestionsArray?.count ?? 0
    }
    
    func getQuestionItem(at index:Int) -> Items {
        guard let items = topQuestionsArray else { return TopQuestionsResponse.returnEmptyQuestionMock() }
        if index > items.count { return TopQuestionsResponse.returnEmptyQuestionMock() }
        return items[index]
    }
    
    func getQuestionID(at index:Int) -> Int {
        if let items = topQuestionsArray {
            return items[index].questionID ?? 0
        } else {
            return 0
        }
    }
    
    func goToQuestionDetails(usingQuestionID questionID:Int) {
        coordinator.goToQuestionDetails(usingQuestionID: questionID)
    }
}
