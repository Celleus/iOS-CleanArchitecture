//
//  CleanRepository.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import Foundation

// MARK: - CleanRepositoryInterface

protocol CleanRepositoryInput: AnyObject {
    // MARK: Methods called from UseCase
    func fromUseCase()
    func createTodo(_ title: String)
}

// MARK: - CleanRepository

final class CleanRepository {
    
    // MARK: Architecture properties

    private var dataStore: CleanDataStore!
    var useCase: CleanUseCaseOutput?
    
    // MARK: Instance properties

    
    // MARK: Instance methods

    init(dataStore: CleanDataStore) {
        self.dataStore = dataStore
    }

    // MARK: Other properties
    
    // MARK: Other methods
}

// MARK: - CleanRepositoryInput

extension CleanRepository: CleanRepositoryInput {
    func fromUseCase() {
        let entities = dataStore.getDatas()
        useCase?.forRepository(entities)
    }
    func createTodo(_ title: String) {
        dataStore.createTodo(title)
    }
}
