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
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 5
        
        imageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    public func setModel() {
        titleLabel.text = "都市"
        imageView.image = UIImage.init(named: "category_icon_1")
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
        contentView.addSubview(imageView)
        return imageView
    }()
    
}
