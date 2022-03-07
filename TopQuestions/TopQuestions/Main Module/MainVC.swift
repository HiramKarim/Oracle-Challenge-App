//
//  MainVC.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import UIKit

final class MainVC: UITableViewController {
    
    let mainVM = MainViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.title = "Top Questions"
        
        self.view.backgroundColor = .white
        
        self.tableView.register(QuestionCellView.self, forCellReuseIdentifier: "questioncell")
        self.tableView.estimatedRowHeight = 250
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        mainVM.loadTopQuestions()
        mainVM.showErrorCallback = showErrorCallback
        mainVM.loadTableCallback = loadTableCallback
    }
    
    private func showErrorCallback(_ error: Error) {
        DispatchQueue.main.async {
            
        }
    }
    
    private func loadTableCallback() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension MainVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainVM.getTotalItemList()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "questioncell", for: indexPath) as? QuestionCellView
        else {
            return UITableViewCell()
        }
        
        cell.configCellData(with: mainVM.getQuestionItem(at: indexPath.row))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        let viewmodel = DetailViewModel()
        viewmodel.setQuestionID(questionID: mainVM.getQuestionID(at: indexPath.row))
        detailVC.makeViewModel(viewModel: viewmodel)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
