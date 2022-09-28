//
//  News.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import Foundation

struct News: Codable {
    /*
     {
     "title": "An update on iron sights ",
     "link": "https:\/\/www.ea.com\/games\/apex-legends\/news\/iron-sight-update",
     "img": "https:\/\/media.contentapi.ea.com\/content\/dam\/apex-legends\/common\/apex-hunted-s14-youtube-2560x1440-nologo.jpg.adapt.crop16x9.431p.jpg",
     "short_desc": " Learn how Apex Legends\u2122 will be improving the competitive integrity of iron sights now and in the future."
     }
     */
    
    let title: String
    let link: URL
    let img: URL
    let shortDesc: String
}
