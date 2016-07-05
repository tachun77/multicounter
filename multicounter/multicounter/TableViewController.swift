//
//  TableViewController.swift
//  multicounter
//
//  Created by 福島達也 on 2016/07/05.
//  Copyright © 2016年 Tatsuya Fukushima. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let saveData = NSUserDefaults.standardUserDefaults()
    var koumokuArray : [AnyObject] = []
    var kaisuu : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil),forCellReuseIdentifier:"cell")
    }
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        
        if saveData.arrayForKey("koumoku") != nil{
            koumokuArray = saveData.arrayForKey("koumoku")!
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return
            koumokuArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        let nowIndexPathDictionary: (AnyObject) = koumokuArray[indexPath.row]
        cell.koumoku.text = nowIndexPathDictionary["koumoku"] as? String
        // Configure the cell...

        return cell
    }
//    override func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
//
//        self.kaisuu++
//        print(kaisuu)
//        
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.koumokuArray.removeAtIndex(indexPath.row)
            self.saveData.setObject(self.koumokuArray, forKey:"koukoku")
            self.tableView.deleteRowsAtIndexPaths([indexPath],withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
