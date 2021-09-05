//
//  RootViewModel.swift
//  MVVMRxSwift
//
//  Created by Donggeun Lee on 2021/09/05.
//

import Foundation
import RxSwift

final class RootViewModel {
    let title = "My News"
    
    private let articleService: ArticleServiceProtocol
    
    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
    }
    
    func fetchArticles() -> Observable<[ArticleViewModel]> {
        articleService.fetchNews().map { $0 .map { ArticleViewModel(article: $0) } }
    }
}
