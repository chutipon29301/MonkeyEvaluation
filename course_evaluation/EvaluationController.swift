//
//  EvaluationController.swift
//  course_evaluation
//
//  Created by Macintosh on 2/12/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import UIKit

class EvaluationViewController: UIViewController {
    @IBOutlet weak var navigationName: UINavigationItem!
    
    @IBAction func cancelBtnPress(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
