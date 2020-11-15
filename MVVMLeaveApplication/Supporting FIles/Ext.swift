 

import Foundation
import UIKit


extension UIView
{
    func loadNib(nibName: String) -> UIView?
    {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}



extension UITableViewCell
{
   static func nib(ofName name: String) -> UINib
    {
    return UINib(nibName: name, bundle: nil)
    }
}


extension Date
{
    func dateString() -> String
    {
    let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
    return formatter.string(from: self)
    }
}
extension String
{
    func date() -> Date?
    {
    let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.date(from: self)
    }
}
