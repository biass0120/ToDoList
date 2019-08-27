//
//  Router.swift
//  ListaDeTarefas
//
//  Created by bianca.dos.s.sobral on 14/08/19.
//  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
//


import Foundation
import UIKit

public class Router: NSObject {
        // Router responsavel por gerenciar telas do App
    let repository: TaskListRepositoryProtocol
    let navigationController: UINavigationController
        // possui o acesso ao repositorio e possui e o obj de navegacao entre telas a NavigationController
  
    public init(repository: TaskListRepositoryProtocol,
                navigationController: UINavigationController) {
    self.repository = repository
    self.navigationController = navigationController
        //inicializacao dos protocols
  }

    public func startFirst() {
        let firstController = FirstViewController(repository: self.repository)
        firstController.delegate = self
        navigationController.pushViewController(firstController, animated: true)
    }

    public func startSecond() {
        let secondController = SecondTableViewController(repository: self.repository)
        navigationController.pushViewController(secondController, animated: true)
    }
    
}

extension Router: FirstViewControllerDelegate {
    func didTouch() {
        startSecond()
    }
}



