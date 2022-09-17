//
//  SecondViewController.swift
//  BootcampTaskk2
//
//  Created by Mac on 16.09.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageViewSVC: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var information: Information?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewSVC.image = UIImage(named: information?.image ?? "")
        descriptionLabel.text = information?.description

        let backButton = UIBarButtonItem(title: "< Back", style: .done, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    @IBAction func showMoreButton(_ sender: Any) {
        
        let thirdVC = ThirdViewController()
        
        thirdVC.webKitUrl = information?.url
        
        present(thirdVC, animated: true)
        
    }
}

