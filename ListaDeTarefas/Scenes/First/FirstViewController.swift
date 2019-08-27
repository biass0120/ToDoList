    //
    //  ViewController.swift
    //  ListaDeTarefas
    //
    //  Created by bianca.dos.s.sobral on 13/08/19.
    //  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
    //

    import UIKit

    protocol FirstViewControllerDelegate {
        func didTouch()
    }

    protocol FirstViewControllerProtocol {
        var interactor: FirstInteractorViewProtocol? { get set }
        
        func navigationToSecondScreen()
        func presentError(error: String)
    }
    
    class FirstViewController: UIViewController, FirstViewControllerProtocol {
        
        var interactor: FirstInteractorViewProtocol?
        var repository: TaskListRepositoryProtocol
        var delegate: FirstViewControllerDelegate?
      
        init(repository: TaskListRepositoryProtocol) {
            self.repository = repository
            super.init(nibName: nil, bundle: nil)
        }
      
      required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
      
      // Metodo que instancia a presenter com a view e a interactor com o repositorio
        
      func setupUI() {
        let presenter = FirstViewPresenter(view: self)
        interactor = FirstViewInteractor(repository: repository, presenter: presenter)
      }
      

      @IBOutlet weak var textFieldInput: UITextField!
      
      @IBAction func addTaskButton(_ sender: UIButton) {
          interactor?.createTask(to: textFieldInput.text ?? "")
      }
        
      override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        }
        
        func navigationToSecondScreen() {
            delegate?.didTouch()
        }
        
        func presentError(error: String) {
            showAlert(text: error)
        }
        
        
        func showAlert(text: String) {
            let alert = UIAlertController(title: "ATENÇÃO", message: text , preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        
    }


