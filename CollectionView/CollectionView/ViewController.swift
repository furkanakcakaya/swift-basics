//
//  ViewController.swift
//  CollectionView
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let categories = ["Doğa", "Manzara", "İnsan", "Bilgisayar","Kültür", "Ekonomi"]
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        for photo in 1...5{
            photos.append(Photo(image: "\(photo)", text: categories.randomElement()!))
        }
        collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCollectionViewCell")
        collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "secondCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
        return CGSize(width: widthPerItem, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count + 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == photos.count {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else { return UICollectionViewCell() }
            cell.secondLabel.text = "Last"
            return cell
        }else{
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell()}
            let photo = photos[indexPath.row]
            
            cell.myCell.image = UIImage(named: "\(photo.image)")
            cell.myLabel.text = photo.text
            return cell
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    fileprivate func registerCells(){
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCollectionViewCell")
        collectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: "secondCollectionViewCell")
    }
}




struct Photo{
    var image: String
    var text: String
}
