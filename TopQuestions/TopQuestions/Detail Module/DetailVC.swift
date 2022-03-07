//
//  DetailVC.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import UIKit

final class DetailVC: UIViewController {
    
    private var questionView:QuestionView?
    
    private var viewModel:DetailViewModelResponser?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.title = "Question"
        
        self.view.backgroundColor = .white
        
        configView()
        
        viewModel?.fetchQuestionDetail()
        viewModel?.showErrorCallback = showErrorCallback
        viewModel?.loadDetailsCallback = loadDetailsCallback
    }
    
    private func configView() {
        
        self.questionView = QuestionView(frame: self.view.frame)
        self.questionView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(questionView!)
        
        NSLayoutConstraint.activate([
            questionView!.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            questionView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            questionView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        ])
        
    }
    
    private func configViewData(with topQuestion:Items) {
        self.questionView?.configData(with: topQuestion)
    }
    
    func makeViewModel(viewModel:DetailViewModelResponser) {
        self.viewModel = viewModel
    }
    
    private func showErrorCallback(_ error: Error) {
        DispatchQueue.main.async {
            
        }
    }
    
    private func loadDetailsCallback() {
        DispatchQueue.main.async {
            guard let questionDetail = self.viewModel?.getQuestionDetailInfo() else { return }
            self.configViewData(with: questionDetail)
        }
    }
    
}
