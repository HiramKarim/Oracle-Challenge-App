//
//  QuestionCellView.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import UIKit

class QuestionCellView: UITableViewCell {
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configCellView() {
        
        self.contentView.addSubview(questionTitle)
        self.contentView.addSubview(questionTags)
        self.contentView.addSubview(questionAskedDate)
        
        self.contentView.addSubview(reputationImage)
        self.contentView.addSubview(questionReputation)
        
        //self.contentView.addSubview(questionAnswerCount)
        //self.contentView.addSubview(questionViewCount)
        
        
        NSLayoutConstraint.activate([
            questionTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            questionTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            questionTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -40),
            
            questionTags.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 10),
            questionTags.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            questionTags.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            questionAskedDate.topAnchor.constraint(equalTo: questionTags.bottomAnchor, constant: 10),
            questionAskedDate.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            
            reputationImage.topAnchor.constraint(equalTo: questionAskedDate.bottomAnchor, constant: 10),
            reputationImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            reputationImage.widthAnchor.constraint(equalToConstant: 20),
            reputationImage.heightAnchor.constraint(equalToConstant: 20),
            reputationImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            
            questionReputation.topAnchor.constraint(equalTo: questionAskedDate.bottomAnchor, constant: 10),
            questionReputation.leadingAnchor.constraint(equalTo: reputationImage.trailingAnchor, constant: 5),
            questionReputation.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
        ])
        
    }
    
}
