//
//  FavoritesViewController.swift
//  NurseCountryApp
//  Created by Nurse Ntombi Masango on 2023/01/02.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var favoriteTable: UITableView!
    var favoriteArray = CountryCollectionViewCell.self
    
    var rowsWithNames = UserDefaults.standard.stringArray(forKey: "selectedFavorite")
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.delegate =  self
        favoriteTable.dataSource = self
        title = "Favourites"
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsWithNames?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = rowsWithNames?[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
}
