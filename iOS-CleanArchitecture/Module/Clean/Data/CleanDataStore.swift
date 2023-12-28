//
//  CleanDataStore.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import Foundation

// MARK: - CleanDataStoreInterface

protocol CleanDataStoreInterface {
    func getDatas() -> [CleanEntity]
    func createTodo(_ title: String)
}

// MARK: - CleanDataStore

final class CleanDataStore: CleanDataStoreInterface {
    
    // MARK: Instance properties

    let isDelete: Bool
    
    // MARK: Instance methods

    init(_ isDelete: Bool = false) {
        self.isDelete = isDelete
    }

    // MARK: Other properties
    
    // MARK: Other methods
    
    func getDatas() -> [CleanEntity] {
        var entities: [CleanEntity] = []
        for data in Todo.all(isDelete) {
            entities.append(CleanEntity(title: data.title))
        }
        return entities
    }
    
    func createTodo(_ title: String) {
        let todo = Todo()
        todo.title = title
        todo.create()
    }
}
