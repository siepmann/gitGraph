//
//  ConfigureCellProtocol.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 26/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

protocol ConfigureCellProtocol {
    static var cellIdentifier: String { get }
    
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
}

extension ConfigureCellProtocol {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
}
