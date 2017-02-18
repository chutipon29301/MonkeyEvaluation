//
//  EvaluationController.swift
//  course_evaluation
//
//  Created by Macintosh on 2/12/17.
//  Copyright © 2017 Macintosh. All rights reserved.
//

import UIKit

class EvaluationViewController: UIViewController {
    
    var isButtonValueValid = false
    var isFirstValueInput = true
    var currentButtonValue = 0
    var numberOfStudent: Int!
    var currentStudent = 1
    var courseName: String!
    
    var imageList = [
        (value: 1, image: #imageLiteral(resourceName: "btnBallBg01")),
        (value: 2, image: #imageLiteral(resourceName: "btnBallBg02")),
        (value: 3, image: #imageLiteral(resourceName: "btnBallBg03")),
        (value: 4, image: #imageLiteral(resourceName: "btnBallBg04")),
        (value: 5, image: #imageLiteral(resourceName: "btnBallBg05")),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationName()
        assignNumberToButton()
        doneBtn.isEnabled = false
    }
    
    @IBOutlet var collectionOfButtons: Array<UIButton>?
    
    @IBOutlet weak var navigationName: UINavigationItem!
    
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    @IBAction func cancelBtnPress(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        if !isFirstValueInput {
            isButtonValueValid = (currentButtonValue == sender.tag)
            showAlertDialog()
            currentButtonValue = 0
        }else{
            currentButtonValue = sender.tag
        }
        isFirstValueInput = !isFirstValueInput
        assignNumberToButton()
    }
    
    func showAlertDialog() {
        if currentStudent == numberOfStudent {
            let alert = UIAlertController(title: "Done", message: "Return iPad to Instructor", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            doneBtn.isEnabled = true
        }
        if isButtonValueValid {
            let alert = UIAlertController(title: "Next", message: "Pass iPad to next person", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            currentStudent += 1
            setNavigationName()
            print(currentButtonValue)
        }else{
            let alert = UIAlertController(title: "Invalid input", message: "Select Number Again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        isButtonValueValid = false
    }
    
    func assignNumberToButton() {
        imageList.shuffle()
        for i in (0...collectionOfButtons!.count - 1){
            collectionOfButtons![i].tag = imageList[i].value
            collectionOfButtons![i].setImage(imageList[i].image, for: .normal)
        }
    }
    
    func setNavigationName() {
        navigationName.title = courseName + ": Student number " + String(currentStudent)
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
