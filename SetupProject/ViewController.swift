//
//  ViewController.swift
//  SetupProject
//
//  Created by Abdullah Alhaider on 05/05/2019.
//  Copyright © 2019 Abdullah Alhaider - https://github.com/cs4alhaider. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    private var tableData: [ModelPostElement] = [] {
        didSet {
            filteredData = tableData
            tableView.animate(.showView(duruation: 0.4))
        }
    }
    
    private var filteredData: [ModelPostElement] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var searchTextField: SearchTextField = {
        let searchTextField = SearchTextField()
        searchTextField.delegate = self
        return searchTextField
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = nil
        table.animate(.hideView(duruation: 0))
        table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logger("let's see...")
        
        // From UIViewController+Extention.swift
        setTitles(navigationTitle: "Posts")
        // end
        
        // From BaseViewController
        startAnimating()
        // end
        
        fetchPosts()
    }
    
    // From BaseViewController
    override func setupForUI() {
        view.addSubviews(searchTextField, tableView)
        searchTextField.anchor(top: view.safeTopAnchor,
                               left: view.safeLeftAnchor,
                               bottom: nil,
                               right: view.safeRightAnchor,
                               topConstant: 0,
                               leftConstant: 0,
                               bottomConstant: 0,
                               rightConstant: 0)
        searchTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        tableView.anchor(top: searchTextField.bottomAnchor,
                               left: view.safeLeftAnchor,
                               bottom: view.safeBottomAnchor,
                               right: view.safeRightAnchor,
                               topConstant: 0,
                               leftConstant: 0,
                               bottomConstant: 0,
                               rightConstant: 0)
        
    }
    
    private func fetchPosts() {
        ModelPost.getPosts { (result) in
            switch result {
            case .success(let data):
                self.tableData = data.posts ?? []
                // From BaseViewController
                self.stopAnimating()
                // end
            case .failure(let error):
                // From BaseViewController
                self.error = error
                self.stopAnimating()
                // end
            }
        }
    }
    
}

extension ViewController: SearchTextFieldDelegate {
    func searchTextField(_ searchTextField: UITextField, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? tableData : tableData.filter({ $0.title?.range(of: searchText, options: .caseInsensitive) != nil })
    }
    
    func cancelDidTapped(_ sender: UIButton) {
        view.endEditing(true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.backgroundColor = nil
        cell.textLabel?.text = filteredData[indexPath.row].title
        cell.textLabel?.textColor = Identity.color(.primary)
        cell.textLabel?.font = Identity.font(.h3)
        cell.detailTextLabel?.text = filteredData[indexPath.row].body
        cell.detailTextLabel?.textColor = Identity.color(.textColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // cell.animateCell()
    }
}
