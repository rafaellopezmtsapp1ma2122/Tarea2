//
//  ViewControllerAgenda.swift
//  Tarea2
//
//  Created by Apps2M on 16/12/22.
//

import UIKit

class ViewControllerAgenda: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        autoUpdate()
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
        
    }

    var tabla: [Eventos] = []
    let url = URL(string: "https://superapi.netlify.app/api/db/eventos")!
    
    func autoUpdate(){
        
        do {
            let data = try Data(contentsOf: url)
            
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        
            
            var listaTemp: [Any] = []
           
            
            
            for explica in json as! [Any] {
               
                if type(of: explica) != NSNull.self{
                   
                    listaTemp.append(explica)
                    
                }
            }
            for o in listaTemp as! [[String: Any]] {
               
                tabla.append(Eventos(json: o))
                
            }
               
        
                
            
                   
            
          
            } catch let errorJson {
                print(errorJson)
            }
        self.tableView.reloadData()
    }
        

    

        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabla.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.nameText.text = tabla[indexPath.row].nameE
        cell.fecha.text = tabla[indexPath.row].expE
        return cell
    }
      


    @IBAction func addEvent(_ sender: UIButton) {
        print("Enviado")
    }
    
    

    
           


}
