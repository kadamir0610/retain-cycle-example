//
//  TimerViewController.swift
//  retain cycle example
//
//  Created by admin on 25.03.2022.
//

import UIKit

class TimerViewController: UIViewController {
    
    var timer: Timer!
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startTimer(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.counter += 1
            print ("Counter: \(self.counter)")
        }
    }
    
    @IBAction func toNewScreen( sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "newVC")
        let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first!
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.4, options: .transitionCrossDissolve, animations:
            nil, completion: nil)
    }
}
