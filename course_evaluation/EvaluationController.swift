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
    var numberList = ["1", "2", "3", "4", "5"]
    
    @IBOutlet var collectionOfButtons: Array<UIButton>?

    @IBOutlet weak var navigationName: UINavigationItem!
    
    @IBAction func cancelBtnPress(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignNumberToButton()
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        assignNumberToButton()
    }
    
    func showAlertDialog() {
        let alert = UIAlertController(title: "", message: "This is my message.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func assignNumberToButton() {
        numberList.shuffle()
        for i in (0...collectionOfButtons!.count - 1){
            collectionOfButtons![i].setTitle(numberList[i], for: .normal)
        }
    }
}

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}
