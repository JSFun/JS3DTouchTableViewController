//
//  JS3DTouchTableViewController.swift
//  HardCast
//
//  Created by Jann Schafranek on 10.04.17.
//  Copyright © 2017 JSFun. All rights reserved.
//

import UIKit

class JS3DTouchTableViewController: UITableViewController, UIViewControllerPreviewingDelegate {
    var previewingContext:UIViewControllerPreviewing?
    var presentsComittedViewControllers:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.previewingContext = self.registerForPreviewing(with: self, sourceView: self.tableView)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = self.tableView.indexPathForRow(at: location){
            previewingContext.sourceRect = self.tableView.rectForRow(at: indexPath)
            return self.tableView(self.tableView, peekViewControllerForRowAt: indexPath)
        }
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if presentsComittedViewControllers{
            self.present(viewControllerToCommit, animated: true, completion: nil)
        }else{
            self.navigationController?.show(viewControllerToCommit, sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, peekViewControllerForRowAt indexPath: IndexPath) -> UIViewController? {
        fatalError("tableView(tableView:, peekViewControllerForRowAt:) not implemented in JS3DTouchTableViewController subclass")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        fatalError("numberOfSections not implemented in JS3DTouchTableViewController subclass")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("numberOfRows not implemented in JS3DTouchTableViewController subclass")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
