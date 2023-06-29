//
//  VideoTableViewCell.swift
//  UTube
//
//  Created by Minh Tan Vu on 27/06/2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImgView: UIImageView!
    @IBOutlet weak var channelThumnailImgView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var channelTitleLb: UILabel!
    @IBOutlet weak var viewsCountLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        self.video = v
        
        guard self.video != nil else {return}
        
        //Set title
        self.titleLb.text = video?.title
        
        //Set channel Name label
        self.channelTitleLb.text = video?.channelTitle
        
        //Set view count
        self.viewsCountLb.text = "197k views"
        
        //Set date label
        dateLb.text = DateFormatter.dateFormat(from: video!.publishedAt)
        
        //Set video thumbnail
        guard self.video!.thumbnail != "" else {return}
        
        if let cachedData = CacheMananger.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImgView.image = UIImage(data: cachedData)
            return
        }
        
        //Download the thumbnail data
        let videoThumbnailURL = URL(string: self.video!.thumbnail)
        
        //Get the shared URLSession
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: videoThumbnailURL!) { data, response, error in
            if error == nil || data != nil {
                
                //Save the data into the CacheManager
                CacheMananger.setVideoCache(videoThumbnailURL!.absoluteString, data!)
                
                //Check that the downloaded URL matches the video thumbnail url that this cell currently set to display
                if videoThumbnailURL!.absoluteString != self.video?.thumbnail {
                    //Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImgView.image = image
                }
            }
        }
        
        dataTask.resume()
        
        //Set channel thumbnail
        
        
    }
}
