//
//  ViewController.swift
//  audioTest
//
//  Created by Cheer on 2017/5/25.
//  Copyright © 2017年 joekoe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(RecordingNode(frame: view.frame))
    }
}

