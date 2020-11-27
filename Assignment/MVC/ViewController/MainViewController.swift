//
//  MainViewController.swift
//  Assignment
//
//  Created by SHUBHAM DHINGRA on 11/24/20.
//

import UIKit
import Foundation

class MainViewController : UIViewController {

    
    @IBOutlet weak var tableView : UITableView?
    
    var itemsArr : [Item]?
    var isFirstTime : Bool = true
    var tableDataSource : TableViewDataSource?{
        didSet{
            
            tableView?.dataSource = tableDataSource
            tableView?.delegate = tableDataSource
            tableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onViewDidLoad()
    }

    func onViewDidLoad() {
        ServiceManager.shared.getItemsList { (items, error) in
            if error != nil {
                
            }
            else {
                if let items = items {
                    
                    DispatchQueue.main.async {
                        self.itemsArr = items
                        self.reloadTable()
                    }
                   
                }
            }
        }
    }
}


extension MainViewController {
    
    //MARK: - ConfigureTableView
    func configureTableView() {
        
        tableDataSource = TableViewDataSource(items: itemsArr, height: UITableView.automaticDimension , tableView: tableView, cellIdentifier: CellIdentifier.ItemCell.identifier)

        tableDataSource?.configureCellBlock = {(cell, item, indexpath) in
            guard let cell = cell as? ItemCell else {return}
            cell.model = item
        }
        
        tableDataSource?.aRowSelectedListener = {(indexpath,cell) in
            self.didSelect(indexpath.row)
        }
        
    }
    
    func reloadTable() {
        if isFirstTime {
            isFirstTime = !isFirstTime
            configureTableView()
        }
        else {
            tableDataSource?.items = self.itemsArr
            tableView?.reloadData()
        }
    }
    
    func didSelect(_ index : Int) {
       guard let detailsVc = self.storyboard?.instantiateViewController(identifier: StoryboardIdentifier.ItemDetailsViewController.identifier) as? ItemDetailsViewController else {
            return
        }
        detailsVc.model = self.itemsArr?[index]
        self.navigationController?.pushViewController(detailsVc, animated: true)
    }
}




