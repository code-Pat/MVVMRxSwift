//
//  Article.swift
//  MVVMRxSwift
//
//  Created by Donggeun Lee on 2021/09/05.
//

import Foundation

struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// json 형식의 데이터를 swift로 받아주는 역할
struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
}
