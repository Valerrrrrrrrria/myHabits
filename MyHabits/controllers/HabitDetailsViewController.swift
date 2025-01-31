//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Валерия Новикова on 29/01/2025.
//

import UIKit

class HabitDetailsViewController: UITableViewController {
    
    //var dates: [Date]?
    var dates: [Date] = []
    
    var habit: Habit? {
        didSet {
            print("Habit name \(habit?.name)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        dates = HabitsStore.shared.dates
        print(dates)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(editBarButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = .purple
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        self.tableView.dataSource = self
    }
    
    @objc func editBarButtonTapped() {
        let habitvc = HabitViewController()
        habitvc.habitView.nameTextField.text = habit?.name
        habitvc.habitView.selectedcolor = habit?.color ?? .black
        habitvc.habitView.selectedTime = habit?.date ?? Date.now
        habitvc.habitView.deleteButton.isHidden = false
        present(habitvc, animated: true)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        // Configure the cell...
        cell.textLabel?.text = dateFormatter.string(from: dates[indexPath.row])
        
        if (HabitsStore.shared.habit(habit!, isTrackedIn: dates[indexPath.row])) {
            cell.accessoryType = .checkmark
        }
        cell.tintColor = .purple
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped \(indexPath.row)")
        // подумать, как тут получить саму ячейку, чтобы поменять её accessoryType
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
