//
//  HomeViewController.swift
//  U17Cartoon
//
//  Created by xiaoyao on 2022/8/17.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        navigationItem.title = "首页"
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
        navigationController?.navigationBar.isTranslucent = true
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview();
        }
        collectionView.contentInset = .init(top: 315, left: 0, bottom: 0, right: 0)
        
        collectionView.addSubview(headerView)
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (ScreenWidth - 10) / 2, height: 180)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeWorksCell.self, forCellWithReuseIdentifier: "HomeWorksCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var headerView: HomeHeaderView = {
        let headerView = HomeHeaderView(frame: CGRect(x: 0, y: -315, width: ScreenWidth, height: 315))
        return headerView
    }()
    
    private lazy var dataSource: NSArray = {
        let model1 = HomeWorksModel(imageName: "home_item_1", title: "尚善", content: "少女 魔幻 生活")
        let model2 = HomeWorksModel(imageName: "home_item_2", title: "尚善", content: "少女 魔幻 生活")
        let model3 = HomeWorksModel(imageName: "home_item_3", title: "尚善", content: "少女 魔幻 生活")
        let model4 = HomeWorksModel(imageName: "home_item_4", title: "尚善", content: "少女 魔幻 生活")
        let array = NSArray(objects: model1, model2, model3, model4)
        return array
    }()
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeWorksCell", for: indexPath) as! HomeWorksCell
        let model: HomeWorksModel = dataSource.object(at: indexPath.row) as! HomeWorksModel
        cell.setModel(model: model)
        return cell
    }
}
