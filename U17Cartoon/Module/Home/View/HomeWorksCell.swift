//
//  HomeWorksCell.swift
//  U17Cartoon
//
//  Created by xiaoyao on 2023/3/23.
//

import UIKit

class HomeWorksCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(120)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(imageView.snp.bottom)
            make.height.equalTo(30)
        }
        
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.height.equalTo(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        return titleLabel
    }()
    
    private lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        return contentLabel
    }()
    
    public func setModel(model: HomeWorksModel) {
        imageView.image = UIImage(named: model.imageName ?? "")
        titleLabel.text = model.title
        contentLabel.text = model.content
    }
}
