//
//  ArticleService.swift
//  MVVMRxSwift
//
//  Created by Donggeun Lee on 2021/09/05.
//

import Foundation
import Alamofire
import RxSwift

protocol ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]>
}

class ArticleService: ArticleServiceProtocol {
    
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            
            self.fetchNews { (error, articles) in
                if let error = error {
                    observer.onError(error)
                }
                if let articles = articles {
                    observer.onNext(articles)
                }
                observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
    
    private func fetchNews(completion: @escaping((Error?, [Article]?) -> Void)) {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&from=2021-08-08&sortBy=publishedAt&apiKey=a79205fc0a644547bd85503830a374c8"
        
        guard let url = URL(string: urlString) else { return completion(NSError(domain: "patlee997", code: 404, userInfo: nil), nil)}
        
        // AlamoFire
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: ArticleResponse.self) { response in
            if let error = response.error {
                return completion(error, nil)
            }
            if let articles = response.value?.articles {
                return completion(nil, articles)
            }
        
        }
    }
}
