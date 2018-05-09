//
//  CellModel.swift
//  ExpandableCell
//
//  Created by Rokon Uddin on 5/9/18.
//  Copyright © 2018 Rokon Uddin. All rights reserved.
//

import Foundation

class CellModel {
    let title: String
    let detail: String
    var isExpanded: Bool
    
    init(title: String, detail: String, isExpanded: Bool) {
        self.title = title
        self.detail = detail
        self.isExpanded = isExpanded
    }
}
