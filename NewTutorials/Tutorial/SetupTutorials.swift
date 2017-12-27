//  Copyright © 2017 Oath. All rights reserved.

import UIKit
import OneMobileSDK
import PlayerControls


func setupPlayingVideos(tutorialCasesViewController: TutorialCasesViewController) {
    tutorialCasesViewController.props = .init(
        rows: [.init(name: "Single video",
                     select: { $0.props.player = singleVideo() }),
               .init(name: "Array of videos",
                     select: { $0.props.player = arrayOfVideos() }),
               .init(name: "Video playlist",
                     select: { $0.props.player = videoPlaylist() }),
               .init(name: "Muted video",
                     select: { $0.props.player = mutedVideo() }),
               .init(name: "Video without autoplay",
                     select: { $0.props.player = videoWithoutAutoplay() })])
}

func setupCustomUX(tutorialCasesViewController: TutorialCasesViewController) {
    func customColors(wrapper: PlayerViewControllerWrapper) {
        wrapper.props.player = singleVideo()
        wrapper.props.controls.color = UIColor.magenta
    }
    
    func customSidebar(wrapper: PlayerViewControllerWrapper) {
        wrapper.props.player = singleVideo()
        wrapper.props.controls.sidebarProps = [.init(isEnabled: true,
                                                     isSelected: false,
                                                     icons: .init(normal: UIImage(named: "icon-fav")!,
                                                                  selected: UIImage(named: "icon-fav-active")!,
                                                                  highlighted: nil),
                                                     handler: .nop),
                                               .init(isEnabled: true,
                                                     isSelected: false,
                                                     icons: .init(normal: UIImage(named: "icon-share")!,
                                                                  selected: UIImage(named: "icon-share-active")!,
                                                                  highlighted: nil),
                                                     handler: .nop)]
    }
    
    func hiddenControls(wrapper: PlayerViewControllerWrapper) {
        wrapper.props.player = arrayOfVideos()
        wrapper.props.controls.isSomeHidden = true
    }
    
    func liveDotColor(wrapper: PlayerViewControllerWrapper) {
        wrapper.props.player = liveVideo()
        wrapper.props.controls.liveDotColor = UIColor.red
    }
    
    func filteredSubtitles(wrapper: PlayerViewControllerWrapper) {
        wrapper.props.player = subtitlesVideo()
        wrapper.props.controls.isFilteredSubtitles = true
    }
    
    tutorialCasesViewController.props = .init(
        rows: [.init(name: "Custom color",
                     select: customColors),
               .init(name: "Custom sidebar",
                     select: customSidebar),
               .init(name: "Hidden 10s seek and settings",
                     select: hiddenControls),
               .init(name: "Live dot color",
                     select: liveDotColor),
               .init(name: "Filtered subtitles",
                     select: filteredSubtitles)])
}
