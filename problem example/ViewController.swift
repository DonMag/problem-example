//
//  ViewController.swift
//  problem example
//
//  Created by ibrahim beltagy on 9/27/17.
//  Copyright © 2017 ibrahim beltagy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.tableView.removeObserver(self, forKeyPath: "contentSize")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UINib(nibName: "ParentTableViewCell", bundle: nil), forCellReuseIdentifier: "ParentTableViewCell")
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        
        tableView.tableFooterView = UIView()

    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        if(keyPath == "contentSize"){
            
            if let newvalue = change?[.newKey]
            {
                let newsize  = newvalue as! CGSize
                
                for constraint in tableView.constraints {
                    if constraint.firstItem as? UITableView == tableView {
                        if constraint.firstAttribute == .height {
                            constraint.constant = newsize.height
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParentTableViewCell") as! ParentTableViewCell
        
        cell.postLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        
        // initial height for the table to be changed by willdisplay in the inner cell
        cell.commentsTableView.reloadData()
        
        let height = cell.commentsTableView.contentSize.height
        cell.commentsTableViewHeightConstraint.constant = height
        
        cell.layoutIfNeeded()
        
        // variable height for the label because otherwise it kept turning back to 1 line
        cell.postLabel.sizeToFit()
        cell.postBodyLabelHeightConstraint.constant = cell.postLabel.frame.size.height
        
        cell.layoutIfNeeded()
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

