//
//  ParentTableViewCell.swift
//  problem example
//
//  Created by ibrahim beltagy on 9/27/17.
//  Copyright © 2017 ibrahim beltagy. All rights reserved.
//

import UIKit

class ParentTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    var comments = [["poster" : "User name", "time" : "2 hours", "body" : "Lorem ipsum dolor sit amet."], ["poster" : "User name", "time" : "2 hours", "body" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."]]

    
    @IBOutlet weak var postLabel: UILabel!
    
    @IBOutlet weak var commentsTableView: UITableView!

    @IBOutlet weak var postBodyLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentsTableViewHeightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        
        commentsTableView.register(UINib(nibName: "InnerTableViewCell", bundle: nil), forCellReuseIdentifier: "InnerTableViewCell")
        
        commentsTableView.estimatedRowHeight = 102
        commentsTableView.rowHeight = UITableViewAutomaticDimension
        commentsTableView.separatorStyle = .none
        commentsTableView.separatorColor = UIColor.clear        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InnerTableViewCell") as! InnerTableViewCell
        
        let comment = comments[indexPath.row]
        
        cell.commenterNameLabel.text = comment["poster"]
        cell.commentBodyLabel.text = comment["body"]
               return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("+ \(cell.frame.height)")
        
        if indexPath.row == (tableView.indexPathsForVisibleRows?.last!)?.row {
            let height = tableView.contentSize.height
            commentsTableViewHeightConstraint.constant = height
            print("- \(height)")
            self.layoutIfNeeded()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
