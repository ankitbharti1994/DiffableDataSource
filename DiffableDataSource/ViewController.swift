//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by ankit bharti on 06/10/19.
//  Copyright © 2019 ankit kumar bharti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let reuseIdentifier = "Cell"
    private lazy var dataSource = makeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureContacts()
    }

    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: TableViewCell.self), bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    private func configureContacts() {
        let ankit = Contact(name: "Ankit Bharti", email: "ankitbharti1994@gmail.com")
        let vinit = Contact(name: "Vinit Bharti", email: "vinitbharti1994@gmail.com")
        let navneet = Contact(name: "Navneet Kumar", email: "navneet1994@gmail.com")
        
        let kailash = Contact(name: "Kailash Kumar", email: "kailash1994@gmail.com")


        let contactList = ContactList(friends: [kailash], family: [ankit, vinit, navneet], coworkers: [])
        
        self.update(with: contactList)
    }
}

extension ViewController {
    private func makeDataSource() -> UITableViewDiffableDataSource<Section, Contact> {
        let cellIdentifier = reuseIdentifier
        
        return UITableViewDiffableDataSource(tableView: self.tableView) { (tableView, indexPath, contact) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell
            
            cell?.configure(from: contact)
            
            return cell
        }
    }
}

extension ViewController {
    private func update(with list: ContactList, animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Contact>()
        snapshot.appendSections(Section.allCases)
        
        snapshot.appendItems(list.coworkers, toSection: .coworkers)
        snapshot.appendItems(list.family, toSection: .family)
        snapshot.appendItems(list.friends, toSection: .friends)
        
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
    
    private func remove(contact: Contact, animate: Bool = true) {
        var snapshot = dataSource.snapshot()
        snapshot.deleteItems([contact])
        
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

extension ViewController {
    enum Section: CaseIterable {
        case friends
        case family
        case coworkers
    }
}
