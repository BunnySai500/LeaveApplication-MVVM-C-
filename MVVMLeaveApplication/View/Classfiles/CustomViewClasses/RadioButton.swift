 

import Foundation
import UIKit

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
        
    }
    
    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isselected = true
            
            for aButton:RadioButton in alternateButton! {
                if aButton != self
                {
                aButton.isselected = false
                }
            }
        } else {
            toggleButton()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton() {
        self.isselected = !isselected
    }
    
     var isselected: Bool = false{
        didSet {
            if isselected {
                self.backgroundColor = .darkGray
                self.setTitleColor(.white, for: .normal)
            } else {
                self.backgroundColor = .white
                self.setTitleColor(.black, for: .normal)
            }
        }
    }
}
