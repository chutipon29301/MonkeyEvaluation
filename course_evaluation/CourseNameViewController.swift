//
//  courseNameController.swift
//  course_evaluation
//
//  Created by Macintosh on 2/5/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import UIKit

class courseNameViewController: UIViewController {
    
    @IBOutlet weak var courseName: UINavigationItem!
    @IBOutlet weak var studentCount: UILabel!
    
    @IBAction func btnPress(_ sender: UIButton) {
        if studentCount.text! == "0" {
            studentCount.text! = sender.titleLabel!.text!
        }else {
            studentCount.text! += sender.titleLabel!.text!
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        studentCount.text! = "0"
    }
    
    @IBAction func submit(_ sender: UIButton) {
        let temp = studentCount.text!
        studentCount.text! = "0"
        performSegue(withIdentifier: "showEvaluationController", sender: temp)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEvaluationController" {
            let navDestination = segue.destination as! UINavigationController
            let destination = navDestination.topViewController as! EvaluationViewController
            destination.navigationName.title = (sender as! String)
        }
    }
}
