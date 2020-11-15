 

import Foundation
import UIKit

protocol LeaveForm {
    var leaveType: LeaveType {get}
    var formitems: [FormItem]{ get }
    var updationCallBack: (UpdateType, String?) -> Void { get set}
}
protocol LeaveApplication: class {
    func reloadViews()
}

protocol ConfigurableCell {
    var rowHeight: CGFloat {get}
    static var reuseId: String {get}
    func configure(withData data: FormItem)
}

protocol FormItem {
    var title: String {get}
    var value: String {get set}
    var indexPath: IndexPath {get}
    var isSelected: Bool {get set}
    var properties: FormItemUIProperties {get}
}
protocol FormItemUpdatable {
    var updationCallBack: (String) -> Void { get }
}
protocol OptionsFormItem: FormItem {
    associatedtype Option
    var options : [Option] {get}
}
protocol RadioBtnDelegate {
    func updateCauseTitle(_ title: String)
}
