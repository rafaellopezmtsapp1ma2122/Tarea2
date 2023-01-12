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
        super.viewDidLoad()
        autoUpdate()
        let nib = UINib(nibName: "ViewControllerCelDemo", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ViewControllerCelDemo")
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
        
    }
    var Nombre: [Eventos] = []
    var expli: [Eventos] = []
    
    let url = URL(string: "https://superapi.netlify.app/api/db/eventos")!
    
    func autoUpdate(){
        do {
            let data = try Data(contentsOf: url)
            
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            Nombre.removeAll()
           
            for i in json as! [Any] {
                print(i)
            }
            
            print(json)
            } catch let errorJson {
                print(errorJson)
            }
        self.tableView.reloadData()
    }
        

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Nombre.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.descName.text = Nombre[indexPath.row].nameE
        cell.nameText.text = expli[indexPath.row].expE
        
    
        
            
      
       
        return cell
    }

              
                
           


}
