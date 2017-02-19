//
//  ViewController.m
//  faceDetect
//
//  Created by zsr on 2017/2/12.
//  Copyright © 2017年 zsr. All rights reserved.
//

#import "ViewController.h"
#import "SRFaceFeature.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self DetectFace];
}

-(void)DetectFace
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIImage* image = [UIImage imageNamed:@"1"];
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, screenWidth, screenWidth * imageHeight / imageWidth);
    [self.view addSubview:imageView];
    NSArray* features = [SRFaceManager featuresInImage:image withScale:screenWidth / imageWidth];
    for (SRFaceFeature *face in features) {
        
        CGFloat faceWidth = face.bounds.size.width;
        UIView* faceView = [[UIView alloc] initWithFrame:face.bounds];
        faceView.layer.borderWidth = 1;
        faceView.layer.borderColor = [[UIColor redColor] CGColor];
        [self.view addSubview:faceView];
        if(face.hasLeftEyePosition)
            
        {
            UIView* leftEyeView = [[UIView alloc] initWithFrame: CGRectMake(face.leftEyePosition.x-faceWidth*0.15, face.leftEyePosition.y-faceWidth*0.15, faceWidth*0.3, faceWidth*0.3)];

            [leftEyeView setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
            [leftEyeView setCenter:face.leftEyePosition];
            leftEyeView.layer.cornerRadius = faceWidth*0.15;
            [self.view  addSubview:leftEyeView];
        }
        
        if(face.hasRightEyePosition)
            
        {
            UIView* leftEye = [[UIView alloc] initWithFrame:
                               CGRectMake(face.rightEyePosition.x-faceWidth*0.15,
                                          face.rightEyePosition.y-faceWidth*0.15, faceWidth*0.3, faceWidth*0.3)];
            
            [leftEye setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.3]];
            [leftEye setCenter:face.rightEyePosition];
            leftEye.layer.cornerRadius = faceWidth*0.15;
            [self.view  addSubview:leftEye];
        }
        
        if(face.hasMouthPosition)
        {
            UIView* mouth = [[UIView alloc] initWithFrame:
                             CGRectMake(face.mouthPosition.x-faceWidth*0.2,
                                        face.mouthPosition.y-faceWidth*0.2, faceWidth*0.4, faceWidth*0.4)];
            [mouth setBackgroundColor:[[UIColor greenColor]
                                       colorWithAlphaComponent:0.3]];
            [mouth setCenter:face.mouthPosition];
            mouth.layer.cornerRadius = faceWidth*0.2;
            [self.view  addSubview:mouth];
        }
    }
    
}

@end
