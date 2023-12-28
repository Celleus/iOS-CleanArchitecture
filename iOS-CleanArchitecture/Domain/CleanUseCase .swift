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
}

protocol CleanUseCaseOutput: AnyObject {
    // MARK: Callback from UseCase
    func forRepository()
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
}

// MARK: - CleanUseCaseOutput

extension CleanUseCase: CleanUseCaseOutput {
    func forRepository() {
        presenterOutput?.forUseCase()
    }
}
