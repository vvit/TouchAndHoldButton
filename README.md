# TouchAndHoldButton

Swift version of NBTouchAndHoldButton https://github.com/balazsnemeth/NBTouchAndHoldButton

Touch and hold a button, so its action will be called repeatedly based on interval you set.
Good for the backspace button on a custom keyboard:
    
    let backspaceButton: TouchAndHoldButton = TouchAndHoldButton(frame: myFrame)
    backspaceButton.setTitle("Backspace", forState: .Normal)
    backspaceButton.addTarget(self, action: "backspaceAction:", timeInterval: 0.15)
    self.view.addSubview(backspaceButton)

Happy swifting!

