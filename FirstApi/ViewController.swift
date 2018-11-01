//
//  ViewController.swift
//  FirstApi
//
//  Created by Alumno on 01/11/18.
//  Copyright © 2018 Mariana Fregoso. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let urlClima = "https://api.openweathermap.org/data/2.5/weather?q=ciudad+obregon&APPID=3326d4de85a204e001116973cc1e557a&units=metric"
    let urlDolar = "https://free.currencyconverterapi.com/api/v5/convert?q=USD_MXN&compact=y"
    @IBOutlet weak var lblGrados: UILabel!
    @IBOutlet weak var aiCargarClima: UIActivityIndicatorView!
    @IBAction func btnActualizar(_ sender: Any) {
        lblGrados.text = "-"
        aiCargarClima.startAnimating()
        
        Alamofire.request(urlClima).responseJSON { response in
            if let dictRespuesta = response.result.value as? NSDictionary {
                
                if let dictMain = dictRespuesta.value(forKey: "main") as? NSDictionary {
                    if let temp = dictMain.value(forKey: "temp") as? Double {
                        self.lblGrados.text = "\(temp)º"
                        self.aiCargarClima.stopAnimating()
                    }
                }
            } else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
        }
    }
    @IBOutlet weak var lblDolares: UILabel!
    @IBOutlet weak var txtPeso: UITextField!
    var pesos : Double = 0
    @IBAction func doTapCambiar(_ sender: Any) {
        pesos = Double(txtPeso.text!)!
        lblDolares.text = "-"
        Alamofire.request(urlDolar).responseJSON { response in
            if let dictRespuesta = response.result.value as? NSDictionary {
                
                if let dictMain = dictRespuesta.value(forKey: "USD_MXN") as? NSDictionary {
                    if let dolar = dictMain.value(forKey: "val") as? Double {
                        self.lblDolares.text = "\(self.pesos*dolar)"
                    }
                }
            } else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(urlClima).responseJSON { response in
            if let dictRespuesta = response.result.value as? NSDictionary {
                
                if let dictMain = dictRespuesta.value(forKey: "main") as? NSDictionary {
                    if let temp = dictMain.value(forKey: "temp") as? Double {
                        self.lblGrados.text = "\(temp)º"
                        self.aiCargarClima.stopAnimating()
                    }
                }
            } else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
