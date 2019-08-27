    //
    //  SecondInteractorView.swift
    //  ListaDeTarefas
    //
    //  Created by bianca.dos.s.sobral on 14/08/19.
    //  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
    //

    import Foundation


    protocol SecondTableViewInteractorProtocol {
      var presenter: SecondTableViewPresenterProtocol? {get set}
      var repository: TaskListRepositoryProtocol? {get set}
        
        func loadList()
        func cleanTask(task: Int)
    }

    class SecondTableViewInteractor: NSObject, SecondTableViewInteractorProtocol {
      var presenter: SecondTableViewPresenterProtocol?
      var repository: TaskListRepositoryProtocol?
      
      init(presenter: SecondTableViewPresenterProtocol, repository: TaskListRepositoryProtocol) {
        self.presenter = presenter
        self.repository = repository
      }
      
        func loadList() {
            self.repository?.fetchTasks({ [weak self] tasks in
                self?.presenter?.loadList(tasks: tasks)
            })
        }
       
        func cleanTask(task: Int) {
            repository?.removeTask(task: task)
        }
        
      }
    
    


