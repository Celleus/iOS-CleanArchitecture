//
//  CleanModel.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/28.
//

import Foundation

class CleanModel {
    // CleanEntityにあるデータの中から表示に必要なものだけ記載する
    var title : String = ""
    
    init() {}
        
    init(data : CleanEntity) {
        self.title = data.title
    }
}
