//
//  HomeViewController.swift
//  Picfare
//
//  Created by Alejandro on 1/20/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{//, UICollectionViewDelegate, UICollectionViewDataSource{
    
    /*
    
    @IBOutlet weak var TableViewRow: HomeTableCell!
    
    
    @IBOutlet weak var TableData: UICollectionView!
    
   
    @IBOutlet weak var TableData2: UICollectionView!
    
    
    @IBOutlet weak var TableData3: UICollectionView!
    
    
    var dataTP: [Movie] = []
    var dataPO: [Movie] = []
    var dataUP: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableData.delegate = self
        TableData.dataSource = self
        
        TableData2.delegate = self
        TableData2.dataSource = self
        
        TableData3.delegate = self
        TableData3.dataSource = self
     
        loadData()
        
  
 
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
            self.TableData2.reloadData()
        }
        
        let mov3 = UpComing()
        mov3.load_data { (response) in
            for item in response{
                self.dataUP.append(item)
            }
            self.TableData3.reloadData()
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if collectionView == self.TableData{
            return dataTP.count
        }else if collectionView == self.TableData2{
            return dataPO.count
        }else{
            return dataUP.count
        }
        
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.TableData{
            
        let cell = TableData.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let text = dataTP[indexPath.row]
     
        cell.poster.load_image(url: NSURL(string: "https://image.tmdb.org/t/p/w200/"+text.poster_path!)! as URL)
        
        return cell
            
        
        }else if collectionView == self.TableData2{
            let cell2 = TableData2.dequeueReusableCell(withReuseIdentifier: "HomeCell2", for: indexPath) as! HomeCell2
            let text = dataPO[indexPath.row]
            
            cell2.poster2.load_image(url: NSURL(string: "https://image.tmdb.org/t/p/w200/"+text.poster_path!)! as URL)
            
            return cell2
        }else{
            let cell3 = TableData3.dequeueReusableCell(withReuseIdentifier: "HomeCell3", for: indexPath) as! HomeCell3
            let text = dataUP[indexPath.row]
            
            cell3.poster3.load_image(url: NSURL(string: "https://image.tmdb.org/t/p/w200/"+text.poster_path!)! as URL)
            
            return cell3
            
        }
        
    }
    
    
 

 
*/
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
