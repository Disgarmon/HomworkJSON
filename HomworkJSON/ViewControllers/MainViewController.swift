//
//  ViewController.swift
//  HomworkJSON
//
//  Created by Daniil Lebedev on 08.08.2022.
//

import UIKit

let predictAge = "https://api.agify.io/?name=bella"

class MainViewController: UIViewController {
}

// MARK: - Private Methods
private func successAlert() {
    DispatchQueue.main.async {
        let alert = UIAlertController(
            title: "Success",
            message: "You can see the results in the Debug aria",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
    }
}

private func failedAlert() {
    DispatchQueue.main.async {
        let alert = UIAlertController(
            title: "Failed",
            message: "You can see error in the Debug aria",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
    }
}

extension MainViewController{
    private func getPredict() {
        guard let url = URL(string: predictAge) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
        
            do {
                let course = try JSONDecoder().decode(Predict.self, from: data)
                print(course)
               successAlert()
            } catch let error {
               failedAlert()
                print(error)
            }
        }.resume()
    }
}

