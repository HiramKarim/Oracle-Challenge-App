//
//  MainVC.swift
//  TopQuestions
//
//  Created by Hiram Castro on 05/03/22.
//

import UIKit

final class MainVC: UITableViewController {
    
    private var viewModel:MainViewModelResponser?
    
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
        
        viewModel?.loadTopQuestions()
        viewModel?.showErrorCallback = showErrorCallback
        viewModel?.loadTableCallback = loadTableCallback
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
    
    func makeViewModel(viewModel:MainViewModelResponser) {
        self.viewModel = viewModel
    }
    
}

extension MainVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getTotalItemList() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "questioncell", for: indexPath) as? QuestionCellView
        else {
            return UITableViewCell()
        }
        
        cell.configCellData(with: viewModel?.getQuestionItem(at: indexPath.row) ?? TopQuestionsResponse.returnEmptyQuestionMock())
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.goToQuestionDetails(usingQuestionID: viewModel?.getQuestionID(at: indexPath.row) ?? 0)
    }
    
}
