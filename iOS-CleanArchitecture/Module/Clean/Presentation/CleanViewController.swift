//
//  CleanViewController.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import UIKit

protocol CleanViewOutput: AnyObject {
    // MARK: Callback from Presenter
    func forPresenter(_ models: [CleanModel])
}

class CleanViewController: UIViewController {

    // MARK: Architecture properties
    
    var presenterInput: CleanPresenterInput!
    
    // MARK: View Life-Cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "add",
            style: .plain,
            target: self,
            action: #selector(add)
        )
        
        presenterInput.fromView()
    }
    
    // MARK: Other properties
    
    @IBOutlet weak var tableView: UITableView!
    private var items = [CleanModel]()

    // MARK: Other methods
    
    @objc
    private func add() {
        showTextFieldAlertViewController()
    }
    
    func showTextFieldAlertViewController() {
        let alert: UIAlertController = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Todo"
        let saveTitleAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) -> Void in
            guard let text = alert.textFields?.first?.text, !text.isEmpty else {
                return
            }
            self.createTodo(text)
            self.presenterInput.fromView()
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cencel", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(saveTitleAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func createTodo(_ title: String) {
        presenterInput.createTodo(title)
    }
    
}

// MARK: - CleanViewOutput

extension CleanViewController: CleanViewOutput {
    func forPresenter(_ models: [CleanModel]) {
        items = models
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension CleanViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
}
