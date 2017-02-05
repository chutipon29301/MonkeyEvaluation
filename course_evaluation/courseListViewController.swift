//
//  courseListViewController.swift
//  course_evaluation
//
//  Created by Macintosh on 2/5/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import UIKit

class courseListViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseNameCell") as! courseNameCell
        cell.courseName.text = "Hello World"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEvaluation", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

class courseNameCell: UITableViewCell {
    @IBOutlet weak var courseName: UILabel!
}
