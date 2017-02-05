//
//  courseNameController.swift
//  course_evaluation
//
//  Created by Macintosh on 2/5/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import UIKit

class courseNameViewController: UIViewController {
    @IBOutlet weak var inputBox: UITextField!
    
    @IBAction func confirmBtn(_ sender: UIButton) {
        let numberOfStudents = Int(inputBox.text!)!
        print(numberOfStudents)
    }
}
