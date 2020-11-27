//
//  TableViewDataSource.swift
//  Assignment
//
//  Created by SHUBHAM DHINGRA on 11/24/20.
//


import UIKit

typealias  ListCellConfigureBlock = (_ cell : Any , _ item : Any? , _ indexpath: IndexPath?) -> ()
typealias  DidSelectedRow = (_ indexPath : IndexPath , _ cell : Any) -> ()
typealias ViewForHeaderInSection = (_ section : Int) -> UIView?


class TableViewDataSource: NSObject  {
    
    var items : Array<Any>?
    var cellIdentifier : String?
    var tableView  : UITableView?
    var tableViewRowHeight : CGFloat = 44.0
    
    var configureCellBlock : ListCellConfigureBlock?
    var aRowSelectedListener : DidSelectedRow?
    var viewforHeaderInSection : ViewForHeaderInSection?
    var headerHeight : CGFloat? = 0.0
    
    
    init (items : Array<Any>? , height : CGFloat , tableView : UITableView? , cellIdentifier : String?) {
        
        self.tableView = tableView
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.tableViewRowHeight = height
    }
    
    override init() {
        super.init()
    }
}

extension TableViewDataSource : UITableViewDelegate , UITableViewDataSource, UIScrollViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let identifier = cellIdentifier else{
            fatalError("Cell identifier not provided")
        }
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier , for: indexPath) as UITableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if let block = self.configureCellBlock , let item: Any = self.items?[indexPath.row]{
            block(cell , item , indexPath as IndexPath?)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let block = self.aRowSelectedListener, case let cell as Any = tableView.cellForRow(at: indexPath){
            block(indexPath , cell)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableViewRowHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      guard let block = viewforHeaderInSection else {
              return nil
      }
      return block(section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
}
