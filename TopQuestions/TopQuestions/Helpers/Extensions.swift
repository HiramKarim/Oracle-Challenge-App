//
//  Extensions.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import UIKit

enum LabelType {
    case title
    case tag
    case askedDate
    case insights
}

enum ImageType {
    case reputationType
    case commentType
    case viewType
}

extension UILabel {
    
    static func makeLabel(for labelType:LabelType) -> UILabel {
        let label = UILabel()
        //label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switch labelType {
        case .title:
            label.textColor = .black
            label.text = "SwiftUI - How do I change the background color of a View? SwiftUI - How do I change the background color of a View? SwiftUI - How do I change the background color of a View?"
            label.numberOfLines = 10
            label.font = UIFont.init(name: "Arial-Black", size: 25)
            break
        case .tag:
            label.textColor = .blue
            label.text = "view, background, background-color, modifier, swiftUI, view, background, background-color, modifier, swiftUI"
            label.numberOfLines = 3
            label.font = UIFont.init(name: "Arial", size: 15)
            break
        case .askedDate:
            label.textColor = .lightGray
            label.text = "Asked on Sep 15th, 2019"
            label.font = UIFont.init(name: "Arial", size: 15)
            break
        case .insights:
            label.textColor = .cyan
            label.text = "50"
            label.font = UIFont.init(name: "Arial", size: 20)
            break
        }
        
        return label
    }
    
}

extension UIImageView {
    static func makeImage(for imageType:ImageType) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        switch imageType {
        case .reputationType:
            imageView.image = UIImage(systemName: "arrowtriangle.up.circle")
            break
        case .commentType:
            imageView.image = UIImage(systemName: "text.bubble")
            break
        case .viewType:
            imageView.image = UIImage(systemName: "eye")
            break
        }
        
        
        return imageView
    }
}
