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
    
    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func createAccount(_ sender: Any) {
        
       

    
          

      
        let parameters: [String: Any] = ["user": user.text ?? "", "pass": password.text ?? ""]
          
      
          let url = URL(string: "https://superapi.netlify.app/api/register")!
         
          let session = URLSession.shared
          
          
          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          
         
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
       
          self.performSegue(withIdentifier: "entrar", sender: sender)
       
          
          task.resume()
        
    }
    
    
}
