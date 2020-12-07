//
//  BaseViewController.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 05/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
import UIKit

protocol BaseViewControllerProtocol: class {
    var activityIndicator: UIActivityIndicatorView? { get set }
    func displayAlert(viewModel: AlertViewModel)
    func displayLoading()
    func hideLoading()
}
extension BaseViewControllerProtocol where Self:UIViewController {
    
    func displayAlert(viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: viewModel.buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
extension BaseViewControllerProtocol where Self:UIViewController {
    func displayLoading(){
        activityIndicator?.startAnimating()
    }
    func hideLoading(){
        activityIndicator?.stopAnimating()
    }
    func setupLoadingView(){
        let size: CGFloat = 24
        let x = self.view.bounds.midX-(size/2)
        let y = self.view.bounds.midY-size
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: x, y: y, width: size, height: size))
        activityIndicator?.hidesWhenStopped = true
        guard let activityIndicator = activityIndicator else { return }
        self.view.addSubview(activityIndicator)
    }
}
extension BaseViewControllerProtocol where Self:UITableViewController {
    func displayLoading(){
        if !(self.tableView.refreshControl?.isRefreshing ?? false) {
            activityIndicator?.startAnimating()
        }
    }
    func hideLoading(){
        self.tableView.refreshControl?.endRefreshing()
        activityIndicator?.stopAnimating()
    }
    func setupLoadingView(){
        let size: CGFloat = 24
        let x = self.view.bounds.midX-(size/2)
        let y = self.view.bounds.midY-size
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: x, y: y, width: size, height: size))
        activityIndicator?.hidesWhenStopped = true
        guard let activityIndicator = activityIndicator else { return }
        self.view.addSubview(activityIndicator)
    }
}
