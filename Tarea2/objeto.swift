import Foundation
import UIKit


class Eventos: Codable {
    public let nameE: String
    public let expE: String
    
    
   
    init(json: [String: Any]) {
        nameE = json["name"] as? String ?? ""
        expE = json["date"] as? String ?? ""
       
        
        
    }
}
    
