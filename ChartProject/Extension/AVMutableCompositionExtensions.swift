//
//  AVMutableCompositionExtensions.swift
//  SetTimer
//
//  Created by Manh Nguyen Ngoc on 02/07/2021.
//

import AVFoundation

extension AVMutableComposition {
    func copyAllTrack(from asset: AVAsset) {
        copyTrack(withType: .audio, from: asset)
        copyTrack(withType: .video, from: asset)
    }
    
    func copyTrack(withType type: AVMediaType, from asset: AVAsset) {
        let tracks = asset.tracks(withMediaType: type)
        for track in tracks {
            let compositionTrack = addMutableTrack(withMediaType: type, preferredTrackID: kCMPersistentTrackID_Invalid)
            compositionTrack?.preferredTransform = tracks.first!.preferredTransform
            compositionTrack?.preferredVolume = tracks.first!.preferredVolume
            try? compositionTrack?.insertTimeRange(track.timeRange, of: track, at: track.timeRange.start)
        }
    }
}
