import UIKit

class ViewControllerAdd: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

//Indicamos las variables
    @IBOutlet weak var eventtext: UITextField!
    

    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    
    @IBAction func addEvent(_ sender: Any) {
        
//Creamos una llamada a la api y comprobamos si puede tener dato nulo recorriendo el json que hemos parseado y lo añadimos a un array para poseteriormente añadirlos a la celda del table view
        let fechaFormat = Int(DatePicker.date.timeIntervalSince1970)
    
    
          

      
        let parameters: [String: Any] = ["name": eventtext.text ?? "", "date": fechaFormat]
          

          let url = URL(string: "https://superapi.netlify.app/api/db/eventos")!
          
          
          let session = URLSession.shared
          
      
          var request = URLRequest(url: url)
          request.httpMethod = "POST" //metodo Post
          
          
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")
          request.addValue("application/json", forHTTPHeaderField: "Accept")
          
          do {
           
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
          } catch let error {
            print(error.localizedDescription)
            return
          }
          
         
          let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
              print("Post Request Error: \(error.localizedDescription)")
              return
            }
            
          
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode)
            else {
              print("Invalid Response received from the server")
              return
            }
            
           
            guard let responseData = data else {
              print("nil Data received from the server")
              return
            }
            
            do {
             
              if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                print(jsonResponse)
                
              } else {
                print("data maybe corrupted or in wrong format")
                throw URLError(.badServerResponse)
              }
            } catch let error {
              print(error.localizedDescription)
            }
          }
          
          task.resume()
    }
}
