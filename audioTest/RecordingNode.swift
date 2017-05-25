//
//  RecordingNode.swift
//  audioTest
//
//  Created by Cheer on 2017/5/25.
//  Copyright © 2017年 joekoe. All rights reserved.
//

import UIKit
import AudioKit

class RecordingNode: UIView,PlayAble,MixAble,RecordAble{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        recordingNode(with: "nyanCat.wav")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var player:AKAudioPlayer!
    
    func mix() {
        let tpMixer = AKTimePitch(player)
        
        //播放速度
        tpMixer.rate = 0.5
        //音高
        tpMixer.pitch = 300.0
        //重叠
        tpMixer.overlap = 8.0
        
        AudioKit.output = tpMixer
        AudioKit.start()
    }
    
    func recordingNode(with name:String){
        do
        {
            var mSelf = self
            if try mSelf.setUp(with: name){
                mix()
                player.play()
                try record(with: 30)
            }
        }
        catch{
            print(error)
        }
    }
}


