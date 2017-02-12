//
//  courseListViewController.swift
//  course_evaluation
//
//  Created by Macintosh on 2/5/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import UIKit

class courseListViewController: UITableViewController {
    
    var courseNameList = [
        "ABC001",
        "ABC002"
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseNameList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseNameCell") as! courseNameCell
        cell.courseName.text = courseNameList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        performSegue(withIdentifier: "showEvaluation", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEvaluation" {
            let destination = segue.destination as! courseNameViewController
            destination.courseName.title = courseNameList[(sender as! IndexPath).row]
        }
        
    }
}

class courseNameCell: UITableViewCell {
    @IBOutlet weak var courseName: UILabel!
}
