//
//  ViewController.swift
//  Lantern
//
//  Created by Алексей Жималовский on 09.11.2020.
//

import UIKit

var screenColor = 0

class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    fileprivate func updateUi() {
        if screenColor == 0 {
       view.backgroundColor = .white
        } else if screenColor == 1 {
            view.backgroundColor = .blue
        } else if screenColor == 2 {
            view.backgroundColor = .red
        } else if screenColor == 3 {
            view.backgroundColor = .cyan
        } else if screenColor == 4 {
            view.backgroundColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        screenColor += 1
        updateUi()
        if screenColor >= 4 {
       screenColor = -1
    }
 
}
}
