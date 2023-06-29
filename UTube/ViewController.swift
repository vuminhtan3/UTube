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
        registerCell(cellID: Constants.VIDEO_CELL_ID)
        model.getVideo()
    }
    
    func registerCell(cellID: String) {
        let nib = UINib(nibName: cellID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellID)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL_ID, for: indexPath) as! VideoTableViewCell
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
        
        let selectedVideo = videos[indexPath.row]
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.video = selectedVideo
        navigationController?.pushViewController(detailVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
