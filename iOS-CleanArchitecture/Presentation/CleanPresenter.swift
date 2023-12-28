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
}

protocol CleanPresenterOutput: AnyObject {
    // MARK: Callback from UseCase
    func forUseCase()
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
}

// MARK: - CleanPresenterOutput

extension CleanPresenter: CleanPresenterOutput {
    func forUseCase() {
        viewOutput?.forPresenter()
    }
}
