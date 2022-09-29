//
//  ArticleRow.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Kingfisher
import SwiftUI

struct ArticleRow: View {
    
    let article: News
    
    var body: some View {
        VStack(spacing: 8) {
            
            KFImage(article.img)
                .placeholder { ProgressView() }
                .resizable()
                .scaledToFit()
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.shortDesc)
                        .font(.caption)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
        }
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(article: News.mocks.first!)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
