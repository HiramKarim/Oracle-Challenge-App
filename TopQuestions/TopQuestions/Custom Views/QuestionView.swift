//
//  QuestionView.swift
//  TopQuestions
//
//  Created by Hiram Castro on 06/03/22.
//

import UIKit

class QuestionView: UIView {
    
    private let questionTitle: UILabel = {
        return UILabel.makeLabel(for: .title)
    }()
    
    private let questionTags: UILabel = {
        return UILabel.makeLabel(for: .tag)
    }()
    
    private let questionAskedDate: UILabel = {
        return UILabel.makeLabel(for: .askedDate)
    }()
    
    private let questionReputation: UILabel = {
        return UILabel.makeLabel(for: .insights)
    }()
    
    private let questionAnswerCount: UILabel = {
        return UILabel.makeLabel(for: .insights)
    }()
    
    private let questionViewCount: UILabel = {
        return UILabel.makeLabel(for: .insights)
    }()
    
    private let reputationImage: UIImageView = {
        return UIImageView.makeImage(for: .reputationType)
    }()
    
    private let answerQuestionImage: UIImageView = {
        return UIImageView.makeImage(for: .commentType)
    }()
    
    private let viewCountImage: UIImageView = {
        return UIImageView.makeImage(for: .viewType)
    }()
    
    private var stackContainer: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        
        let firstStack = UIStackView(arrangedSubviews: [reputationImage, questionReputation])
        firstStack.alignment = .fill
        firstStack.axis = .horizontal
        firstStack.spacing = 10
        
        let secondStack = UIStackView(arrangedSubviews: [answerQuestionImage, questionAnswerCount])
        secondStack.alignment = .fill
        secondStack.axis = .horizontal
        secondStack.spacing = 10
        
        let thirdStack = UIStackView(arrangedSubviews: [viewCountImage, questionViewCount])
        thirdStack.alignment = .fill
        thirdStack.axis = .horizontal
        thirdStack.spacing = 10
        
        stackContainer = UIStackView(arrangedSubviews: [firstStack, secondStack, thirdStack])
        stackContainer.alignment = .fill
        stackContainer.axis = .horizontal
        stackContainer.spacing = 30
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(questionTitle)
        self.addSubview(questionTags)
        self.addSubview(questionAskedDate)
        self.addSubview(stackContainer)
        
        NSLayoutConstraint.activate([
            questionTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            questionTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            questionTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            questionTags.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 10),
            questionTags.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            questionTags.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            questionAskedDate.topAnchor.constraint(equalTo: questionTags.bottomAnchor, constant: 10),
            questionAskedDate.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            stackContainer.topAnchor.constraint(equalTo: questionAskedDate.bottomAnchor, constant: 10),
            stackContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
        ])
        
    }
    
    func configData(with topQuestion:Items) {
        self.questionTitle.text = topQuestion.title ?? ""
        self.questionTags.text = topQuestion.getFormattedTags()
        self.questionAskedDate.text = "Asked on \(topQuestion.getCreationDateFormatted())"
        
        self.questionReputation.text = topQuestion.score?.formatNumber()
        self.questionAnswerCount.text = topQuestion.answerCount?.formatNumber()
        self.questionViewCount.text = topQuestion.viewCount?.formatNumber()
    }
    
}
