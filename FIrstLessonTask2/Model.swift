//
//  Model.swift
//  FIrstLessonTask2
//
//  Created by Xasan Xasanov on 07/06/23.
//

import Foundation
struct GithubUser: Decodable {
    var login:String
    var id:Int
    var avatar_url:String
    var following:Int
    var followers:Int
}
