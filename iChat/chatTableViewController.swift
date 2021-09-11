//
//  chatTableViewController.swift
//  iChat
//
//  Created by Alexander Petrenko on 08.09.2021.
//

import UIKit

class chatTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forwardButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.myRightSideBarButtonItemTapped(_:)))
        
        self.navigationItem.rightBarButtonItem = forwardButton
        
        
    }
    
    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
        {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "chatCollection") as! chatCollectionController
        self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    
}
