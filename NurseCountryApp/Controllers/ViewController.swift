//
//  ViewController.swift
//  NurseCountryApp
//
//  Created by Nurse Ntombi Masango on 2022/12/19.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var favouriteCountries: UIButton!
    @IBOutlet weak var countrySearchBar: UISearchBar!
    @IBOutlet weak var countryCollection: UICollectionView!

    var countriesArray: CountryInfo?
    var countriesArrayShuffled: CountryInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startServiceCall()
        countryCollection.delegate = self
        countryCollection.dataSource = self
        countrySearchBar.delegate = self
        countryCollection.collectionViewLayout = layout()
        countryCollection.register(UINib(nibName: "CountryCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CountryCollectionViewCell")
    }
    
    
    @IBAction func favoriteCountriesTapped(_ sender: Any) {
        let test = UserDefaults.standard.stringArray(forKey: "selectedFavorite")
    }
    
    
    func startServiceCall() {
        ServiceCall.shared.getCountries() { response in
            self.countriesArray = response
            self.countriesArrayShuffled = response?.shuffled()
            DispatchQueue.main.async {
                self.countryCollection.reloadData()
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText
        if text.isEmpty {
            self.countryCollection.reloadData()
        } else {
            ServiceCall.shared.getNames(name: text) { response in
                self.countriesArray = response
                self.countriesArrayShuffled = response?.shuffled()
                DispatchQueue.main.async {
                    self.countryCollection.reloadData()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countriesArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var rowsWhichAreChecked = UserDefaults.standard.array(forKey: "selectedFavorite") as? [String] ?? [String]()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCollectionViewCell", for: indexPath) as! CountryCollectionViewCell
        let item = countriesArrayShuffled?[indexPath.item]
        cell.imgLabel.text = item?.flag
        cell.countryNameLabel.text = item?.name?.common

        if rowsWhichAreChecked.contains(item?.name?.common ?? "") {
            cell.favoriteButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        } else {
            cell.favoriteButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        }

        cell.favButtonPressed = { [ weak self ] in
            if rowsWhichAreChecked.contains(item?.name?.common ?? "") {
                let removeFave = rowsWhichAreChecked.lastIndex(of: (item?.name?.common)!)
                rowsWhichAreChecked.remove(at: (removeFave!) as Int)
                cell.favoriteButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
            } else {
                cell.favoriteButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
                rowsWhichAreChecked.append(item?.name?.common ?? "")
            }

            UserDefaults.standard.set(rowsWhichAreChecked, forKey: "selectedFavorite")
            self?.countryCollection.reloadData()
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailCountryViewController
        let index = countriesArrayShuffled?[indexPath.item]
        vc.country = index
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
