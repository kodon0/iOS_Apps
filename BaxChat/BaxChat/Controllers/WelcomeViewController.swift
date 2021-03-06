//
//  WelcomeViewController.swift
//  BaxChat
//
//  Created by Kieran O'Donnell on 02/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
  
//    Hiding and unhiding navabrs fore where its wanted
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       Animated text with incremental delivery using timer
//        titleLabel.text = ""
//        var charIndex = 0.0
//        let titleText = K.appName
//        for letter in titleText{
//            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
       
        titleLabel.text = K.appName
    }
    

}

