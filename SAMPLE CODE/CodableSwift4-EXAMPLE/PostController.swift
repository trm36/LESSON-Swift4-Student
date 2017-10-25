//
//  PostController.swift
//  CodableSwift4-EXAMPLE
//
//  Created by Taylor Mott on 25-Oct-17.
//  Copyright © 2017 Mott Applications. All rights reserved.
//

import Foundation

import Foundation

class PostController {
    
    static func fetchPosts(_ completion: @escaping ([Post]) -> Void) {
        
        var posts = [Post]()
        
        guard let postsURL = URL(string: "https://jsonplaceholder.typicode.com/posts") else { completion(posts); return }
        
        let dataTask = URLSession.shared.dataTask(with: postsURL) { (data: Data?, urlResponse: URLResponse?, error: Error?) in
            
            defer { completion(posts) }
            guard let data = data else { return }
            
            //SWIFT 4
            let decoder = JSONDecoder()
            guard let decodedPosts = try? decoder.decode([Post].self, from: data) else { return }
            posts = decodedPosts
            
            /* //SWIFT 3
               // *WON'T COMPILE - Post.init(dictionary:) isn't defined* */
//             var newPosts = [Post]()
//             guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []), let jsonArray = jsonObject as? [[String : Any]] else { return }
//             for dictionary in jsonArray {
//             if let newPost = Post(dictionary: dictionary) {
//             newPosts.append(newPost)
//             }
//             }
//             posts = newPosts
        }
        
        dataTask.resume()
    }
    
}
