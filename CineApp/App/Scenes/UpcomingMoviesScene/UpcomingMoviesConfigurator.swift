//
//  UpcomingMoviesConfigurator.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 05/01/19.
//  Copyright (c) 2019 GSMenezes. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension UpcomingMoviesInteractor: UpcomingMoviesViewControllerOutput, UpcomingMoviesRouterDataSource, UpcomingMoviesRouterDataDestination {
}

extension UpcomingMoviesPresenter: UpcomingMoviesInteractorOutput {
}

class UpcomingMoviesConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = UpcomingMoviesConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: UpcomingMoviesViewController) {
        
        let presenter = UpcomingMoviesPresenter()
        presenter.output = viewController
        
        let interactor = UpcomingMoviesInteractor()
        interactor.output = presenter
        
        let router = UpcomingMoviesRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
