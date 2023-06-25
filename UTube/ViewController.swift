//
//  ViewController.swift
//  UTube
//
//  Created by Minh Tan Vu on 22/06/2023.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getVideo()
    }


}

