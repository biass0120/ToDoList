    //
    //  SecondViewPresenter.swift
    //  ListaDeTarefas
    //
    //  Created by bianca.dos.s.sobral on 14/08/19.
    //  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
    //

    import Foundation

    protocol SecondTableViewPresenterProtocol {
      var view: SecondTableViewControllerProtocol? {get set}
      
      func loadList(tasks: [Task])
    }

    class SecondViewPresenter: NSObject, SecondTableViewPresenterProtocol {

      var view: SecondTableViewControllerProtocol?

      
        init(view: SecondTableViewControllerProtocol){
        self.view = view
        
      }
      
        func loadList(tasks:[Task]) {
            view?.updateList(list: tasks)
    //        view?.updateTable()
        }
        
        func cleanTask(task: Int) {
            view?.removeTask(task: task)
            
        }
        
      
      
      
      
      
      
      
      
      
      
      
    }
