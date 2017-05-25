//
//  Protocal.swift
//  audioTest
//
//  Created by Cheer on 2017/5/25.
//  Copyright © 2017年 joekoe. All rights reserved.
//

import AudioKit

////播放协议
protocol PlayAble {
    var player:AKAudioPlayer! {get set}
    mutating func setUp(with name:String) throws -> Bool
}
extension PlayAble{
    mutating func setUp(with name:String) throws -> Bool{
        if let url = Bundle.main.path(forResource: name.components(separatedBy: ".")[0], ofType: name.components(separatedBy: ".")[1]){
            
            let file = try AKAudioFile(forReading: URL(fileURLWithPath: url))
            player = try AKAudioPlayer(file: file)
            player.looping = true
            return true
        }
        return false
    }
    func play(){
        player.play()
    }
}

//特效协议
protocol MixAble {
    func mix()
}


//录制协议
protocol RecordAble {
    func record(with duration:TimeInterval) throws
}

extension RecordAble{
    func record(with duration:TimeInterval) throws {
        
        let recorder = try AKNodeRecorder(node: AudioKit.output, file: try AKAudioFile())
        try recorder.record()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
            recorder.stop()
            print(recorder.audioFile?.directoryPath)
        })
    }
}
