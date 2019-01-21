//
//  HomeViewController.swift
//  Picfare
//
//  Created by Alejandro on 1/20/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var TableData: UICollectionView!
    
    
    
    var data: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableData.delegate = self
        TableData.dataSource = self
     
        loadData()
 
    }
    
    func loadData(){
        let mov = TopRated()
         mov.load_data { (response) in
            for item in response{
                self.data.append(item)
            }
            self.TableData.reloadData()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("hola,",data.count)
        return data.count
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = TableData.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let text = data[indexPath.row]
      
       cell.Title?.text = text.title
        
        return cell
        
    }
    
    
 

 

}
