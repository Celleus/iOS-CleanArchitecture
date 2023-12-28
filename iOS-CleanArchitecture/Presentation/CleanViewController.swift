//
//  CleanViewController.swift
//  iOS-CleanArchitecture
//
//  Created by Celleus on 2023/12/27.
//

import UIKit

protocol CleanViewOutput: AnyObject {
    // MARK: Callback from Presenter
    func forPresenter()
}

class CleanViewController: UIViewController {

    // MARK: Architecture properties
    
    var presenterInput: CleanPresenterInput!
    
    // MARK: View Life-Cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Other properties
    
    @IBOutlet weak var tableView: UITableView!
    private var items = [Todo]()

    // MARK: Other methods
    
    func didTapButton() {
        presenterInput.fromView()
    }
}

// MARK: - CleanViewOutput

extension CleanViewController: CleanViewOutput {
    func forPresenter() {
        
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
