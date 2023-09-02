//
//  ViewController.swift
//  RealmKakeibo
//
//  Created by 御前政喜 on 2023/08/14.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var items: [ShoppingItem] = []
    var selectedCategory: Category!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItems()
        
        navigationItem.title = selectedCategory.title
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
        return cell
    }
    
    func readItems() -> [ShoppingItem]{
        return Array(realm.objects(ShoppingItem.self).filter("category == %@", selectedCategory!))
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toNewItemView"{
            let newItemViewController = segue.destination as! NewItemViewController
            newItemViewController.category = self.selectedCategory
        }
    }

}

