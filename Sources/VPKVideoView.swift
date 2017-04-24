//
//  VPKVideoView.swift
//  VideoPlaybackKit
//
//  Created by Sonam on 4/21/17.
//  Copyright © 2017 ustwo. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

public class VPKVideoView: UIView {
    
    private let presenter = VPKVideoViewPresenter()
    public let actionButton = UIButton()
    
    //private
    private let activityIndicator = UIActivityIndicatorView(frame: .zero)
    private let placeHolder = UIImageView(frame: .zero)
    private var playerLayer: AVPlayerLayer?
    private let tap = UITapGestureRecognizer()
    
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*//MARK: UI
    func setup() {
        tap.delegate = self
        tap.addTarget(self, action: #selector(didTapPlayButton))
        addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 1
        
        addSubview(placeHolder)
        placeHolder.backgroundColor = .white
        placeHolder.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        addSubview(playButton)
        playButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.snp.center)
            make.width.height.equalTo(80)
        }
        playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
        playButton.layer.zPosition = LayerHierachy.middle.rawValue
        
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(self.snp.center)
        }
        activityIndicator.color = .white
        activityIndicator.layer.zPosition = LayerHierachy.top.rawValue
    }
    
    
    //MARK: Configuration
    func configure(model: VideoPlayerModel, manager: VideoPlayerManager) {
        self.playerModel = model
        self.videoManager = manager
        
        //TODO: Add placeholder images
        let progressQueue = DispatchQueue(label: "progress")
        activityIndicator.startAnimating()
        placeHolder.af_setImage(withURL: model.placeHolderImageURL, placeholderImage: nil, filter: nil, progress: nil, progressQueue: progressQueue, imageTransition: UIImageView.ImageTransition.noTransition, runImageTransitionIfCached: false, completion: { [weak self] image in
            self?.activityIndicator.stopAnimating()
        })
    }
    
    func resetView() {
        placeHolder.image = nil
        placeHolder.layer.zPosition = LayerHierachy.top.rawValue
        placeHolder.fadeIn(time: 0.3, completion: nil) //TODO: Add cross fade animation between placeholder and playerlayer in VideoAnimator
        activityIndicator.stopAnimating()
        VideoViewAnimator.animateVideoPlayerView(self, fromState: .playing, toState: .paused, withCompletion: nil)
    }
    
    //MARK: Actions
    func didTapPlayButton() {
        guard   let model = playerModel,
            let videoManager = self.videoManager else { return }
        
        videoManager.playerDelegate = self
        
        //TODO: Remove this logic, place in manager
        let didTapSameVideo = model.videoURL == videoManager.currentUrl
        
        switch videoManager.playerState {
        case .paused where didTapSameVideo:
            resumePlayingSameVideo()
        case .playing where didTapSameVideo == false:
            playNewVideo(url: model.videoURL)
        case .paused:
            playNewVideo(url: model.videoURL)
        case .playing:
            stopPlayback()
        default:
            stopPlayback()
        }
    }
    
    private func playNewVideo(url: URL) {
        VideoViewAnimator.animateVideoPlayerView(self, fromState: .paused, toState: .playing, withCompletion: {
            self.videoManager?.playVideoUrl(url, withPlaceHolder: self.placeHolder, inView: self, returnedLayer: { [weak self] (playerLayer) in
                guard let currentBounds = self?.bounds else { return }
                playerLayer.frame =  currentBounds
                playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
                playerLayer.isHidden = false
                self?.layer.insertSublayer(playerLayer, below: self?.playButton.layer)
                self?.placeHolder.layer.zPosition = LayerHierachy.middle.rawValue
                playerLayer.zPosition = LayerHierachy.bottom.rawValue
                self?.playerLayer = playerLayer
            })
        })
    }
    
    private func resumePlayingSameVideo() {
        videoManager?.play()
        playButton.fadeOut(time: 0.3, completion: nil)
    }
    
    private func stopPlayback() {
        videoManager?.stop()
        activityIndicator.stopAnimating()
    }
}

//MARK: Video Manager Callbacks
extension VideoPlayerView: VideoPlayerDelegate {
    
    func didStopPlaying() {
        VideoViewAnimator.animateVideoPlayerView(self, fromState: .playing, toState: .paused, withCompletion: nil)
    }
    
    func didStartPlaying() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.placeHolder.fadeOut(time: 0.3, completion: nil)
            self.playButton.fadeOut(time: 0.3, completion: nil)
        }
    }
    
    func didFail(error: Error) {
        //TODO: Handle error state
        print(error)
    }
    
    func didPlayToEnd() {
        resetView()
    }*/
}