//
//  Post.swift
//  CodableSwift4-EXAMPLE
//
//  Created by Taylor Mott on 25-Oct-17.
//  Copyright © 2017 Mott Applications. All rights reserved.
//

import Foundation

struct Post: Codable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
}
