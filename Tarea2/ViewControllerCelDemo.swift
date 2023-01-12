//
//  ViewControllerCelDemo.swift
//  Ejercicio13
//
//  Created by Apps2M on 29/11/22.
//

import UIKit

class ViewControllerCelDemo: UITableViewCell {

    
    
    
    @IBOutlet weak var nametext: UILabel!
    @IBOutlet weak var desctext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
