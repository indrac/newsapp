//
//  Constants.swift
//  MandiriNews
//
//  Created by Indra Cahyadi on 25/06/20.
//  Copyright © 2020 Indra Cahyadi. All rights reserved.
//

import Foundation


struct Constants {
    
    private static let Domain = "http://newsapi.org"
    private static let Route = "/v2/everything"
    private static let BaseURL =  Domain + Route
    
    static var BaseUrl:String{
        return BaseURL
    }
        
    static let Query = "q"
    static let Country = "country"
    static let From = "from"
    static let ApiKey = "apiKey"
    static let News = "News"
    static let PrivateKey = "fbb56ca680824b52bd7215d8105e86f6"
    
    static let Berita = "Berita"
    static let Cancel = "Cancel"
    static let Category = "Category"
    static let Categories = ["Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
    static let Search = "Search..."
}

