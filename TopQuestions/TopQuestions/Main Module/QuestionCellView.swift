//
//  QuestionCellView.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import UIKit

class QuestionCellView: UITableViewCell {
    
    private var questionView:QuestionView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configCellView() {
        
        self.questionView = QuestionView(frame: self.frame)
        self.questionView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(questionView!)
        
        NSLayoutConstraint.activate([
            questionView!.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            questionView!.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            questionView!.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            questionView!.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
        ])
        
    }
    
    func configCellData(with topQuestion:Items) {
        self.questionView?.configData(with: topQuestion)
    }
    
}
