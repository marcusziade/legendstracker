//
//  News.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 28.9.2022.
//

import Foundation

struct News: Codable, Identifiable {
    var id: String { UUID().uuidString }
    
    let title: String
    let link: URL
    let img: URL
    let shortDesc: String
    
    static var mocks: [News] {
        (0...10).map { index -> News in
            News(
                title: "News title #\(index + 1)",
                link: URL(string: "https://apple.com")!,
                img: URL(string: "https://media.contentapi.ea.com/content/dam/apex-legends/common/apex-hunted-s14-youtube-2560x1440-nologo.jpg.adapt.crop16x9.431p.jpg")!,
                shortDesc: "Short description for news article #\(index + 1)"
            )
        }
    }
}
