//
//  MainViewController.swift
//  Picfare
//
//  Created by Alejandro on 1/21/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
 var Group = ["Up Coming", "Popular", "Top Rated"]
    
    @IBOutlet weak var TableData: UITableView!
    
    var dataTP: [Movie] = []
    var dataPO: [Movie] = []
    var dataUP: [Movie] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        self.TableData.delegate = self
        self.TableData.dataSource = self
        self.TableData.rowHeight = 240
        
    }
    
    func loadData(){
        let mov = TopRated()
        mov.load_data { (response) in
            for item in response{
                self.dataTP.append(item)
            }
            self.TableData.reloadData()
        }
        
        let mov2 = Popular()
        mov2.load_data { (response) in
            for item in response{
                self.dataPO.append(item)
            }
           self.TableData.reloadData()
        }
        
        let mov3 = UpComing()
        mov3.load_data { (response) in
            for item in response{
                self.dataUP.append(item)
            }
            self.TableData.reloadData()
        }
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Group.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableData.dequeueReusableCell(withIdentifier: "HomeTableCell") as! HomeTableCell
        let value = Group[indexPath.row]
       
        
       cell.CollectionRow.delegate = self
       cell.CollectionRow.dataSource = self
       cell.CollectionRow.tag = indexPath.row
       cell.CollectionRow.reloadData()
        
        cell.Group?.text = value
      
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView.tag == 0 {
            return dataUP.count
        }else if collectionView.tag == 1 {
            return dataPO.count
        } else {
            return dataTP.count
        }
 
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        if collectionView.tag == 0 {
            let text = dataUP[indexPath.row]
       
            let link: URL = NSURL(string: "https://image.tmdb.org/t/p/w200/"+text.poster_path!)! as URL
            cell.poster?.load_image(url: link)
             return cell
        }else if collectionView.tag == 1 {
            let text = dataPO[indexPath.row]
            let link: URL = NSURL(string: "https://image.tmdb.org/t/p/w200/"+text.poster_path!)! as URL
            cell.poster?.load_image(url: link)
             return cell
        } else {
            let text = dataTP[indexPath.row]
            let link: URL = NSURL(string: "https://image.tmdb.org/t/p/w200/"+text.poster_path!)! as URL
            cell.poster?.load_image(url: link)
             return cell
        }
        
  
        
    }
 

}



extension UIImageView {
    
    func load_image(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}

