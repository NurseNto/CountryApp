//
//  DetailCountryViewController.swift
//  NurseCountryApp
//
//  Created by Nurse Ntombi Masango on 2023/01/02.
//

import UIKit

class DetailCountryViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var languageView: UITextView!
    
    @IBOutlet weak var capitalCity: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    var country: CountryInfoElement?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryImage.downloaded(from: (country?.flags?.png)!)
        countryName.text = country?.name?.common
        countryName.font = .preferredFont(forTextStyle: .title1)
        capitalCity.text = country?.capital?.joined(separator: "\n")
        regionLabel.text = country?.region?.rawValue
        languageView.text = country?.languages?.values.joined(separator: "\n")

    }
}
