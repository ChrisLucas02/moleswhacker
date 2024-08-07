//
//  ViewController.swift
//  Moleswhacker
//
//  Created by Chris Lucas on 30.09.21.
//

import UIKit
import os

class ViewController: UIViewController, OnGameTimerEvent {

    

    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var mole_1: UIButton!
    @IBOutlet weak var mole_2: UIButton!
    @IBOutlet weak var mole_3: UIButton!
    @IBOutlet weak var mole_4: UIButton!
    @IBOutlet weak var mole_5: UIButton!
    @IBOutlet weak var mole_6: UIButton!
    @IBOutlet weak var mole_7: UIButton!
    @IBOutlet weak var mole_8: UIButton!
    @IBOutlet weak var mole_9: UIButton!
    @IBOutlet weak var mole_10: UIButton!
    @IBOutlet weak var mole_11: UIButton!
    @IBOutlet weak var mole_12: UIButton!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var time: UILabel!
    
    var allButtons = [UIButton]()
    var curr_mole = 0
    var curr_score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        os_log("moles_didLoad")
        // Do any additional setup after loading the view.
        allButtons.append(mole_1)
        allButtons.append(mole_2)
        allButtons.append(mole_3)
        allButtons.append(mole_4)
        allButtons.append(mole_5)
        allButtons.append(mole_6)
        allButtons.append(mole_7)
        allButtons.append(mole_8)
        allButtons.append(mole_9)
        allButtons.append(mole_10)
        allButtons.append(mole_11)
        allButtons.append(mole_12)
        GameTimer.shared.delegate = self
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        os_log("moles_didDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        os_log("moles_didAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        os_log("moles_willDisappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        os_log("moles_willAppear")
    }
    
    @IBAction func start(_ sender: Any) {
        reset_ui(action: true)
        curr_mole = Int.random(in: 0...11)
        allButtons[curr_mole].isHidden = false
        start.isEnabled = false
        time.text = String(GameTimer.shared.countDownLeft)
        curr_score = 0
        score.text = String(curr_score)
        GameTimer.shared.start()
    }
    
    @IBAction func hit(_ sender: Any) {
        allButtons[curr_mole].isHidden = true
        let prev_mole = curr_mole
        curr_mole = Int.random(in: 0...11)
        while prev_mole == curr_mole {
            curr_mole = Int.random(in: 0...11)
        }
        allButtons[curr_mole].isHidden = false
        curr_score = curr_score + 1
        score.text = String(curr_score)
    }
    
    func onTick(tick: Int) {
        GameTimer.shared.countDownLeft = tick
        time.text = String(tick)
    }
    
    func onFinished() {
        reset_ui(action: false)
    }
    
    func reset_ui(action:Bool) {
        mole_1.isHidden = action
        mole_2.isHidden = action
        mole_3.isHidden = action
        mole_4.isHidden = action
        mole_5.isHidden = action
        mole_6.isHidden = action
        mole_7.isHidden = action
        mole_8.isHidden = action
        mole_9.isHidden = action
        mole_10.isHidden = action
        mole_11.isHidden = action
        mole_12.isHidden = action
        mole_1.isEnabled = action
        mole_2.isEnabled = action
        mole_3.isEnabled = action
        mole_4.isEnabled = action
        mole_5.isEnabled = action
        mole_6.isEnabled = action
        mole_7.isEnabled = action
        mole_8.isEnabled = action
        mole_9.isEnabled = action
        mole_10.isEnabled = action
        mole_11.isEnabled = action
        mole_12.isEnabled = action
        start.isEnabled = !action
    }
    
}

