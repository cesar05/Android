//
//  ListaNotas.swift
//  Exposicion
//
//  Created by Ingeniería LIS on 27/10/16.
//  Copyright © 2016 Ingeniería LIS. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

struct materiaNotas{
    let materia : String!
    let nota    : String!
}

class ListaNotas: UITableViewController{
    
    var notas=[materiaNotas]()
    var nombreEstu=String()
    //[]
    override func viewDidLoad(){
        super.viewDidLoad()
        
        print("entro")
        //self.cargando.hidden = false
    
        
        let databaseRef=FIRDatabase.database().reference();
        databaseRef.child("Estudiante").child(nombreEstu).queryOrderedByKey().observeEventType(.ChildAdded,withBlock:{
                snapshot in
            
                let materia = snapshot.value!["Materia"] as! String
                let nota    = snapshot.value!["Nota"] as! String
            
            self.notas.insert(materiaNotas(materia:materia,nota: nota), atIndex: 0)
            self.tableView.reloadData()
            //self.cargando.hidden = true
        })
    
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        var cell=tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let label1 = cell?.viewWithTag(1) as! UILabel
        label1.text=notas[indexPath.row].materia
        
        let label2 = cell?.viewWithTag(2) as! UILabel
        label2.text=notas[indexPath.row].nota
        
        return cell!
    }
    
    

}
