 

import Foundation
import UIKit

class PickerInputCell: UITableViewCell, ConfigurableCell, UIPickerViewDelegate, UIPickerViewDataSource {
    static var reuseId = "pickerReuseId"
    var pickerInputItem: FormOptionsItem<String>?
    var rowHeight: CGFloat = 150
     
    @IBOutlet weak var baseView: CustomCellView!
    
    @IBOutlet weak var inputPicker: UIPickerView!
    func configure(withData data: FormItem) {
        inputPicker.delegate = self
        inputPicker.dataSource = self
        guard let item = data as? FormOptionsItem<String> else {
            return
        }
        self.pickerInputItem = item
        self.baseView.titleLbl.text = item.title
        self.baseView.valueLbl.text = item.value
        inputPicker.reloadAllComponents()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let item = pickerInputItem else{return 0}
        return item.options.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let item = pickerInputItem else{return ""}
        return item.options[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let item = pickerInputItem  {
        item.updationCallBack(item.options[row])
        }
    }
}



class DatePickerInputCell: UITableViewCell, ConfigurableCell, UIPickerViewDelegate {
    var rowHeight: CGFloat = 50
    
   static var reuseId: String = "datepickerReuseId"
    
    var pickerItem: FormOptionsItem<String>?
    
    @IBOutlet weak var baseView: CustomCellView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @objc func datePickerValueChanged(_ sender: UIDatePicker){

        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()

        // Set date format
        dateFormatter.dateFormat = "dd/MM/yyyy"

        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)

     pickerItem?.updationCallBack(selectedDate)
    }
     
     
    func configure(withData data: FormItem) {
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.datePickerMode = .date
        guard let item = data as? FormOptionsItem<String> else {
            return
        }
        self.pickerItem = item
        self.baseView.titleLbl.text = item.title
        self.baseView.valueLbl.text = item.value
        self.datePicker.minimumDate = Date()
    }

}



class LeaveCountDisplayCell: UITableViewCell, ConfigurableCell {
    var rowHeight: CGFloat = 50
    
    static var reuseId: String = "displayCountReuseId"//String(describing: self)
    
    @IBOutlet weak var baseView: CustomCellView!
    func configure(withData data: FormItem) {
        guard let item = data as? FormDisplayItem else {
            return
        }
        self.baseView.titleLbl.text = item.title
        self.baseView.valueLbl.text = item.value
    }

}


class LeaveCauseInputCell: UITableViewCell, ConfigurableCell, RadioBtnDelegate {
    var rowHeight: CGFloat = 60
    
   static var reuseId: String = "causeInputReuseId"//String(describing: self)
    
    
    var radioItem: FormOptionsItem<String>?
     
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var radioOptionsView: CustomRadioButtonView!
    override func awakeFromNib() {
        super.awakeFromNib()
        radioOptionsView.del = self
    }
    func configure(withData data: FormItem) {
        guard let item = data as? FormOptionsItem<String>else {
            return
        }
        self.radioItem = item
        radioOptionsView.resetBtns()
        let options = item.options
        self.titleLbl.text = item.title
        self.radioOptionsView.titles = options
    }
    func updateCauseTitle(_ title: String) {
    radioItem?.updationCallBack(title)
    }
}
class LeaveReasonInptCell: UITableViewCell, ConfigurableCell, UITextViewDelegate {
    var rowHeight: CGFloat = 70
    
    static var reuseId: String = "reasonInputReuseId"//String(describing: self)
    var inputItem: FormInputItem?
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var reasonTxt: UITextView!
    func configure(withData data: FormItem) {
        reasonTxt.delegate = self
        reasonTxt.isEditable = true
        self.reasonTxt.layer.borderColor = UIColor.lightGray.cgColor
        self.reasonTxt.layer.borderWidth = 1

        guard let item = data as? FormInputItem else {
            return
        }
        inputItem = item
        self.titleLbl.text = item.title
        self.reasonTxt.text = item.value
    }
    func textViewDidChange(_ textView: UITextView) {
        if let txt = textView.text
        {
        inputItem?.updationCallBack(txt)
        }
    }
}
