//
//  aboutViewController.swift
//  BullsEye
//
//  Created by Mustafa Alsoffi on 31/10/2018.
//  Copyright © 2018 Mustafa Alsoffi. All rights reserved.
//

import UIKit
import WebKit

class aboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
    super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL (fileURLWithPath: htmlPath)
            let request = URLRequest (url: url)
            webView.load(request)
        
        }
    
     
    }
    @IBAction func closeTapped(){
        dismiss(animated: true, completion: nil)
        
    }

  
}
