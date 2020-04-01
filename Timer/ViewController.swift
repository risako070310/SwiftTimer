//
//  ViewController.swift
//  Timer
//
//  Created by 加藤りさ子 on 3/30/20.
//  Copyright © 2020 Risako Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time: Int = 0
    var viewMinute: Int = 0
    var viewSecond: Int = 0
    
    var timer: Timer!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var minuteButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(viewMinute) + ":" + String(viewSecond)
        startButton.setTitle("Start", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        minuteButton.setTitle("Minute", for: .normal)
        secondButton.setTitle("Second", for: .normal)
        minuteButton.layer.cornerRadius = 50
        minuteButton.layer.shadowOpacity = 0.4
        secondButton.layer.cornerRadius = 50
        secondButton.layer.shadowOpacity = 0.4
    }
    
    @objc func timerCount() {
        if (time == 0) {
            timeLabel.text = "Finish!!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.resetComand()
            }
        } else {
            time -= 1
            viewTime()
        }
    }
    
    @IBAction func start() {
        if(time >= 1) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func reset() {
        resetComand()
    }
    
    @IBAction func minute() {
        time += 60
        viewTime()
    }
    
    @IBAction func second() {
        time += 1
        viewTime()
    }
    @objc func resetComand() {
        if(timer == nil){
        } else {
            timer.invalidate()
        }
        time = 0
        viewMinute = 0
        viewSecond = 0
        timeLabel.text = String(viewMinute) + ":" + String(viewSecond)
    }
    @objc func viewTime(){
        viewMinute = time / 60
        viewSecond = time % 60
        timeLabel.text = String(viewMinute) + ":" + String(viewSecond)
    }
}
