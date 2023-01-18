import UIKit

class ViewControllerLogOn: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var myUser: UITextField!
    
    
    @IBOutlet weak var myPass: UITextField!
    
    @IBAction func LogOn(_ sender: Any) {
        
        
        guard let url =  URL(string:"https://superapi.netlify.app/api/login")
        else{
            return
        }
        
        let body: [String: String] = ["user": myUser.text ?? "", "pass": myPass.text ?? ""]
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            print(response as Any)
            if let error = error {
                print(error)
                return
            }
            guard let data = data else{
                return
            }
            
            print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
            if String(data: data, encoding: .utf8) == "Login succesful"{
                DispatchQueue.main.sync {
                    self.performSegue(withIdentifier: "inicio", sender: sender)
                }
            }
           
        }.resume()
        
        
        
    }
}
