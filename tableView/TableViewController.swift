//
//  TableViewController.swift
//  tableView
//
//  Created by Joker on 21.03.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
  //  var arrayName = ["Abbadon", "Underlord", "Alchemist", "Apparat", "Antimag"]
    
   // var arraySurname = ["Lord", "Abyssal", "Troll", "Ancient", "Magina"]

   // var arrayImage = ["abaddon", "abyssal_underlord", "alchemist", "ancient_apparition", "antimage"]

    var arrayPersons = [detail(name:"Dostyk Plaza", imageName: "dostyk", descript: "Dostykimage", lat: 43.233872, long: 76.956924 ),
                        detail(name:"Nedelka",  imageName: "nedelka", descript: "nedelkaimage", lat: 43.243389, long: 76.953442),
                        detail(name:"Shipudim", imageName: "shipudim", descript: "shipudimimage", lat: 43.258387, long: 76.938710)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addPerson(_ sender: Any) {
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = arrayPersons [indexPath.row].name
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = UIImage (named: arrayPersons[indexPath.row].imageName)
        let desHero = cell.viewWithTag(1003) as! UIImageView
        desHero.image = UIImage (named:arrayPersons[indexPath.row].descript)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        detailVC.place = arrayPersons[indexPath.row]
        PlaceinTheCity.place = arrayPersons[indexPath.row]
        navigationController?.show(detailVC, sender: self)
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayPersons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
