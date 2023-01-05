//
//  ViewController.swift
//  DejavuExample
//
//  Created by Матвей Корепанов on 05.01.2023.
//

import UIKit
import Dejavu

class ViewController: UIViewController {

    var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    
    var path: String!
    
    var dejavu: Dejavu!
    
    var page: Int = -1
    
    
    @objc
    func incPage() {
        if dejavu.pageCount == page {
            page = 0
        }
        page += 1
        guard let image =  try? dejavu.image(for: page, dpi: 300) else {
            print("Parse Error")
            return
        }
        
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
        
        guard let path = Bundle.main.path(forResource: "Download", ofType: "djvu") else {
            print("Path error")
            return
        }
        
        guard let dejavu = try? Dejavu(path: path) else {
                print("Dejavu Error")
                return
        }
        
        self.path = path
        self.dejavu = dejavu
    
        incPage()
   
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, constant: -16)
        ])
        let gestureDetector = UITapGestureRecognizer(target: self, action: #selector(incPage))
        view.addGestureRecognizer(gestureDetector)
    }


}

