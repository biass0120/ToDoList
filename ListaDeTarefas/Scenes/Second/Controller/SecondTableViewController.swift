//
//  SeconsTableViewController.swift
//  ListaDeTarefas
//
//  Created by bianca.dos.s.sobral on 13/08/19.
//  Copyright © 2019 bianca.dos.s.sobral. All rights reserved.
//

import UIKit

public protocol SecondTableViewControllerDelegate {
    func didTouch()
}

protocol SecondTableViewControllerProtocol {

    var interactor: SecondTableViewInteractorProtocol? {get set}
    var repository: TaskListRepositoryProtocol {get set}

    func updateList(list: [Task])
    func removeTask(task: Int)
}

class SecondTableViewController: UITableViewController, SecondTableViewControllerProtocol {


    var interactor: SecondTableViewInteractorProtocol?
    var repository: TaskListRepositoryProtocol

    var delegate: SecondTableViewControllerDelegate?

    @IBOutlet var tableViewController: UITableView!

    var taskList: [Task] = [] {
        didSet {
        setupUI()
        }
    }

    // falta inicializar o interactor
    init(repository: TaskListRepositoryProtocol) {
    self.repository = repository
    super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: "MyTableViewCell", bundle: .main),
    forCellReuseIdentifier: "MyTableViewCell")
    setupUI()
    loadList()
    }

    func updateList(list: [Task]) {
        self.taskList = list
        tableView.reloadData()
    }

    func setupUI() {
        let presenter = SecondViewPresenter(view: self)
        interactor = SecondTableViewInteractor (presenter: presenter, repository: self.repository)
    }

    func loadList() {
        interactor?.loadList()
    }

    func removeTask(task: Int) {
        interactor?.cleanTask(task: task)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as? MyTableViewCell {

        let task = self.taskList[indexPath.row]
        cell.titleLabel.text = task.title

        return cell
        }
        return UITableViewCell()
        }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            removeTask(task: indexPath.row)
            tableView.reloadData()
        }
    }

    }

    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    }

