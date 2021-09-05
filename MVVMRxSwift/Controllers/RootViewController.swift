//
//  RootViewController.swift
//  MVVMRxSwift
//
//  Created by Donggeun Lee on 2021/09/05.
//

import UIKit
import RxSwift
import RxRelay

class RootViewController: UIViewController {
    
    // Mark: Properties
    let disposeBag = DisposeBag()
    let viewModel: RootViewModel
    
    private let articles = BehaviorRelay<[Article]>(value: [])
    var articlesObserver: Observable<[Article]> {
        return articles.asObservable()
    }
    
    // Mark: Lifecycles
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        fetchArticles()
        subscribe()
    }
    
    // Mark: Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
     
    // Mark: Helpers
    
    func fetchArticles() {
        self.viewModel.fetchArticles().subscribe(onNext: {articles in
            self.articles.accept(articles)
        }).disposed(by: disposeBag)
    }
    
    func subscribe() {
        self.articlesObserver.subscribe(onNext: { articles in
            //
        }).disposed(by: disposeBag)
    }

}
