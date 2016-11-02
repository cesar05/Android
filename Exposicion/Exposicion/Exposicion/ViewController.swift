//
//  ViewController.swift
//  Exposicion
//
//  Created by Ingeniería LIS on 26/10/16.
//  Copyright © 2016 Ingeniería LIS. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    var boton=0
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func Enviar(sender: AnyObject) {
        
        if (txtNombre.text! == ""  || txtNota.text! == "" ||  txtMateria.text! == ""){
            self.alerta()
        }else{
            post()
        }
    }
    
    
    func post(){
        let materia=txtMateria.text!
        let nota=txtNota.text!
        //[]
        let post :[String:AnyObject]=["Materia":materia,"Nota":nota]
        let databaseRef=FIRDatabase.database().reference()
        
        databaseRef.child("Estudiante").child(txtNombre.text!).childByAutoId().setValue(post)
    }
    
    
    func alerta(){
        let alerta = UIAlertController(title: "Campos Vacios",
                                       message: "Faltan campos",
                                       preferredStyle: UIAlertControllerStyle.Alert)
        let accion = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alerta.addAction(accion)
        self.presentViewController(alerta, animated: true, completion: nil)
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(self.boton==2){
        var lista : ListaNotas = segue.destinationViewController as! ListaNotas
            lista.nombreEstu=txtNombre.text!
        }else{
            print("Entro aca")
        }
        
    }
    
    @IBAction func Visualizar(sender: AnyObject) {
        self.boton = 2
        if (txtNombre.text! == ""){
            self.alerta()
        }else{
            
        }
    }
    
    
    @IBAction func Matricular(sender: AnyObject) {
        self.boton=3
        print("PROBANDO ESTO")
    }
    
    
    
    @IBOutlet weak var txtMateria: UITextField!
    @IBOutlet weak var txtNota: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    
}

