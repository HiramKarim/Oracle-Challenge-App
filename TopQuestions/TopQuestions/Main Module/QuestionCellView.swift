//
//  QuestionCellView.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import UIKit

class QuestionCellView: UITableViewCell {
    
    private let questionTitle = UILabel()
    private let questionTags = UILabel()
    private let questionAskedDate = UILabel()
    private let questionReputation = UILabel()
    private let questionAnswerCount = UILabel()
    private let questionViewCount = UILabel()
    
    private let reputationIconName = "arrowtriangle.up.circle"
    private let answersIcon = "text.bubble"
    private let viewCountIcon = "eye"
    
    private let reputationImage = UIImageView()
    private let answerImage = UIImageView()
    private let viewCountImage = UIImageView()
    
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
        
        self.contentView.addSubview(questionReputation)
        self.contentView.addSubview(questionAnswerCount)
        self.contentView.addSubview(questionViewCount)
        
        
        NSLayoutConstraint.activate([
            questionTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            questionTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            questionTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ])
        
    }
    
}


extension UILabel {
    
    func makeLabel(for labelType:LabelType) -> UILabel {
        var label = UILabel()
        
        return label
    }
    
}

enum LabelType {
    case title
    case tag
    case askedDate
    case insights
}
