    //
    //  FirstInteractorView.swift
    //  ListaDeTarefas
    //
    //  Created by bianca.dos.s.sobral on 13/08/19.
    //  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
    //

    import Foundation


    protocol FirstInteractorViewProtocol {
        var presenter: FirstViewPresenterProtocol? { get set }
        var repository: TaskListRepositoryProtocol? {get set}
        
        func createTask(to text: String)
        func removeTask(task: Int)
    }

    class FirstViewInteractor: NSObject, FirstInteractorViewProtocol {
        var presenter: FirstViewPresenterProtocol?
        var repository: TaskListRepositoryProtocol?
        
        init(repository: TaskListRepositoryProtocol,
             presenter: FirstViewPresenterProtocol){
            self.repository = repository
            self.presenter = presenter
        }
        
        func isValid(text: String) -> Bool {
            if (text.isEmpty) {
                return false
            }
            return true
        }
        
        func createTask(to text: String) {
            if isValid(text: text) {
                let task = Task(title: text)
                addTask(with: task)
                
                repository?.fetchTasks({ list in
                    self.presenter?.updateTaskList()
                })
            }
            else {
                let errorMessage = "Esse campo não pode estar vazio"
                presenter?.presentError(string: errorMessage)
            }
        }
        
        func addTask(with task: Task) {
            repository?.create(task: task)
        }
        
        func removeTask(task: Int) {
            repository?.removeTask(task: task)
        }
        
    }








