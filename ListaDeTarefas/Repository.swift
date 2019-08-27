    //
    //  Repositoty.swift
    //  ListaDeTarefas
    //
    //  Created by bianca.dos.s.sobral on 14/08/19.
    //  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
    //

    import Foundation

    public protocol TaskListRepositoryProtocol {
      func fetchTasks(_ completed: @escaping ([Task]) -> Void)
      func create(task: Task)
      func removeTask(task: Int)
    }


    public class ListaTaferasRepository: NSObject, TaskListRepositoryProtocol {
      
      var taskList: [Task] = []
      
      override init() {}
      
        public func fetchTasks(_ completed: @escaping ([Task]) -> Void) {
            completed(taskList)
      }
      
        public func create(task: Task) {
            taskList.append(task)
      }
        
        public func removeTask(task: Int) {
            taskList.remove(at: task)
        }
        
       }

    public struct Task {
      let title: String
      
    }


