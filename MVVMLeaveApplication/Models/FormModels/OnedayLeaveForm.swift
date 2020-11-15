
import Foundation
import UIKit





class OnedayLeaveForm: LeaveForm {
    var formitems: [FormItem] = []
    var leaveType: LeaveType
    {
        return .oneDay
    }
    var leaveDate: String = Date().dateString()
    var days: CGFloat = 1
    var daysItem: FormItem
    var reason: String = ""
    var causeType: CauseType = .Trip
    var updationCallBack: (UpdateType, String?) -> Void = {_,_  in}
    
    init() {
    formitems = []
    let dayIt = FormDisplayItem("No of days")
    dayIt.properties.celltype = FormItemCellType.displayType
        dayIt.value = "\(days)"
    self.daysItem = dayIt
    congigureDynamicItems()
    }
    func getLeaveTypeItem() -> FormItem
    {
        let item = FormOptionsItem([LeaveType.oneDay.rawValue, LeaveType.multipleDays.rawValue, LeaveType.accrossSessions.rawValue], "Apply leave for")
        item.value = leaveType.rawValue
        item.properties.celltype = FormItemCellType.pickerType
        item.updationCallBack = { [weak self, weak item] value in
        guard let stronfSelf = self else{return}
        if let type = LeaveType(rawValue: value)
        {
        item?.value = value
        stronfSelf.updationCallBack(.reset, value)
        }
        }
    return item
    }
    func getCauseItem() -> FormItem
    {
        let item = FormOptionsItem([CauseType.Trip.rawValue, CauseType.Sick.rawValue, CauseType.Festival.rawValue, CauseType.Death.rawValue, CauseType.Others.rawValue], "Cause")
        item.value = causeType.rawValue
        item.properties.celltype = FormItemCellType.radioType
    item.updationCallBack = { [weak self, weak item] value in
        
        guard let stronfSelf = self else{return}
        if let type = CauseType(rawValue: value)
        {
        stronfSelf.causeType = type
        item?.value = value
        }
        }
    return item
    }
    func getReasonItem() -> FormItem
    {
    let item = FormInputItem("Enter Proper Reason", "Reason")
    item.value = reason
    item.properties.celltype = FormItemCellType.textView
    item.updationCallBack = { [weak self, weak item] value in
        guard let stronfSelf = self else{return}
        stronfSelf.reason = value
        item?.value = value
        }
    return item
    }
    func congigureDynamicItems()
    {
    formitems = []
    let dateItem = FormOptionsItem([""], "Date")
    dateItem.value = leaveDate
    dateItem.properties.celltype = FormItemCellType.datepicker
    dateItem.updationCallBack = { [weak self, weak dateItem] value in
        guard let stronfSelf = self else{return}
        stronfSelf.leaveDate = value
        dateItem?.value = value
        stronfSelf.days = 1
        stronfSelf.daysItem.value = "\(stronfSelf.days)"
        stronfSelf.updationCallBack(.reload, nil)
        }
    self.formitems = [getLeaveTypeItem(), dateItem, daysItem, getCauseItem(), getReasonItem()]
    }
    func resetDaysCount(fromDate f_date: Date, toDate t_date: Date) -> Int
    {
    let dayHourMinuteSecond: Set<Calendar.Component> = [.day]
    let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: f_date, to: t_date)
    let days = difference.day ?? 0
    if let day = difference.day, day >= 0 { return days }
    return 0
    }
    func differenceAccordingTosessions(fromSession f_session: SessionType, toSession t_session: SessionType) -> CGFloat
    {
        let (f, t): (SessionType, SessionType) = (f_session, t_session)
        switch (f,t) {
        case (.first, .first), (.second, .second):
        return 0.5
        case (.first, .second):
        return 0
        case (.second, .first):
        return 1
        }
    }
}







