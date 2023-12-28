//
//  CleanBuilder.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import UIKit
import Foundation

struct CleanBuilder {
    typealias ViewController = CleanViewController
    
    static func build() -> ViewController {
        let viewController = UIStoryboard(name: "CleanViewController", bundle: nil).instantiateInitialViewController() as! CleanViewController

        let dataStore      = CleanDataStore()
        let repository     = CleanRepository(dataStore: dataStore)
        let useCase        = CleanUseCase(repository: repository)
        let presenter      = CleanPresenter(useCase: useCase)
        
        viewController.presenterInput = presenter
        presenter.viewOutput = viewController
        useCase.presenterOutput = presenter

        return viewController
    }
}
