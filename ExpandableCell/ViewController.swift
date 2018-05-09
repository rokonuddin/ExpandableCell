//
//  ViewController.swift
//  ExpandableCell
//
//  Created by Rokon Uddin on 5/9/18.
//  Copyright © 2018 Rokon Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let model1 = CellModel(title: "Equitable versus legal title", detail: """
At common law equitable title is the right to obtain full ownership of property, where another maintains legal title to the property.[4]
""", isExpanded: false)
    
    let model2 = CellModel(title: "Applications", detail: """
In countries with a sophisticated private property system, documents of title are commonly used for
""", isExpanded: false)
    
    let model3 = CellModel(title: "Political issues", detail: """
California prevented aliens (mainly Asians) from holding title to land until the law was declared unconstitutional in 1952. Currently there are no restrictions on foreign ownership of land in the United States, although sales of real estate by non-resident aliens are subject to certain special taxation rules.
""", isExpanded: false)
    
    let model4 = CellModel(title: "Aboriginal title", detail: """
Prior to the establishment of the United States title to Indian lands in lands controlled by Britain in North America was governed by The Royal Proclamation of October 7, 1763. This proclamation by King George III reserved title in land to the Indians, subject to alienation only by the Crown. This continued to be the law of Canada following the American Revolution
""", isExpanded: false)
    
    let model5 = CellModel(title: "Hello", detail: """
How do you do?. How was lunch?
""", isExpanded: false)
    let model6 = CellModel(title: "Bye", detail: """
Where are goods in goodbyes
""", isExpanded: false)
    
    let model7 = CellModel(title: "Aboriginal title", detail: """
Prior to the establishment of the United States title to Indian lands in lands controlled by Britain in North America was governed by The Royal Proclamation of October 7, 1763. This proclamation by King George III reserved title in land to the Indians, subject to alienation only by the Crown. This continued to be the law of Canada following the American Revolution
""", isExpanded: false)
    
    let model8 = CellModel(title: "Aboriginal title", detail: """
Prior to the establishment of the United States title to Indian lands in lands controlled by Britain in North America was governed by The Royal Proclamation of October 7, 1763. This proclamation by King George III reserved title in land to the Indians, subject to alienation only by the Crown. This continued to be the law of Canada following the American Revolution
""", isExpanded: false)
    
    let model9 = CellModel(title: "Aboriginal title", detail: """
Prior to the establishment of the United States title to Indian lands in lands controlled by Britain in North America was governed by The Royal Proclamation of October 7, 1763. This proclamation by King George III reserved title in land to the Indians, subject to alienation only by the Crown. This continued to be the law of Canada following the American Revolution
""", isExpanded: false)
    
    let model10 = CellModel(title: "Aboriginal title", detail: """
Prior to the establishment of the United States title to Indian lands in lands controlled by Britain in North America was governed by The Royal Proclamation of October 7, 1763. This proclamation by King George III reserved title in land to the Indians, subject to alienation only by the Crown. This continued to be the law of Canada following the American Revolution
""", isExpanded: false)
    
    
    
    var cellModelArray: [CellModel] = [ ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellModelArray = [model1, model2, model3, model4, model5, model6, model7, model8, model9, model10]
        tableView.reloadData()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 600
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModelArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ExpandableTableViewCell else {
            fatalError("Could not load cell")
        }
        let cellModel = cellModelArray[indexPath.row]
        cell.bindModel(cellModel)
        cell.delegate = self
        return cell
    }
}

extension ViewController: ExpandableTableViewCellDelegate {
    func expandButtonPassedOnCell(_ cell: ExpandableTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        let item = cellModelArray[indexPath.row]
        item.isExpanded = !item.isExpanded
        cell.arrowButton.tag = Int(truncating: NSNumber(booleanLiteral: item.isExpanded))
        tableView.reloadRows(at: [indexPath], with: .fade)
        if tableView.isLastCell(indexPath: indexPath) {
            tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
    }
}

extension UITableView {
    func isLastCell(indexPath: IndexPath) -> Bool {
        let totalSections = numberOfSections
        let totalRowForSection = numberOfRows(inSection: indexPath.section)
        if (indexPath.section == totalSections - 1)
            && (indexPath.row == totalRowForSection - 1 ){
            return true
        }
        return false
    }
    
    func isLastCellForSection(indexPath: IndexPath) -> Bool {
        let totalRowForSection = numberOfRows(inSection: indexPath.section)
        if (indexPath.row == totalRowForSection - 1 ){
            return true
        }
        return false
    }
}

