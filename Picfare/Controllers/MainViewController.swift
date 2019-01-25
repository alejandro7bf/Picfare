//
//  MainViewController.swift
//  Picfare
//
//  Created by Alejandro on 1/21/19.
//  Copyright © 2019 Picfare. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{
    
   
    let URL_PREFIX = "https://image.tmdb.org/t/p/w200/"
    var Group = ["Up Coming", "Popular", "Top Rated"]
    
    @IBOutlet weak var TableData: UITableView!
    
    var dataTP: [Movie] = []
    var dataPO: [Movie] = []
    var dataUP: [Movie] = []

    var movieToDetail = Movie()
    
    let color = #colorLiteral(red: 0.0709286711, green: 0.07564300278, blue: 0.08315775233, alpha: 1)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Calls the function load data with its own object
            loadData(movie: UpComing())
            loadData(movie: Popular())
            loadData(movie: TopRated())
        
        //Delegates
        self.TableData.delegate = self
        self.TableData.dataSource = self
        
        //UI design
   
        self.TableData.rowHeight = 300
        self.TableData.backgroundColor = color
        self.view.backgroundColor = color
        self.TableData.separatorColor = color
        
      
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    //Load the data for each object upcoming, popular and toprated.
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
    
    
    //For each cell of the table view do this ->
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = TableData.dequeueReusableCell(withIdentifier: "HomeTableCell") as! HomeTableCell
        
        let value = Group[indexPath.row]
        cell.Group?.text = value

        cell.CollectionRow.delegate = self
        cell.CollectionRow.dataSource = self
        cell.CollectionRow.tag = indexPath.row
        cell.CollectionRow.reloadData()
        
         cell.backgroundColor = color
        cell.CollectionRow.backgroundColor = color
        
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
    
    //For each cell the collection view inside table view do this ->
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
    
    //load the info that the cell contains
    func loadcell (List: Array<Movie>, index: IndexPath, cell: HomeCell) -> HomeCell {
        
        let movie = List[index.row]
        let link: URL = NSURL(string: URL_PREFIX + movie.poster_path!)! as URL
        cell.poster?.load_image(url: link)
        return cell
    }
    
    //If its selected a cell in a collection view, also check wichk cell from table view.
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
    
    //Prepare the segue for sending the object movie with its own info.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is DetailViewController
        {
            let Detail = segue.destination as? DetailViewController
            Detail?.movie = self.movieToDetail
        }
    }
 
  
    
}






