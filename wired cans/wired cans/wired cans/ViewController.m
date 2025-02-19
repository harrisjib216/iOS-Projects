//
//  ViewController.m
//  wired cans
//
//  Created by development on 12/11/24.
//

#import "ViewController.h"
#import <AVFAudio/AVAudioEngine.h>
#import <AVFAudio/AVAudioFormat.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // make engine
    AVAudioEngine *engine = [[AVAudioEngine alloc] init];
    NSLog(@"engine\n");
    
    AVAudioInputNode *inputNode = engine.inputNode;
    NSLog(@"inputNode\n");
    
    // todo
    AVAudioFormat *format = [inputNode outputFormatForBus:0];
//    AVAudioFormat *format = [[AVAudioFormat alloc]
//                             initWithCommonFormat:AVAudioPCMFormatInt16
//                             sampleRate:44100.0
//                             channels:1
//                             interleaved:YES];
    NSLog(@"format\n");
    
    // install tap to record
    [inputNode
     installTapOnBus:0
     bufferSize:1024
     format:format
     block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when) {
        NSLog(@"convert\n");
        
        NSData *audioBuffer = [NSData dataWithBytes: buffer.int16ChannelData length: buffer.frameLength * sizeof(int16_t)];
        NSLog(@"audioBuffer\n");
        
        [self uploadPCMData: audioBuffer];
    }];
    NSLog(@"installTapOnBus\n");
    
    // start recording
    NSError *error = nil;
    if (![engine startAndReturnError: &error]) {
        NSLog(@"Error with recording: %@", error.localizedDescription);
    }
}

- (void) uploadPCMData:(NSData*) audioBuffer {
    NSLog(@"uploadPCMData\n");
}




@end
