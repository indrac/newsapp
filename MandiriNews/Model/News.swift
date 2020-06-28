//
//  News.swift
//  MandiriNews
//
//  Created by Indra Cahyadi on 24/06/20.
//  Copyright © 2020 Indra Cahyadi. All rights reserved.
//

import Foundation


class News: Decodable {
    var status: String
    var totalResults: Int
    var articles:[Articles]
}


class Articles: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
}
