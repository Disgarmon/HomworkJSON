//
//  ViewController.swift
//  HomworkJSON
//
//  Created by Daniil Lebedev on 08.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var dogImageView: UIImageView!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet var randomDogButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVS = segue.destination as? SettingsViewController else { return }
        settingsVS.breedLabel = breedLabel.text
        
    }
    
    @IBAction func getRandomDogButtonTapped(_ sender: Any) {
    }
    
}

