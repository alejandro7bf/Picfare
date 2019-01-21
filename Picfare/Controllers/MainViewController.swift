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
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.TableData.delegate = self
        self.TableData.dataSource = self
        self.TableData.rowHeight = 80
        
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
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        if collectionView.tag == 1{
        cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor =  UIColor.blue
        }
        
        return cell
        
    }
 

}
