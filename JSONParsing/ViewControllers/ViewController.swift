//
//  ViewController.swift
//  JSONParsing
//
//  Created by Sanchika on 21/06/16.
//  Copyright © 2016 Sanchika. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var myJson:NSMutableArray?
    @IBOutlet weak var tableView: UITableView!
    var dataObjectForClass = [DataObject]()
    override func viewDidLoad() {
        title = "List Of Elements"
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.registerClass(UITableViewCell.self,
                                forCellReuseIdentifier: "Cell")
        getJsonFromFile()
        setUpData()
        super.viewDidLoad()
        
    }
    
    func setUpData()
    {
        for dictValue in myJson!
        {
            let obj = DataObject(data: dictValue as! NSDictionary)
            dataObjectForClass.append(obj)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if dataObjectForClass.count > 0 {
            return dataObjectForClass.count
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.accessoryType = .DisclosureIndicator
        cell?.textLabel?.text = dataObjectForClass[indexPath.row].name
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("myVC") as! PreviewViewController
        vc.dataObjectForUI = dataObjectForClass[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    func getJsonFromFile()
    {
        let file = NSBundle.mainBundle().pathForResource("example", ofType: "json")
        let myNSdata = NSData(contentsOfFile: file!)
        
        do
        {
            myJson = try NSJSONSerialization.JSONObjectWithData(myNSdata!, options: .AllowFragments) as? NSMutableArray
        
        }
        catch let err as NSError
        {
            print(err)
        }
    }
    
}

