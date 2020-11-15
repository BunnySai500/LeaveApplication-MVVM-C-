 
import Foundation


typealias InputItem = FormItem & FormItemUpdatable
typealias OptionsItem = InputItem & OptionsFormItem
typealias DisplayItem = FormItem & FormInputItem

class FormInputItem: FormDisplayItem, FormItemUpdatable {
    var updationCallBack: (String) -> Void = {_ in}
     
    var placeholder: String = ""
    
    convenience init(_ placeholder: String,_ title: String) {
        self.init(title)
        self.placeholder = placeholder
    }
}
class FormOptionsItem<T>: FormInputItem, OptionsFormItem {
    typealias Option = T
    
    var options: [T] = []
    
    convenience init(_ options: [T],_ title: String) {
        self.init(title)
        self.options = options
    }
}

class FormDisplayItem: FormItem{
    var isSelected: Bool = false
    var title: String = ""
    var properties = FormItemUIProperties()
    var value: String = ""
    
    var indexPath: IndexPath = IndexPath()
    
    init(_ title: String) {
        self.title = title
    }
     
}
