
//
//  PreviewViewController.swift
//  JSONParsing
//
//  Created by Sanchika on 21/06/16.
//  Copyright © 2016 Sanchika. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
{
    var dataObjectForUI:DataObject?
    var sections = ["GeneralInfo","CompanyInfo","AddressInfo"]
    var generalInfo = ["username", "id" , "phone" , "email" , "website"]
    var companyInfo = ["name" , "catchPhrase" , "bs" ]
    var addressInfo = ["street" , "suite" , "city" , "zipcode"]
    @IBOutlet weak var tableView: UITableView!
    
    enum SectionInfo: Int
    {
        case GenralInfo = 0
        case CompanyInfo = 1
        case AddressInfo = 2
    }
    
    override func viewDidLoad()
    {
        self.navigationItem.title = dataObjectForUI?.name
        CustomTableViewCell.registerCellForTableVeiw(self.tableView)
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func setDataForTableCell(section:SectionInfo, cell:CustomTableViewCell, indexPath:NSIndexPath)
    {
        var keyString:String = ""
        var valueString:String = ""
        switch section {
        case .GenralInfo:
            keyString = generalInfo[indexPath.row] as String
            valueString = dataObjectForUI?.singleDictionaryObject?.valueForKey(keyString) as! String
        case .CompanyInfo:
            keyString = companyInfo[indexPath.row]
            valueString = dataObjectForUI?.companyInfo?.testDic.valueForKey(keyString) as! String
        case .AddressInfo:
            keyString = addressInfo[indexPath.row]
            valueString = dataObjectForUI?.address?.test2.valueForKey(keyString) as! String
        }
        cell.valueLabel.text = valueString
        cell.keyLabel.text = keyString.capitalizedString + ":"
    }
}

// MARK: UITableView: DataSource,Delegate Methods
extension PreviewViewController
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let currentSection: SectionInfo = SectionInfo.init(rawValue: section)!
        switch currentSection {
        case .GenralInfo:
            return generalInfo.count
        case .CompanyInfo:
            return companyInfo.count
        case .AddressInfo:
            return addressInfo.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = CustomTableViewCell.reusableCellForTableView(tableView, indexPath: indexPath)
        let currentSection: SectionInfo = SectionInfo.init(rawValue: indexPath.section)!
        self.setDataForTableCell(currentSection, cell: cell,indexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 68
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return sections[section]
    }
}