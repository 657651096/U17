//
//  ClassifyItemCell.swift
//  U17Cartoon
//
//  Created by xiaoyao on 2022/8/18.
//

import UIKit

class ClassifyItemCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        imageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        contentView.addSubview(label)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        contentView.addSubview(imageView)
        return imageView
    }()
    
}
