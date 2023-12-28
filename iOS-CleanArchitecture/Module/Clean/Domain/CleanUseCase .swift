//
//  CleanUseCase .swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import Foundation

protocol CleanUseCaseInput: AnyObject {
    // MARK: Methods called from presenter
    func fromPresenter()
    func createTodo(_ title: String)
}

protocol CleanUseCaseOutput: AnyObject {
    // MARK: Callback from UseCase
    func forRepository(_ entities: [CleanEntity])
}

final class CleanUseCase {
    
    // MARK: Architecture properties
    
    private var repository: CleanRepositoryInput!
    var presenterOutput: CleanPresenterOutput?
    
    // MARK: Instance methods

    init(repository: CleanRepositoryInput) {
        self.repository = repository
    }

    // MARK: Other properties
    
    // MARK: Other methods
}

// MARK: - CleanUseCaseInput

extension CleanUseCase: CleanUseCaseInput {
    func fromPresenter() {
        repository.fromUseCase()
    }
    func createTodo(_ title: String) {
        repository.createTodo(title)
    }
}

// MARK: - CleanUseCaseOutput

extension CleanUseCase: CleanUseCaseOutput {
    func forRepository(_ entities: [CleanEntity]) {
        let models = CleanTranslater.generate(entities)
        presenterOutput?.forUseCase(models)
    }
}
