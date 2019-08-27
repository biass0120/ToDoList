    //
    //  FirstViewPresenter.swift
    //  ListaDeTarefas
    //
    //  Created by bianca.dos.s.sobral on 14/08/19.
    //  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
    //
    
    import Foundation
    
    
    protocol FirstViewPresenterProtocol {
        var view: FirstViewControllerProtocol? { get set }
        
        func updateTaskList()
        func presentError(string: String)
        
    }
    
    class FirstViewPresenter: NSObject, FirstViewPresenterProtocol {
        var view: FirstViewControllerProtocol?
        
        init(view: FirstViewControllerProtocol) {
            self.view = view
        }
        
        func updateTaskList() {
            view?.navigationToSecondScreen()
        }
        
        func presentError(string: String) {
            view?.presentError(error: string)
        }
        
        
    }
