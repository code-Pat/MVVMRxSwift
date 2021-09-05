//
//  ArticleViewModel.swift
//  MVVMRxSwift
//
//  Created by Donggeun Lee on 2021/09/05.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
    
    var imageURL: String? {
        return article.urlToImage
    }
    
    var title: String? {
        return article.title
    }
    
    var description: String? {
        return article.description
    }
    
    init(article: Article) {
        self.article = article
    }
}
