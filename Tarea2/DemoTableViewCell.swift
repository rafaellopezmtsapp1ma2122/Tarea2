import UIKit

class DemoTableViewCell: UITableViewCell {
    
   

    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var nameText: UILabel!
    //Creamos el código para la cell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
