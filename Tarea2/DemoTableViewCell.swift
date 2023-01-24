import UIKit

class DemoTableViewCell: UITableViewCell {
    
   
    //Creamos un codigo aparte para la view de la celda
    //Mencionamos los outlests de la view para poder usar los datos e incluso modificarlo
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
