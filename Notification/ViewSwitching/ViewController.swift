//
//  ViewController.swift
//  ViewSwitching
//
//  Created by 304 on 2020/08/19.
//  Copyright © 2020 304. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func next(_ sender: Any) {
        
        //SecondViewController 객체 생성
        let secondViewController =
            self.storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        
        //출력
        self.present(secondViewController, animated: true)
    }
    
    @IBOutlet weak var lblMsg: UILabel!
    override func viewDidLoad() {
        super