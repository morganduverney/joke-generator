//
//  ViewController.swift
//  JokeGenerator
//
//  Created by Morgan Duverney on 6/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var setup: UILabel!
    @IBOutlet weak var punchline: UILabel!
    @IBAction func generateJoke(_ sender: Any) {
        showNewJoke()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        showNewJoke()
    }
    
    private func showNewJoke() {
        // Use weak self to prevent retain cycle
        API.getJoke { [weak self] (joke) in
            // Use main thread to update UI
            DispatchQueue.main.async {
                // Use joke to update setup and punchline labels on completion
                self?.setup.text = joke.setup
                self?.punchline.text = joke.punchline
            }
        }
    }
}
