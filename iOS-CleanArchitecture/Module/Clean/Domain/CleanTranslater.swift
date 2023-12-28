//
//  CleanTranslater.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import Foundation

class CleanTranslater {
    
    static func generate(_ entities: [CleanEntity]) -> [CleanModel] {
        
        var models = [CleanModel]()
        
        entities.forEach { data -> () in
            let model = CleanModel(data: data)
            models.append(model)
        }
        
        return models
    }
}
