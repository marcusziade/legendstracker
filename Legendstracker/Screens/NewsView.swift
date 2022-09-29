//
//  NewsView.swift
//  Legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var model: NewsVM
    
    var body: some View {
        switch model.state {
            
        case .loading:
            ProgressView()
            
        case .error(message: let errorMessage):
            Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
            
        case .result(news: let articles):
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        ForEach(articles) { article in
                            ArticleRow(article: article)
                                .onTapGesture { model.showSafari = true }
                                .sheet(isPresented: $model.showSafari) { SafariView(url: article.link) }
                        }
                    }
                }
                .refreshable { await model.refresh() }
                .navigationTitle("News")
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(model: NewsVM.mock)
            .preferredColorScheme(.dark)
    }
}
