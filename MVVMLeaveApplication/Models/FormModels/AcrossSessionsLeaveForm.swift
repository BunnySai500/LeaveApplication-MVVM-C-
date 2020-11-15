 
import Foundation
import UIKit


class AcrossSessionsLeaveForm: MultipleDaysLeaveForm {
    override var leaveType: LeaveType {
        return .accrossSessions
    }
    var fromSession: SessionType = .first
    var toSession: SessionType = .first
    override func congigureDynamicItems() {
    formitems = []
    let fromSessionItem = FormOptionsItem([SessionType.first.rawValue, SessionType.second.rawValue], "From Session")
        fromSessionItem.value = fromSession.rawValue
    fromSessionItem.properties.celltype = FormItemCellType.pickerType
    fromSessionItem.updationCallBack = { [weak self, weak fromSessionItem] value in
        guard let stronfSelf = self else{return}
        if let type = SessionType(rawValue: value)
        {
        stronfSelf.fromSession = type
        fromSessionItem?.value = value
        if let frdate = stronfSelf.leaveDate.date(), let todate = stronfSelf.toDate.date()
        {
        let dayscount = (CGFloat(stronfSelf.resetDaysCount(fromDate: frdate, toDate: todate)) - stronfSelf.differenceAccordingTosessions(fromSession: stronfSelf.fromSession, toSession: stronfSelf.toSession))
        
            stronfSelf.days = dayscount > 0 ? dayscount : 0
            stronfSelf.daysItem.value = "\(stronfSelf.days)"
        
        }
        stronfSelf.updationCallBack(.reload, nil)
        }
        }
    let toSessionItem = FormOptionsItem([SessionType.first.rawValue, SessionType.second.rawValue], "To Session")
    toSessionItem.value = toSession.rawValue
    toSessionItem.properties.celltype = FormItemCellType.pickerType
    toSessionItem.updationCallBack = { [weak self, weak toSessionItem] value in
        guard let stronfSelf = self else{return}
        if let type = SessionType(rawValue: value)
        {
        stronfSelf.toSession = type
        toSessionItem?.value = value
        if let frdate = stronfSelf.leaveDate.date(), let todate = stronfSelf.toDate.date()
        {
       let dayscount = (CGFloat(stronfSelf.resetDaysCount(fromDate: frdate, toDate: todate)) - stronfSelf.differenceAccordingTosessions(fromSession: stronfSelf.fromSession, toSession: stronfSelf.toSession))
        
            stronfSelf.days = dayscount > 0 ? dayscount : 0
            stronfSelf.daysItem.value = "\(stronfSelf.days)"
        }
        stronfSelf.updationCallBack(.reload, nil)
        }
        }
        self.formitems = [getLeaveTypeItem(), getFromDateItem(), fromSessionItem, getToDateItem(), toSessionItem, daysItem, getCauseItem(), getReasonItem()]
    }
}
