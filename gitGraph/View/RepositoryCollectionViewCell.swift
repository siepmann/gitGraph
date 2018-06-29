//
//  RepositoryCollectionViewCell.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 25/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import SnapKit

class RepositoryCollectionViewCell: UICollectionViewCell {
    let repoName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    let repoBody: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
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

extension RepositoryCollectionViewCell: SetupCellProtocol {
    typealias DataType = Repository
    
    func setupCell(data: DataType) {
        guard let repo = data.asRepository else { return }
        self.repoName.text = repo.name
        self.repoBody.text = repo.description
        self.forkCount.text = "\(repo.forks.totalCount)"
        self.starsCount.text = "\(repo.stargazers.totalCount)"
    }
}

extension RepositoryCollectionViewCell: ConfigureCellProtocol {
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
            make.height.equalTo(100)
            make.left.right.top.bottom.equalTo(0)
        }
        
        self.repoName.snp.makeConstraints { make in
            make.width.equalTo(width - 10 - 60)
            make.height.equalTo(30)
            make.top.left.equalTo(self.contentView).offset(10)
        }
        
        self.repoBody.snp.makeConstraints { make in
            make.width.equalTo( width - 10 - 60)
            make.height.equalTo(30)
            make.left.equalTo(self.contentView).offset(10)
            make.top.equalTo(self.repoName.snp.bottom).offset(5)
        }
        
        self.forkImage.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(10)
            make.width.height.equalTo(20)
            make.top.equalTo(self.repoBody.snp.bottom).offset(5)
        }
        
        self.forkCount.snp.makeConstraints { make in
            make.left.equalTo(self.forkImage.snp.right).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.top.equalTo(self.repoBody.snp.bottom).offset(5)
        }
        
        self.starsImage.snp.makeConstraints { make in
            make.left.equalTo(self.forkCount.snp.right).offset(8)
            make.width.height.equalTo(20)
            make.top.equalTo(self.repoBody.snp.bottom).offset(5)
        }
        
        self.starsCount.snp.makeConstraints { make in
            make.left.equalTo(self.starsImage.snp.right).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.top.equalTo(self.repoBody.snp.bottom).offset(5)
        }
        
        self.userView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(self.contentView)
            make.width.equalTo(60)
        }
    }
}
