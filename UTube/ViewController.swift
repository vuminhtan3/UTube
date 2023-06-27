//
//  ViewController.swift
//  UTube
//
//  Created by Minh Tan Vu on 22/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        registerCell(cellID: Constants.videoCellId)
        model.getVideo()
    }
    
    func registerCell(cellID: String) {
        let nib = UINib(nibName: cellID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellID)
    }

}

//MARK: - Model Delegate
extension ViewController: ModelDelegate {
    func videoFetched(_ videos: [Video]) {
        self.videos = videos
        tableView.reloadData()
    }
}

//MARK: - ViewController Datasource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCellId, for: indexPath) as! VideoTableViewCell
        cell.setCell(videos[indexPath.row])
        
        
//        let title = self.videos[indexPath.row].title
//        var config = UIListContentConfiguration.cell()
//        config.text = title
//        cell.contentConfiguration = config
        
        return cell
    }
}

//MARK: - TableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
