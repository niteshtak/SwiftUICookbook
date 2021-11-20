//
//  ListData.swift
//  SwiftUIDS
//
//  Created by Nitesh Tak on 20/11/21.
//

import Foundation

struct UserDetail: Decodable {
    var page: Int
    var data: [User]
}

struct User: Decodable {
    var id:Int
    var email: String
    var first_name: String
    var last_name:String
    var avatar:String
}
