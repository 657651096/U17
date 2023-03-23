//
//  SearchViewController.swift
//  U17Cartoon
//
//  Created by xiaoyao on 2023/3/23.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_black"), style: .plain, target: self, action: #selector(back))
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.titleView = searchTextField
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }

    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func search() {
        print(searchTextField.text ?? "")
        tableView.reloadData()
    }
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
        textField.placeholder = "请输入漫画名或作者"
        textField.addTarget(self, action: #selector(search), for: .editingChanged)
        return textField
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SearchResultCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(arc4random() % 7 + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell")!
        cell.textLabel?.text = searchTextField.text
        return cell
    }
    
    
}
