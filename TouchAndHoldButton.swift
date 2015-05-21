//
//  TouchAndHoldButton.swift
//  Kharkiv
//
//  Created by Vitaly Viktorovsky on 5/21/15.
//  Copyright (c) 2015 SoftDesigner. All rights reserved.
//

import UIKit

class TouchAndHoldButton: UIButton {
    private var holdTimer: NSTimer?
    private var timeInterval: NSTimeInterval!
    private weak var target: AnyObject!
    private var action: Selector!

    func addTarget(target: AnyObject, action: Selector, timeInterval: NSTimeInterval) {
        self.target = target
        self.action = action
        self.timeInterval = timeInterval
        self.addTarget(self, action: "sourceTouchUp:", forControlEvents: .TouchUpInside)
        self.addTarget(self, action: "sourceTouchUp:", forControlEvents: .TouchUpOutside)
        self.addTarget(self, action: "sourceTouchDown:", forControlEvents: .TouchDown)
    }

    func sourceTouchUp(sender: UIButton) {
        if holdTimer != nil {
            holdTimer!.invalidate()
            holdTimer = nil
        }
    }

    func sourceTouchDown(sender: UIButton) {
        holdTimer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: target, selector: action, userInfo: nil, repeats: true)
        holdTimer!.fire()
    }
}
