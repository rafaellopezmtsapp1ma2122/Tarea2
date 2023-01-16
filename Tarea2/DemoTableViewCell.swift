//
//  DemoTableViewCell.swift
//  Tarea2
//
//  Created by Apps2M on 16/12/22.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
   

    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var nameText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
