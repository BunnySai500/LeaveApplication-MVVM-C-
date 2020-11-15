 

import Foundation
import UIKit


@IBDesignable
class CustomCellView: UIView {
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var valueLbl: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    private func configureView()
    {
        guard let vie = self.loadNib(nibName: "CustomCellView") else{return}
        vie.frame = self.bounds
        vie.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(vie)
    }
}




