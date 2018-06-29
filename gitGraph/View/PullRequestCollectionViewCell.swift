//
//  PullRequestCollectionViewCell.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 28/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit

class PullRequestCollectionViewCell: UICollectionViewCell {
    let repoName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let repoBody: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let forkImage: UIImageView = {
        return UIImageView()
    }()
    
    let forkCount: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let starsImage: UIImageView = {
        return UIImageView()
    }()
    
    let starsCount: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let userView: UIView = {
        return UIView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.repoName.text = ""
        self.repoBody.text = ""
        self.forkCount.text = "0"
        self.starsCount.text = "0"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PullRequestCollectionViewCell: SetupCellProtocol {
    typealias DataType = PullRequestData
    
    func setupCell(data: DataType) {
        
    }
}

extension PullRequestCollectionViewCell: ConfigureCellProtocol {
    static var cellIdentifier: String {
        return "\(self)"
    }
    
    func buildViewHierarchy() {
        self.contentView.addSubview(self.repoName)
        self.contentView.addSubview(self.repoBody)
        self.contentView.addSubview(self.forkImage)
        self.contentView.addSubview(self.forkCount)
        self.contentView.addSubview(self.starsImage)
        self.contentView.addSubview(self.starsCount)
        self.contentView.addSubview(self.userView)
    }
    
    func setupConstraints() {
        let width = UIScreen.main.bounds.width
        
        self.contentView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(200)
            make.left.right.top.bottom.equalTo(0)
        }
        
        self.repoName.snp.makeConstraints { make in
            make.width.equalTo(width - 8 - 60)
            make.height.equalTo(30)
            make.top.left.equalTo(self.contentView).offset(8)
        }
        
        //162
        
        self.repoBody.snp.makeConstraints { make in
            make.width.equalTo( width - 8 - 60)
            make.height.equalTo(90)
            make.left.equalTo(self.contentView).offset(8)
            make.top.equalTo(self.repoName.snp.bottom).offset(10)
        }
        
        //62
        
        self.forkImage.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(8)
            make.width.height.equalTo(20)
            make.top.equalTo(self.repoBody.snp.bottom).offset(10)
        }
        
        self.forkCount.snp.makeConstraints { make in
            make.left.equalTo(self.forkImage.snp.left).offset(5)
            make.width.equalTo(50)
            make.height.equalTo(20)
            make.top.equalTo(self.repoBody.snp.bottom).offset(10)
        }
        
        self.starsImage.snp.makeConstraints { make in
            make.left.equalTo(self.forkCount.snp.left).offset(8)
            make.width.height.equalTo(20)
            make.top.equalTo(self.repoBody.snp.bottom).offset(10)
        }
        
        self.starsCount.snp.makeConstraints { make in
            make.left.equalTo(self.starsImage.snp.left).offset(5)
            make.width.equalTo(50)
            make.height.equalTo(20)
            make.top.equalTo(self.repoBody.snp.bottom).offset(10)
        }
        
        self.userView.snp.makeConstraints { make in
            make.top.bottom.right.equalTo(self.contentView)
            make.left.equalTo(self.contentView).inset(60)
            make.width.equalTo(60)
        }
    }
}
