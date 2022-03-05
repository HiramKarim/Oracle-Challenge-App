//
//  DetailVC.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import UIKit

final class DetailVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.title = "Question"
        
        self.view.backgroundColor = .white
    }
    
}
