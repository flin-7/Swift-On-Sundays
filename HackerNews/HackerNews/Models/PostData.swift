//
//  PostData.swift
//  HackerNews
//
//  Created by Felix Lin on 11/22/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
