//
//  ViewController.swift
//  StopWatch
//
//  Created by Tatsuo Ikeda on 2018/02/09.
//  Copyright © 2018 Tatsuo Ikeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var startTime: TimeInterval? = nil
    var timer = Timer()
    var elapsedTime: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setEnableButton(start: true, stop: false, reset: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setEnableButton(start: Bool, stop: Bool, reset: Bool) {
        self.startButton.isEnabled = start
        self.stopButton.isEnabled = stop
        self.resetButton.isEnabled = reset
    }
    
    @objc func update() {
        if let stime = startTime {
            let t = Date.timeIntervalSinceReferenceDate - stime + self.elapsedTime
            
            let min = Int(t / 60)
            let sec = Int(t) % 60
            let msec = Int((t - Double(min * 60) - Double(sec)) * 100.0)
            
            self.timerLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
        }
    }

    @IBAction func startTimer(_ sender: Any) {
        setEnableButton(start: false, stop: true, reset: false)
        
        self.startTime = Date.timeIntervalSinceReferenceDate
        self.timer = Timer.scheduledTimer(timeInterval: 0.01,
                             target: self,
                             selector: #selector(self.update),
                             userInfo: nil,
                             repeats: true)
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        setEnableButton(start: true, stop: false, reset: true)
        
        if let stime = startTime {
            self.elapsedTime += Date.timeIntervalSinceReferenceDate - stime
        }
        self.timer.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        setEnableButton(start: true, stop: false, reset: false)
        
        self.startTime = nil
        self.elapsedTime = 0.0
        self.timerLabel.text = "00:00:00"
    }
}
