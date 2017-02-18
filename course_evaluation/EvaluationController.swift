//
//  EvaluationController.swift
//  course_evaluation
//
//  Created by Macintosh on 2/12/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import UIKit

class EvaluationViewController: UIViewController {
    
    var numberOfStudent: Int!
    

    @IBOutlet weak var navigationName: UINavigationItem!
    
    @IBAction func cancelBtnPress(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func showAlertDialog() {
        let alert = UIAlertController(title: "", message: "This is my message.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
