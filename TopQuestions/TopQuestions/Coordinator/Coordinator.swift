//
//  Coordinator.swift
//  TopQuestions
//
//  Created by Hiram Castro on 06/03/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children:[Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        goToQuestionsListVC()
    }
    
    func goToQuestionsListVC() {
        let viewModel = MainViewModel()
        viewModel.coordinator = self
        let mainController = MainVC()
        mainController.makeViewModel(viewModel: viewModel)
        self.navigationController.pushViewController(mainController, animated: true)
    }
    
    func goToQuestionDetails(usingQuestionID questionID:Int) {
        let detailVC = DetailVC()
        let viewmodel = DetailViewModel()
        viewmodel.setQuestionID(questionID: questionID)
        detailVC.makeViewModel(viewModel: viewmodel)
        self.navigationController.pushViewController(detailVC, animated: true)
    }
}
