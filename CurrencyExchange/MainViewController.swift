//
//  MainViewController.swift
//  CurrencyExchange
//
//  Created by S2H on 2018. 6. 7..
//  Copyright © 2018년 S2H. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var currency = [CurrencyData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        downloadJSON()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = currency[indexPath.row].cur_nm
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.currency = currency[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    
    
    func downloadJSON() {
        
        let jsonURL = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=OHtOxoabzlAmw7iv7WH8QkWVgW7bVH51&searchdate=20180102&data=AP01"
        

        

        let url = URL(string: jsonURL)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.currency = try JSONDecoder().decode([CurrencyData].self, from: data!)
                    
                    print("success")
                    
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
        
    
    }

 
}
