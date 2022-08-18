//
//  ClassifyViewController.swift
//  U17Cartoon
//
//  Created by xiaoyao on 2022/8/17.
//

import UIKit

class ClassifyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.titleView = titleButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        
        collectionView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    @objc private func titleClick() {
        print("-=-= ")
    }
    
    private lazy var titleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 30)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.setImage(UIImage(named: "nav_search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("搜索", for: .normal)
        button.addTarget(self, action: #selector(titleClick), for: .touchUpInside)
//        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(ClassifyItemCell.self, forCellWithReuseIdentifier: "ClassifyItemCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        return collectionView
    }()
}

extension ClassifyViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassifyItemCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
