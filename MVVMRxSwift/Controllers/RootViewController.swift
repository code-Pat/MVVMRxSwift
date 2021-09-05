//
//  RootViewController.swift
//  MVVMRxSwift
//
//  Created by Donggeun Lee on 2021/09/05.
//

import UIKit

class RootViewController: UIViewController {
    
    // Mark: Properties
    
    // Mark: Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }
    
    // Mark: Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
    }

}
