//
//  DetailPlaceViewController.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 02/12/20.
//  Copyright (c) 2020 Lucas  N Santana. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailPlaceDisplayLogic: BaseViewControllerProtocol {
    func displayDetail(viewModel: DetailPlace.Detail.ViewModel)
}

class DetailPlaceViewController: UIViewController, DetailPlaceDisplayLogic {
    
    var interactor: DetailPlaceBusinessLogic?
    var router: (NSObjectProtocol & DetailPlaceDataPassing)?
    
    //MARK: OBOutlets
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var typesLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var reviewStack: UIStackView!
    
    var activityIndicator: UIActivityIndicatorView?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = DetailPlaceInteractor()
        let presenter = DetailPlacePresenter()
        let router = DetailPlaceRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
        
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        setupLoadingView()
        getDetail()
    }
    
    // MARK: getDetail
    
    func getDetail() {
        interactor?.getDetail()
    }
    
    //MARK: DetailPlaceDisplayLogic
    
    func displayDetail(viewModel: DetailPlace.Detail.ViewModel) {
        iconImg.loadImageFrom(url: viewModel.iconUrl)
        nameLbl.text = viewModel.name
        addressLbl.text = viewModel.address
        distanceLbl.text = viewModel.distance
        typesLbl.text = viewModel.types
        ratingLbl.text = viewModel.rating
        phoneButton.setTitle(viewModel.phoneBtn, for: .normal)
        for review in viewModel.reviews {
            let reviewLbl = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
            reviewLbl.numberOfLines = 0
            reviewLbl.text = review
            reviewStack.addArrangedSubview(reviewLbl)
        }
    }
    
    //MARK: IBActions
    @IBAction func websiteTapped(_ sender: UIButton) {
        interactor?.openWebsite()
    }
    @IBAction func phoneTapped(_ sender: UIButton) {
        interactor?.callPhone()
    }
}
