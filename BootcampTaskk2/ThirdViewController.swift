//
//  ThirdViewController.swift
//  BootcampTaskk2
//
//  Created by Mac on 17.09.2022.
//

import UIKit
import WebKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var webKitView: WKWebView!
    
    var webKitUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: webKitUrl ?? "")!
        
        webKitView.load(URLRequest(url: url))
        
        

    }
}
