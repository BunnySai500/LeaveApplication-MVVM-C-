 
import UIKit


class LeaveApplyForm: UIViewController, LeaveApplication {
    private var viewModel: LeaveFormViewModel?
    
    @IBOutlet weak var leaveTable: UITableView!
    @IBOutlet weak var applyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    viewModel = LeaveFormViewModel(self, "Leave Applicationz")
        leaveTable.delegate = viewModel
        leaveTable.dataSource = viewModel
        viewModel?.registerCells(forTable: leaveTable)
        leaveTable.reloadData()
        self.title = viewModel?.tableTitle
    }
    func reloadViews() {
    leaveTable.reloadData()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    @IBAction func submitAction(_ sender: UIButton) {
    viewModel?.getLeaveDetails()
    }
}
