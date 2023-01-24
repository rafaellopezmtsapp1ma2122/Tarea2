//
//  ViewControllerLogIn.swift
//  Tarea2
//
//  Created by Apps2M on 17/1/23.
//

import UIKit

class ViewControllerLogIn: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //Inicializamos los outlets para poder relaccionar la interfaz con el código
    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func createAccount(_ sender: Any) {
        
        //Comprobamos que no esten vacios los textfield e iniciamos la acción del metodo post para enviar los datos de usuario

        if user.text?.isEmpty == false && password.text?.isEmpty == false{
            //Peprarmos los datos a enviar
              let parameters: [String: Any] = ["user": user.text ?? "", "pass": password.text ?? ""]
                
            //Creamos una variable de la URL
                let url = URL(string: "https://superapi.netlify.app/api/register")!
               
                let session = URLSession.shared
                
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                
               
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
             
                self.performSegue(withIdentifier: "entrar", sender: sender)
             
                
                task.resume()
          

     
        }else{
            //Cambiamos el color de fondo de los textfield si estan vacios
            password.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
            user.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }
    }
    
    
}
