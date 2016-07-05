//
//  addViewController.swift
//  multicounter
//
//  Created by 福島達也 on 2016/07/04.
//  Copyright © 2016年 Tatsuya Fukushima. All rights reserved.
//

import UIKit

class addViewController: UIViewController {
    
    @IBOutlet var koumoku : UITextField!
    
    let saveData = NSUserDefaults.standardUserDefaults()
    var koumokuArray : [AnyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if saveData.arrayForKey("koumoku") != nil{
            koumokuArray = saveData.arrayForKey("koumoku")!
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: UIButton){
        
        
        let koumokuDictionary = ["koumoku":koumoku.text!]
        
        //保存
        koumokuArray.append(koumokuDictionary)
        saveData.setObject(koumokuArray, forKey:"koumoku")
        saveData.synchronize()
        print(koumoku)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
