//
//  alertFunc.swift
//  WebGiris
//
//  Created by Vural Ozsen on 16.10.2016.
//  Copyright © 2016 Vural Ozsen. All rights reserved.
//

import Foundation
import UIKit


class popUpMesaj{

   static func showAlertMsg(viewController : ViewController){
   
        
    let title  = " Giriş Yapılamadı! "
    let mesaj = " Kullanıcı adınızı ya da şifrenizi hatalı girdiniz"
    let alertController = UIAlertController(title: title, message: mesaj, preferredStyle: .alert)
    let alert = UIAlertAction(title: "Tamam", style: .default, handler: nil)
    alertController.addAction(alert)
    viewController.present(alertController, animated: true, completion: nil)
        
        

}
    
}
