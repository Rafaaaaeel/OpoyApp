//
//  TestViewController.swift
//  OpoyApp
//
//  Created by Rafael Oliveira on 14/04/22.
//

import UIKit

class TestViewController: UIViewController {

    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nenem"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupView()
    }
    


}

extension TestViewController: ViewControllerFunctions{
    func setupHierarchy() {
        view.backgroundColor = .red
    }
    
    func setupConstrants() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    
    
}
