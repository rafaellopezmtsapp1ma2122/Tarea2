import Foundation
import UIKit

//Preparamos el objeto
class Eventos: Codable {
    public let nameE: String
    public var expE: String
    public let fechasinformato: Double
    
    
    //Inicializamos el objeto
    init(json: [String: Any]) {
        nameE = json["name"] as? String ?? ""
        
        //Parseamos los datos
        fechasinformato = json["date"] as? Double ?? 0
        
       
        let dateFromater = DateFormatter()
        if fechasinformato > 1000000000000 && fechasinformato < 1000000000000000{
            
             let fechaparaformater = Date(timeIntervalSince1970: fechasinformato/1000)
            
            dateFromater.timeZone = TimeZone(abbreviation: "OMT")
            
            dateFromater.locale = NSLocale.current
            
            dateFromater.dateFormat = "DD-MM-YYYY HH:mm"
            
           expE = dateFromater.string(from: fechaparaformater)
        }
        else if fechasinformato > 1000000000000000{
             let fechaparaformater = Date(timeIntervalSince1970: fechasinformato/1000000)
            dateFromater.timeZone = TimeZone(abbreviation: "OMT")
            
            dateFromater.locale = NSLocale.current
            
            dateFromater.dateFormat = "DD-MM-YYYY HH:mm"
            
           expE = dateFromater.string(from: fechaparaformater)
        }
        else {
          
            let fechaparaformater = Date(timeIntervalSince1970: fechasinformato)
            dateFromater.timeZone = TimeZone(abbreviation: "OMT")
            
            dateFromater.locale = NSLocale.current
            
            dateFromater.dateFormat = "DD-MM-YYYY HH:mm"
            
           expE = dateFromater.string(from: fechaparaformater)
        }
        
       
        
        
    }
}
    
