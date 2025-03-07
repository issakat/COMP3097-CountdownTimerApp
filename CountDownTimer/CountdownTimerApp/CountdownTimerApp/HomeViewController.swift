//
//  HomeViewController.swift
//  CountdownTimerApp
//
//  Created by Kate Labis on 2025-03-06.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var timerTextField: UITextField!
    @IBOutlet weak var countdownLabel: UILabel!
    
    var timer: Timer?
    var totalTime: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownLabel.text = "00:00:00"
    }
    
    @IBAction func startTimer (_ sender: UIButton) {
        guard let timeString = timerTextField.text, let time = timeString.toSeconds() else {return}
        totalTime = time
        startCountdown()
    }
    
    @IBAction func pauseTimer(_ sender: UIButton){
        timer?.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: UIButton){
        timer?.invalidate()
        countdownLabel.text = "00:00:00"
        timerTextField.text = ""
    }
    
    func startCountdown() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func updateCountdown() {
        if totalTime > 0 {
            totalTime -= 1
            countdownLabel.text = totalTime.toTimeString()
        } else {
            timer?.invalidate()
            performSegue(withIdentifier: "toComplete", sender: nil)
        }
    }
}
