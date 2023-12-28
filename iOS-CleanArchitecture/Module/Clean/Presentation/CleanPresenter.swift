//
//  CleanPresenter.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import Foundation

protocol CleanPresenterInput: AnyObject {
    // MARK: Methods called from View
    func fromView()
    func createTodo(_ title: String)
}

protocol CleanPresenterOutput: AnyObject {
    // MARK: Callback from UseCase
    func forUseCase(_ models: [CleanModel])
}

// MARK: - CleanPresenter

final class CleanPresenter {
    
    // MARK: Architecture properties

    private var useCase: CleanUseCaseInput!
    var viewOutput: CleanViewOutput?
    
    // MARK: Instance methods

    init(useCase: CleanUseCaseInput) {
        self.useCase = useCase
    }
    
    // MARK: Other properties
    
    // MARK: Other methods
}

// MARK: - CleanPresenterInput

extension CleanPresenter: CleanPresenterInput {
    func fromView() {
        useCase.fromPresenter()
    }
    func createTodo(_ title: String) {
        useCase.createTodo(title)
    }
}

// MARK: - CleanPresenterOutput

extension CleanPresenter: CleanPresenterOutput {
    func forUseCase(_ models: [CleanModel]) {
        print("forUseCase models:\(models)")
        viewOutput?.forPresenter(models)
    }
}
