//
//  AboutVC.swift
//  InterviewTaskProject
//
//  Created by Mac Mini on 14/06/21.
//

import UIKit
import SnapKit
import SDWebImage

class AboutVC: UIViewController {

    //#MARK:- Declarations
    var aboutListTableView = UITableView()
    
    var aboutDataArray = [AboutData]()
    
    //#MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    func setupView() {
        
        // Add loader in main window
        window?.addSubview(sLoaderView)
        sLoaderView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.addSubview(self.aboutListTableView)
        
        self.aboutListTableView.snp.makeConstraints { (contraints) in
            contraints.top.equalToSuperview()
            contraints.bottom.equalToSuperview()
            contraints.leading.equalToSuperview()
            contraints.trailing.equalToSuperview()
        }
        
        self.aboutListTableView.register(AboutTVCell.self, forCellReuseIdentifier: "AboutTVCellIndetifier")
        self.aboutListTableView.delegate = self
        self.aboutListTableView.dataSource = self
        self.aboutListTableView.estimatedRowHeight = 100.0
        
        self.getAboutData()
    }
    
    //#MARK:- Network Call
    func getAboutData() {
        
        sLoaderView.startAnimating()
        
        AboutSerViceManager().getAboutData { (response) in
            
            sLoaderView.stopAnimating()
            
            if (response?.rows?.count ?? 0) > 0 {
                self.title = response?.title ?? ""
                self.aboutDataArray = response?.rows ?? [AboutData]()
                self.aboutListTableView.reloadData()
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Data not founf", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        errorCompletion: { (error) in
            
            sLoaderView.stopAnimating()
            
            let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//#MARK:- Extension
extension AboutVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aboutDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutTVCellIndetifier", for: indexPath) as! AboutTVCell
        cell.titleLabel.text = self.aboutDataArray[indexPath.row].title
        cell.descriptionLabel.text = self.aboutDataArray[indexPath.row].descriptionValue
        
        if let imageURL = self.aboutDataArray[indexPath.row].imageHref {
            cell.aboutImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder"), options: [.highPriority, .refreshCached], context: nil)
        }
        else {
            cell.aboutImageView.image = UIImage(named: "placeholder")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
