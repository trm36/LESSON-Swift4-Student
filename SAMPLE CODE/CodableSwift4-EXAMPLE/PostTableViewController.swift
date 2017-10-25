//
//  PostTableViewController.swift
//  CodableSwift4-EXAMPLE
//
//  Created by Taylor Mott on 25-Oct-17.
//  Copyright © 2017 Mott Applications. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    var posts: [Post] = []
    
    // MARK: - Bar Button Methods
    @IBAction func refreshButtonTapped() {
        PostController.fetchPosts { (newPosts: [Post]) in
            self.posts = newPosts
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        
        let post = posts[indexPath.row]
        
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        
        return cell
    }
    
}
