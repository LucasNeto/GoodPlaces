//
//  ListPlaceTableViewCell.swift
//  GoodPlaces
//
//  Created by Lucas  N Santana on 03/12/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import UIKit

class ListPlaceTableViewCell: UITableViewCell {
    //MARK: - Variables Data
    var title: String = "" {
        didSet {
            titleLbl.text = title
        }
    }
    var status: String = "" {
        didSet {
            statusLbl.text = "Status: \(status)"
        }
    }
    var ratingText: String = ""{
        didSet {
            starsLbl.text = ratingText
        }
    }
    var distance: String = "" {
        didSet {
            distanceLbl.text = "km: \(distance)"
        }
    }
    
    //MARK: - Variables Views
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Place title"
        return label
    }()
    private let statusLbl: UILabel = {
        let label = UILabel()
        label.text = "Status: -"
        label.textColor = .gray
        return label
    }()
    private let starImg: UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "star.fill"))
        imgView.tintColor = .systemYellow
        return imgView
    }()
    private let starsLbl: UILabel = {
        let label = UILabel()
        label.text = "5"
        return label
    }()
    private let distanceLbl: UILabel = {
        let label = UILabel()
        label.text = "km: -"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    private func setupViews(){
        addSubViews()
        setupConstraints()
        
    }
    private func addSubViews(){
        self.addSubview(titleLbl)
        self.addSubview(statusLbl)
        self.addSubview(starImg)
        self.addSubview(starsLbl)
        self.addSubview(distanceLbl)
    }
    private func setupConstraints(){
        titleLbl.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, enableInsets: false)
        statusLbl.anchor(top: titleLbl.bottomAnchor, left: titleLbl.leftAnchor, bottom: nil, right: titleLbl.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        starImg.anchor(top: statusLbl.bottomAnchor, left: statusLbl.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 16, paddingRight: 0, width: 24, height: 24, enableInsets: false)
        starsLbl.anchor(top: starImg.topAnchor, left: starImg.rightAnchor, bottom: starImg.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, enableInsets: false)
        distanceLbl.anchor(top: starImg.topAnchor, left: starsLbl.rightAnchor, bottom: starImg.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, enableInsets: false)
        
    }
}
