//
//  MainViewController.swift
//  Picfare
//
//  Created by Alejandro on 1/21/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
   
     let URL_PREFIX = "https://image.tmdb.org/t/p/w200/"
    var Group = ["Up Coming", "Popular", "Top Rated"]
    
    @IBOutlet weak var TableData: UITableView!
    
    var dataTP: [Movie] = []
    var dataPO: [Movie] = []
    var dataUP: [Movie] = []

    var movieToDetail = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadData(movie: UpComing())
        loadData(movie: Popular())
        loadData(movie: TopRated())
       
  
        self.TableData.delegate = self
        self.TableData.dataSource = self
        self.TableData.rowHeight = 240
        
        self.TableData.backgroundColor = UIColor.black
        self.view.backgroundColor = UIColor.black
        self.TableData.separatorColor = UIColor.black
        
      
        
    }
    
    func loadData(movie: Movie){
        
        movie.load_data { (response) in
            switch (movie){
            case (is UpComing): for item in response{  self.dataUP.append(item)   }
            case (is Popular):  for item in response{  self.dataPO.append(item)   }
            case (is TopRated): for item in response{  self.dataTP.append(item)   }
            default: break
            }
            self.TableData.reloadData()
        }
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Group.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TableData.dequeueReusableCell(withIdentifier: "HomeTableCell") as! HomeTableCell
        
        let value = Group[indexPath.row]
        cell.Group?.text = value

        cell.CollectionRow.delegate = self
        cell.CollectionRow.dataSource = self
        cell.CollectionRow.tag = indexPath.row
        cell.CollectionRow.reloadData()
        cell.backgroundColor = UIColor.black
        
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
        
        
        if (collectionView.tag == 0){
            return loadcell(List: dataUP , index: indexPath, cell: cell)
        } else if (collectionView.tag == 1){
            return loadcell(List: dataPO , index: indexPath, cell: cell)
        }else {
            return loadcell(List: dataTP , index: indexPath, cell: cell)
        }
      
    }
    
    func loadcell (List: Array<Movie>, index: IndexPath, cell: HomeCell) -> HomeCell {
        
        let movie = List[index.row]
        let link: URL = NSURL(string: URL_PREFIX + movie.poster_path!)! as URL
        cell.poster?.load_image(url: link)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
        case (0):
            self.movieToDetail = self.dataUP[indexPath.row]
        case (1):
             self.movieToDetail = self.dataPO[indexPath.row]
        case (2):
             self.movieToDetail = self.dataTP[indexPath.row]
        default: break
        }
        
        self.performSegue(withIdentifier: "showdetail", sender: self.navigationController)

        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is DetailViewController
        {
            let Detail = segue.destination as? DetailViewController
            Detail?.movie = self.movieToDetail
        }
    }
 

    
    
}



extension UIImageView {
    
    func load_image(url: URL) {
        if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
               }
          }
    }
    
}

