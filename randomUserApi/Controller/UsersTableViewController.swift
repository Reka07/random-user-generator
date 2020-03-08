//
//  UsersTableViewController.swift
//  randomUserApi
//
//  Created by Döbrönte Réka on 2020. 03. 03..
//  Copyright © 2020. dobrontereka. All rights reserved.
//

import UIKit
import Alamofire

class UsersTableViewController: UITableViewController {
    
    var items: [Result] = []
    var selectedUser: Displayable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        
        fetchUsers()
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        fetchUsers()
        sender.endRefreshing()
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UsersTableViewCell
        
        let user = items[indexPath.row]
        
        cell.setUsers(user: user)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedUser = items[indexPath.row]
        return indexPath
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? DetailViewController else {
            return
        }
        destinationVC.data = selectedUser
    }
}

//MARK: - Alamofire
extension UsersTableViewController {
    
    func fetchUsers() {
        let request = AF.request("https://randomuser.me/api/?results=5&noinfo").validate()
        
        request.responseDecodable(of: Response.self) { (response) in
            guard let users = response.value else { return }
            self.items = users.results
            self.tableView.reloadData()
        }
    }
}
