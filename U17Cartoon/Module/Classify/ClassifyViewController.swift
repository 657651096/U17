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
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    private lazy var titleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 30)
        button.backgroundColor = UIColor(white: 0, alpha: 0.1)
        button.layer.cornerRadius = 15
        button.setImage(UIImage(named: "nav_search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("搜索", for: .normal)
        button.addTarget(self, action: #selector(titleClick), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.automaticallyAdjustsScrollIndicatorInsets = false
        collectionView.backgroundColor = .white
        collectionView.register(ClassifyItemCell.self, forCellWithReuseIdentifier: "ClassifyItemCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        return collectionView
    }()
}

extension ClassifyViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassifyItemCell", for: indexPath) as! ClassifyItemCell
        cell.setModel()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (ScreenWidth - 40) / 3, height: (ScreenWidth - 40) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 1 {
            navigationController?.navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
        } else {
            navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .white, size: CGSize(width: ScreenWidth, height: 88)), for: .default)
        }
    }
}
