//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Jillian Kavanaugh on 8/31/20.
//  Copyright © 2020 JILL KAVANAUGH. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var expenses = [Expense]()
    
    var dateFormatter = DateFormatter()
    
    var displayDateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayDateFormatter.dateStyle = .medium
        displayDateFormatter.timeStyle = .short
        
        dateFormatter.dateFormat = "MMM d, yyy HH:mm"
        
        if let date = dateFormatter.date(from: "June 1, 2018 18:30") {
        expenses.append(Expense(title: "Dinner", amount: 32.50, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 30, 2018 12:17") {
            expenses.append(Expense(title: "Office Supplies", amount: 59.34, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 30, 2018 11:43") {
            expenses.append(Expense(title: "Uber", amount: 16.23, date: date))
        }
        
        if let date = dateFormatter.date(from: "May 29, 2018 8:45") {
            expenses.append(Expense(title: "Coffee", amount: 3.95, date: date))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        if let cell = cell as? ExpenseTableViewCell {
            
            let expense = expenses[indexPath.row]
            
            cell.titleLabel.text = expense.title
            cell.amountLabel.text = String(expense.amount)
            cell.dateLabel.text = displayDateFormatter.string(from: expense.date)
        }
        
        return cell
    }
    

    
}
