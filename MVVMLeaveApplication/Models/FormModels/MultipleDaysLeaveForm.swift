 

import Foundation
import UIKit

class MultipleDaysLeaveForm: OnedayLeaveForm {
    var toDate: String = Date().dateString()
    override var leaveType: LeaveType {
        return .multipleDays
    }
    override func congigureDynamicItems() {
    formitems = []
    self.formitems = [getLeaveTypeItem(), getFromDateItem(), getToDateItem(), daysItem, getCauseItem(), getReasonItem()]
    }
    func getFromDateItem() -> FormItem
    {
        let fromdateitem = FormOptionsItem([""], "From Date")
        fromdateitem.value = leaveDate
        fromdateitem.properties.celltype = FormItemCellType.datepicker
        fromdateitem.updationCallBack = { [weak self, weak fromdateitem] value in
            guard let stronfSelf = self else{return}
            stronfSelf.leaveDate = value
            fromdateitem?.value = value
            stronfSelf.leaveDate = value
            if let frdate = stronfSelf.leaveDate.date(), let todate = stronfSelf.toDate.date()
            {
            stronfSelf.days = CGFloat(stronfSelf.resetDaysCount(fromDate: frdate, toDate: todate))
            stronfSelf.daysItem.value = "\(stronfSelf.days)"
            }
            stronfSelf.updationCallBack(.reload, nil)
            }
    return fromdateitem
    }
    func getToDateItem() -> FormItem
    {
        let todateitem = FormOptionsItem([""], "To Date")
            todateitem.value = toDate
        todateitem.properties.celltype = FormItemCellType.datepicker
        todateitem.updationCallBack = { [weak self, weak todateitem] value in
            guard let stronfSelf = self else{return}
            stronfSelf.toDate = value
            todateitem?.value = value
            if let frdate = stronfSelf.leaveDate.date(), let todate = stronfSelf.toDate.date()
            {
            stronfSelf.days = CGFloat(stronfSelf.resetDaysCount(fromDate: frdate, toDate: todate))
            stronfSelf.daysItem.value = "\(stronfSelf.days)"
            }
            stronfSelf.updationCallBack(.reload, nil)
            }
    return todateitem
    }
}




