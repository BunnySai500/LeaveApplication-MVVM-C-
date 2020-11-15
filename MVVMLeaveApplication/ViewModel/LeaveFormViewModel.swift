 

import Foundation
import UIKit


class LeaveFormViewModel: NSObject {
    var leaveForm: LeaveForm?
    var tableTitle: String?
    fileprivate weak var view: LeaveApplication?
    lazy var updationCallBack: (UpdateType, String?) -> Void = { [weak self] updationType, updateValue in
        guard let strongSelf = self, let vie = strongSelf.view else {return}
        
        updationType == .reload ? vie.reloadViews() : strongSelf.resetForm(for: updateValue ?? "One day")
    
    }
    init(_ view: LeaveApplication,_ title: String) {
        self.view = view
        self.tableTitle = title
        super.init()
        setForm()
    }
    
    func setForm()
    {
    leaveForm = OnedayLeaveForm()
    leaveForm?.updationCallBack = updationCallBack
    }
    
    func resetForm(for type: String)
    {
     
    guard let type = LeaveType(rawValue: type) else {return}
        leaveForm = nil
        switch type {
        case .oneDay:
        leaveForm = OnedayLeaveForm()
        case .multipleDays:
        leaveForm = MultipleDaysLeaveForm()
        case .accrossSessions:
        leaveForm = AcrossSessionsLeaveForm()
        }
        leaveForm?.updationCallBack = updationCallBack
    guard let vie = self.view else {return}
    vie.reloadViews()
    }
    func getLeaveDetails()
    {
    guard let form = leaveForm else { return }
        form.formitems.forEach {
            print("\($0.title): \($0.value)\n")
        }
    }
    func registerCells(forTable table: UITableView)
    {
    FormItemCellType.registerCells(for: table)
    }
    
}
extension LeaveFormViewModel: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let form = leaveForm else {return 0}
    return form.formitems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let form = leaveForm else {return UITableViewCell()}
        let item = form.formitems[indexPath.row]
        
       if let celltype = item.properties.celltype
       {
       let cell = celltype.dequeueCell(for: tableView, at: indexPath)
       cell.selectionStyle = .none
       if let config = cell as? ConfigurableCell
       {
       config.configure(withData: item)
       return config as! UITableViewCell
       }
        return cell
       }
    return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let form = leaveForm else {return}
        var item = form.formitems[indexPath.row]
        if let celltype = item.properties.celltype
        {
            switch celltype {
            case .pickerType, .datepicker:
            let isselected = item.isSelected
            item.isSelected = !isselected
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            default:
            tableView.beginUpdates()
            tableView.reloadData()
            tableView.endUpdates()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    guard let form = leaveForm else {return 0}
    let item = form.formitems[indexPath.row]
    if let celltype = item.properties.celltype
    {
        switch celltype {
        case .pickerType, .datepicker:
            return item.isSelected ? 150: 50
        case .radioType, .textView:
            return 200
        default:
            return 50
        }
    }
    return 0
    }
    
}
