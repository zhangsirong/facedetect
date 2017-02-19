//
//  SRFaceFeature.h
//  faceDetect
//
//  Created by zsr on 2017/2/19.
//  Copyright © 2017年 zsr. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import <UIKit/UIKit.h>

@interface SRFaceFeature : NSObject

@property (nonatomic, assign) CGRect bounds;
@property (nonatomic, assign) BOOL hasLeftEyePosition;
@property (nonatomic, assign) CGPoint leftEyePosition;
@property (nonatomic, assign) BOOL hasRightEyePosition;
@property (nonatomic, assign) CGPoint rightEyePosition;
@property (nonatomic, assign) BOOL hasMouthPosition;
@property (nonatomic, assign) CGPoint mouthPosition;

//@property (nonatomic, assign) BOOL hasTrackingID;
//@property (nonatomic, assign) int trackingID;
//@property (nonatomic, assign) BOOL hasTrackingFrameCount;
//@property (nonatomic, assign) int trackingFrameCount;
//
//@property (nonatomic, assign) BOOL hasFaceAngle;
//@property (nonatomic, assign) float faceAngle;

@property (nonatomic, assign) BOOL hasSmile;
@property (nonatomic, assign) BOOL leftEyeClosed;
@property (nonatomic, assign) BOOL rightEyeClosed;

@end


@interface SRFaceManager : NSObject

+ (NSArray<SRFaceFeature *> *)featuresInImage:(UIImage *)image withScale:(CGFloat)scale;

@end
