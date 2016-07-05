//
//  TableViewCell.swift
//  multicounter
//
//  Created by 福島達也 on 2016/07/05.
//  Copyright © 2016年 Tatsuya Fukushima. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //表示させる二つのラベルを宣言
    @IBOutlet var koumoku : UILabel!
    @IBOutlet var kaisuu : UILabel!
    var number : Int = 0

    @IBAction func tap(){
    number++
    kaisuu.text = String(number)
    }
    
    @IBAction func tap2(){
        number--
        kaisuu.text = String(number)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
