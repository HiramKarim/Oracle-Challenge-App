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
    
    private var textBodyLabel:UILabel = {
        return UILabel.makeLabel(for: .textbody)
    }()
    
    private var authorName:UILabel = {
        return UILabel.makeLabel(for: .title)
    }()
    
    private var scrollView:UIScrollView = {
       let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private var containerView:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private var profilePicture:UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(questionView!)
        containerView.addSubview(textBodyLabel)
        containerView.addSubview(profilePicture)
        containerView.addSubview(authorName)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            
            questionView!.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            questionView!.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            questionView!.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            textBodyLabel.topAnchor.constraint(equalTo: questionView!.bottomAnchor, constant: 10),
            textBodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            textBodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            profilePicture.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0),
            profilePicture.topAnchor.constraint(equalTo: textBodyLabel.bottomAnchor, constant: 20),
            profilePicture.widthAnchor.constraint(equalToConstant: 50),
            profilePicture.heightAnchor.constraint(equalToConstant: 50),
            profilePicture.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            
            authorName.centerYAnchor.constraint(equalTo: profilePicture.centerYAnchor, constant: -20),
            authorName.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10)
        ])
        
    }
    
    private func configViewData(with topQuestion:Items) {
        self.questionView?.configData(with: topQuestion)
        self.textBodyLabel.attributedText = topQuestion.body?.htmlAttributedString()
        
        guard let url = URL(string: topQuestion.owner?.profileImage ?? "") else { return }
        
        self.profilePicture.load(url: url)
        self.authorName.text = topQuestion.owner?.displayName ?? ""
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
