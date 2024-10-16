//
//  ProfileViewController.swift
//  WhatAnApp
//
//  Created by Cassie on 2024/10/15.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileCellIdentifier = "ProfileMainTableViewCell"
    private let profileBaseCellIdentifier = "ProfileBaseTableViewCell"
    
    private var identifiers = ["Avatar", "Messages", "Help", "Logout"]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: profileCellIdentifier, bundle: nil), forCellReuseIdentifier: profileCellIdentifier)
            tableView.register(UINib(nibName: profileBaseCellIdentifier, bundle: nil), forCellReuseIdentifier: profileBaseCellIdentifier)
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return identifiers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: ProfileMainTableViewCell = tableView.dequeueReusableCell(withIdentifier: profileCellIdentifier) as! ProfileMainTableViewCell
            cell.person = createPerson()
            cell.preservesSuperviewLayoutMargins = false
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }

        let cell: ProfileBaseTableViewCell = tableView.dequeueReusableCell(withIdentifier: profileBaseCellIdentifier) as! ProfileBaseTableViewCell
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.identifier = identifiers[indexPath.row]
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 100.0 : 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _ = tableView.cellForRow(at: indexPath) as? ProfileMainTableViewCell {
            print("clicked avater")
        }
        else if let cell = tableView.cellForRow(at: indexPath) as? ProfileBaseTableViewCell {
            tableView.deselectRow(at: indexPath, animated: true)
            switch cell.identifier {
            case "Logout":
                navigationController?.popToRootViewController(animated: true)
            default:
                break
            }
        }
    }
}

private extension ProfileViewController {
    
    func createPerson() -> Person {
        let person = Person()
        person.name = "Leona"
        person.email = "Leona123@163.com"
        return person
    }
    
}
