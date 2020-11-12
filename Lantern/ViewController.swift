//
//  ViewController.swift
//  Lantern
//
//  Created by Алексей Жималовский on 09.11.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var screenColor = 0
    var isLightOn = true
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    /// Функция определяет цвет экрана в зависимости от значения переменной.
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
    /// Функция включает физичиский фонарик на телефоне после касания
    func updateView() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if let dev = device, dev.hasTorch {
            do {
                try dev.lockForConfiguration()
                dev.torchMode = isLightOn ? .on : .off
                dev.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        screenColor += 1
        updateUi()
        updateView()
        if screenColor >= 4 {
            screenColor = -1
        }
        
    }
}
