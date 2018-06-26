//
//  SetupCellProtocol.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 26/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation

protocol SetupCellProtocol {
    associatedtype DataType
    func setupCell(data: DataType)
}
