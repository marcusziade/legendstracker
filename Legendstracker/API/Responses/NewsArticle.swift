//
//  NewsArticle.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//
import Foundation

struct NewsArticle: Codable, Identifiable {
    var id: String { UUID().uuidString }
    
    let title: String
    let link: URL
    let img: URL
    let shortDesc: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case link = "link"
        case img = "img"
        case shortDesc = "short_desc"
    }
}
