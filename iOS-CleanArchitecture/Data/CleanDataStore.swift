//
//  CleanDataStore.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import Foundation

// MARK: - CleanDataStoreInterface

protocol CleanDataStoreInterface {
    func getDatas() -> [Todo]
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
    
    func getDatas() -> [Todo] {
        return []
    }
}
