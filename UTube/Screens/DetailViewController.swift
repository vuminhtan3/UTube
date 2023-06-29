//
//  DetailViewController.swift
//  UTube
//
//  Created by Minh Tan Vu on 27/06/2023.
//

import UIKit
import YouTubePlayer
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var viewsCountLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var dislikeBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var clipBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!

    @IBOutlet weak var channelThumbailImgView: UIImageView!
    @IBOutlet weak var channelTitleLb: UILabel!
    @IBOutlet weak var subscribesCountLb: UILabel!
    @IBOutlet weak var subscribeBtn: UIButton!
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add gesture for ChannelThumbnail ImageView
        setupChannelThumbnailsTapGesture()
        setupChannelTitleTapGesture()
        setupChannelSubTapGesture()
        
        navigationController?.isNavigationBarHidden = false
    }
    
    func setupChannelThumbnailsTapGesture() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.channelTapped))
        channelThumbailImgView.addGestureRecognizer(tapGR)
        channelThumbailImgView.isUserInteractionEnabled = true
    }
    
    func setupChannelTitleTapGesture() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.channelTapped))
        channelTitleLb.addGestureRecognizer(tapGR)
        channelTitleLb.isUserInteractionEnabled = true
    }
    
    func setupChannelSubTapGesture() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.channelTapped))
        subscribesCountLb.addGestureRecognizer(tapGR)
        subscribesCountLb.isUserInteractionEnabled = true
    }
    
    @objc func channelTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            //Route to channel screen
            print("Route to channel")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Clear the data
        titleLb.text = ""
        viewsCountLb.text = "views"
        dateLb.text = ""
        channelTitleLb.text = ""
        subscribesCountLb.text = ""
        descriptionTextView.text = ""
        
        //Check if there's a video
        guard let video = video else {return}
        
        //Create the embed URL
        let embedURLString = "\(Constants.YT_EMBED_URL)\(video.videoId)"
        
        //Load it into the webview
        let embedURL = URL(string: embedURLString)
        let request = URLRequest(url: embedURL!)
        
        webView.load(request)
        
        //Set Title
        titleLb.text = video.title
        channelTitleLb.text = video.channelTitle
        
        //Set date:
        dateLb.text = DateFormatter.dateFormat(from: video.publishedAt)
        
        descriptionTextView.text = video.description
    }
    
    @IBAction func likeBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func dislikeBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func shareBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func clipBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func subscribeBtnTapped(_ sender: UIButton) {
    }
    
    
}
