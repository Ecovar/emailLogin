//
//  veriCekTableViewController.swift
//  WebGiris
//
//  Created by Vural Ozsen on 24.10.2016.
//  Copyright © 2016 Vural Ozsen. All rights reserved.
//

import UIKit
import FirebaseDatabase
//import FirebaseAuth


struct postst {
    
    let name : String!
    let surname : String!
}


class veriCekTableViewController: UITableViewController {
  
    var postData = [postst]()
    
    var ref : FIRDatabaseReference?
    
   
        override func viewDidLoad() {
        super.viewDidLoad()
       
                        
            
       // FIRAuth.auth()?.signIn(withEmail: "v@v.com", password: "sersem") { (user, error) in
               
            //}
            
        ref = FIRDatabase.database().reference()
        ref?.child("Rehber").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
        
          //  let value = snapshot.value as? NSDictionary
            //  let username = value?["username"] as? String ?? ""
          //  let user = User.init(username: username)
            
            let deger = snapshot.value as? NSDictionary
            let veri = deger?["adi"] as? String 
            let veri2 = deger?["soyadi"] as? String
           // let post = snapshot.value!["Adınız"]
            //let post2 = snapshot.value!["Soyadınız"] as? String
           
            self.postData.insert(postst(name: veri, surname: veri2), at: 0)
            self.tableView.reloadData()
        
           })
    }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      //  return postData.count
    //}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

       let label1 = cell.viewWithTag(1) as! UILabel
        label1.text = postData[indexPath.row].name
        let label2 = cell.viewWithTag(2) as! UILabel
        label2.text = postData[indexPath.row].surname
        
        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    }
