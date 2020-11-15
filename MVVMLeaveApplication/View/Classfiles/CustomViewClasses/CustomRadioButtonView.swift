 

import Foundation
import UIKit


@IBDesignable
class CustomRadioButtonView: UIView {
    @IBOutlet var radioBtns: [RadioButton]!
    var titles: [String] = []
    {
        didSet
        {
        configureBtns()
        }
    }
    var del: RadioBtnDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    func loadNib()
    {
    guard let vie = self.loadNib(nibName: "RadioButtonView") else{return}
    vie.frame = self.bounds
    vie.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.addSubview(vie)
    }
    func resetBtns()
    {
    radioBtns.forEach { $0.isselected = false
    }
    }
    func configureBtns()
    {
    radioBtns[0].isselected = true
    radioBtns.forEach{
        $0.alternateButton = radioBtns
        $0.setTitleColor(.black, for: .normal)
        $0.setTitleColor(.gray, for: .selected)
    }
    zip(radioBtns, titles).forEach { (btn, title) in
        btn.setTitle(title, for: .normal)
        btn.setTitle(title, for: .selected)
    }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    @IBAction func radioBtnTapped(_ sender: RadioButton)
    {
    guard let lbl = sender.titleLabel, let text = lbl.text else {return}
    del?.updateCauseTitle(text)
    }
}
