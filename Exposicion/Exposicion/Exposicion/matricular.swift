//
//  matricular.swift
//  Exposicion
//
//  Created by Ingeniería LIS on 31/10/16.
//  Copyright © 2016 Ingeniería LIS. All rights reserved.
//

import Foundation
import UIKit

class matricular: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var nose: UILabel!
    @IBOutlet weak var otro: UISwitch!
    @IBOutlet weak var lblNota: UILabel!
    
    @IBAction func cambio(sender: UISwitch) {
            self.cambioAux(lblNota,sw: self.otro,nota: "2,6")
    }
    
    @IBOutlet weak var cont: UILabel!
    
    var entero : Int = 0
    
    
    
    @IBOutlet weak var sliderCont: UISlider!
    
    func barra (entero:Float) {
        sliderCont.value = sliderCont.value + entero
        cont.text="\(sliderCont.value)"
    }
    
    
    @IBOutlet weak var nota2: UILabel!
    @IBOutlet weak var nota3: UILabel!
    @IBOutlet weak var nota4: UILabel!
    @IBOutlet weak var nota5: UILabel!
    
    @IBOutlet weak var swNota2: UISwitch!
    @IBOutlet weak var swNota3: UISwitch!
    @IBOutlet weak var swNota4: UISwitch!
    @IBOutlet weak var swNota5: UISwitch!
    
    @IBAction func swNotaChange(sender: UISwitch) {
        self.cambioAux(nota2,sw: self.swNota2,nota: "3,5")
    }
    
    @IBAction func swNota3Change(sender: UISwitch) {
        self.cambioAux(nota3,sw: self.swNota3,nota: "5,0")
    }

    @IBAction func swNota4Change(sender: AnyObject) {
        self.cambioAux(nota4,sw: self.swNota4,nota: "3,0")
    }
    
    @IBAction func swNota5Change(sender: AnyObject) {
        self.cambioAux(nota5,sw: self.swNota5,nota: "4,2")
    }
    
    func cambioAux(lbl:UILabel,sw:UISwitch,nota:String){
        if sw.on{
            lbl.text=nota
            self.entero = self.entero + 1
            self.barra(1);
            
        }
        else{
            lbl.text=""
            self.entero = self.entero - 1
            self.barra(-1)
        }
    }
    
    
    func alerta(){
    
        let alerta = UIAlertController(title: "Matricula",
                                       message: "Se han matriculado \(entero)",
                                       preferredStyle: UIAlertControllerStyle.Alert)
        let accion = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alerta.addAction(accion)
        self.presentViewController(alerta, animated: true, completion: nil)
        
    }
    @IBAction func matricular(sender: AnyObject) {
        self.alerta()
    }
    
}
