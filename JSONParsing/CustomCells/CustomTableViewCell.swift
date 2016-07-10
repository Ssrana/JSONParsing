//
//  CustomTableViewCell.swift
//  JSONParsing
//
//  Created by Sanchika on 03/07/16.
//  Copyright © 2016 Sanchika. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUIForCustomCell()
    {
        
    }
    
    static func registerCellForTableVeiw(tableView:UITableView)
    {
        tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    static func reusableCellForTableView(tableView:UITableView, indexPath:NSIndexPath) -> CustomTableViewCell
    {
        return tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell") as! CustomTableViewCell
    }
}
