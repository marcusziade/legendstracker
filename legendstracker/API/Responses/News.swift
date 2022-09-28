//
//  News.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import Foundation

struct News: Codable {    
    let title: String
    let link: URL
    let img: URL
    let shortDesc: String
}
