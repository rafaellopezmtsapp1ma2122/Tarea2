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
        
        if eventtext.text?.isEmpty == false {
            let fechaFormat = Int(DatePicker.date.timeIntervalSince1970)
        
        
              

            //Peprarmos los datos a enviar
            let parameters: [String: Any] = ["name": eventtext.text ?? "", "date": fechaFormat]
              
            //Creamos una variable de la URL
              let url = URL(string: "https://superapi.netlify.app/api/db/eventos")!
              
              
              let session = URLSession.shared
              
          
              var request = URLRequest(url: url)
              request.httpMethod = "POST" //metodo Post
              
              
              request.addValue("application/json", forHTTPHeaderField: "Content-Type")
              request.addValue("application/json", forHTTPHeaderField: "Accept")
              //Relaizamos las acciones en un do para que cualquier erros pueda ser detectado e incluso ver el resultado en caso de estar todo correcto
              do {
               
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
              } catch let error {
                print(error.localizedDescription)
                return
              }
              
             //Comprobamos los posibles errores y los inprimimos por pantalla
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
                //Comprobamos la respuesta de que recibimos del metodo al enviar datos, comprobando los tipos de error o la respuesta si esta todo correcto
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
            eventtext.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }else{
            //Cambiamos el color de fondo de los textfield si estan vacios
            eventtext.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }
      
    }
}
