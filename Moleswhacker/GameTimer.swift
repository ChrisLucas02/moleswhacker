//
//  GameTimer.swift
//  MolesWhacker
//
//  Created by Chris Lucas on 30.09.21.
//

import Foundation

class GameTimer {
    
    // MARK: - Properties
    
    var timer: Timer?
    var countDownLeft: Int
    var delegate: OnGameTimerEvent?
    var isPaused: Bool
    
    // MARK: - Singleton pattern
    // Use the shared property to access the timer functions
    // Usage: GameTimer.shared.some_func()
    
    static let shared = GameTimer()
    
    private init() {
        self.countDownLeft = 10
        self.isPaused = false
    }
    
    
    // MARK: - Public and private methods
    
    func pauseResume() {
        if isPaused {
            start()
        } else {
            self.timer?.invalidate();
        }
    }
    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if !self.isPaused {
                self.countDownLeft -= 1
                self.delegate?.onTick(tick: self.countDownLeft)
                if self.countDownLeft <= 0 {
                    timer.invalidate()
                    self.delegate?.onFinished()
                    self.countDownLeft = 10
                }
            }
        })
    }
}

protocol OnGameTimerEvent {
    func onTick(tick:Int) -> Void
    
    func onFinished() -> Void
}


