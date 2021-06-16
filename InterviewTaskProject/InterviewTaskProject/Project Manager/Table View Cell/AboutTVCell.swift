//
//  AboutTVCell.swift
//  InterviewTaskProject
//
//  Created by Mac Mini on 15/06/21.
//

import UIKit

class AboutTVCell: UITableViewCell {
    
    //#MARK:- Declarations
    var aboutImageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    //#MARK:- Setup Cell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    //#MARK:- Setup Constraint
    func setupCell() {
        self.titleLabel = UILabel(frame: .zero)
        self.titleLabel.textColor = .black
        
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 13.0)
        
        self.aboutImageView.image = UIImage(named: "placeholder")
        self.aboutImageView.clipsToBounds = true
        
        self.contentView.addSubview(aboutImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.clipsToBounds = true
        
        self.aboutImageView.snp.makeConstraints { (contraints) in
            contraints.leading.equalToSuperview().offset(10)
            contraints.width.equalTo(50)
            contraints.height.equalTo(50)
            contraints.top.equalToSuperview().offset(10)
            contraints.bottom.equalToSuperview().offset(-10).priority(350)
        }
        
        titleLabel.snp.makeConstraints { (contraints) in
            contraints.left.equalTo(self.aboutImageView).offset(60)
            contraints.right.equalToSuperview().offset(-10)
            contraints.top.equalToSuperview().offset(10)
        }

        self.descriptionLabel.snp.makeConstraints { (contraints) in
            contraints.left.equalTo(self.titleLabel)
            contraints.right.equalToSuperview().offset(-10)
            contraints.top.equalTo(self.titleLabel).offset(20)
            contraints.bottom.equalToSuperview().offset(-10).priority(999)
        }
    }
}
