 

import Foundation
import UIKit

enum UpdateType {
    case reload
    case reset
}

enum LeaveType: String
{
    case oneDay = "One day"
    case multipleDays = "Multiple Days"
    case accrossSessions = "Across Sessions"
}

enum CauseType: String {
    case Trip = "Trip"
    case Sick = "Sick"
    case Festival = "Fest"
    case Death = "Death"
    case Others = "Others"
}

enum SessionType: String
{
    case first = "First"
    case second = "Second"
}


struct FormItemUIProperties {
    var celltype: FormItemCellType?
}


enum FormItemCellType
{
  case pickerType
  case datepicker
  case textView
  case radioType
  case displayType
  
  /// Registering methods for all forms items cell types
  ///
  /// - Parameter tableView: TableView where apply cells registration
  static func registerCells(for tableView: UITableView) {
    tableView.register(UITableViewCell.nib(ofName: "PickerInputCell"), forCellReuseIdentifier: PickerInputCell.reuseId)
    tableView.register(UITableViewCell.nib(ofName: "DatePickerInputCell"), forCellReuseIdentifier: DatePickerInputCell.reuseId)
    tableView.register(UITableViewCell.nib(ofName: "LeaveCountDisplayCell"), forCellReuseIdentifier: LeaveCountDisplayCell.reuseId)
    tableView.register(UITableViewCell.nib(ofName: "LeaveCauseInputCell"), forCellReuseIdentifier: LeaveCauseInputCell.reuseId)
    tableView.register(UITableViewCell.nib(ofName: "LeaveReasonInputCell"), forCellReuseIdentifier: LeaveReasonInptCell.reuseId)
  }
    func getNibcell(ofClass cell: String) -> UINib
    {
    return UINib(nibName: cell, bundle: nil)
    }
  
  /// Correctly dequeue the UITableViewCell according to the current cell type
  ///
  /// - Parameters:
  ///   - tableView: TableView where cells previously registered
  ///   - indexPath: indexPath where dequeue
  /// - Returns: a non-nullable UITableViewCell dequeued
  func dequeueCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
    
    let cell:  UITableViewCell
    switch self {
    case .displayType:
        cell = tableView.dequeueReusableCell(withIdentifier: LeaveCountDisplayCell.reuseId, for: indexPath)
         
    case .radioType:
        cell = tableView.dequeueReusableCell(withIdentifier: LeaveCauseInputCell.reuseId, for: indexPath)
         
    case .textView:
        cell = tableView.dequeueReusableCell(withIdentifier: LeaveReasonInptCell.reuseId, for: indexPath)
         
    case .pickerType:
        cell = tableView.dequeueReusableCell(withIdentifier: PickerInputCell.reuseId, for: indexPath)
        
        return cell
    case .datepicker:
      cell = tableView.dequeueReusableCell(withIdentifier: DatePickerInputCell.reuseId, for: indexPath)
    }
    return cell
  }
}
