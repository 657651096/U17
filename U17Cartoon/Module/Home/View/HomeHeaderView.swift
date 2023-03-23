//
//  HomeHeaderView.swift
//  U17Cartoon
//
//  Created by xiaoyao on 2023/3/23.
//

import UIKit

class HomeHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .lightGray
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(180)
        }
        
        self.addSubview(boardListView)
        boardListView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom)
            make.height.equalTo(75)
        }
        
        self.addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "强力推荐作品"
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
        imageView = UIImageView(image: UIImage(named: "home_header"))
        return imageView
    }()
    
    private lazy var boardListView: UIView = {
        boardListView = UIView()
        boardListView.backgroundColor = .white
        return boardListView
    }()
    
    private lazy var titleView: UIView = {
        titleView = UIView()
        titleView.backgroundColor = .white
        return titleView
    }()
}
