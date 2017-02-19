//
//  SRFaceFeature.m
//  faceDetect
//
//  Created by zsr on 2017/2/19.
//  Copyright © 2017年 zsr. All rights reserved.
//

#import "SRFaceFeature.h"

@implementation SRFaceFeature

@end

@implementation SRFaceManager

+ (NSArray<SRFaceFeature *> *)featuresInImage:(UIImage *)image withScale:(CGFloat)scale
{
    CIImage* ciimage = [CIImage imageWithCGImage:image.CGImage];
    NSDictionary* opts = @{CIDetectorAccuracy : CIDetectorAccuracyHigh};
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:opts];
    NSArray* features = [detector featuresInImage:ciimage];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 1, -1);
    transform = CGAffineTransformTranslate(transform, 0, -image.size.height);
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scale, scale);

    NSMutableArray *arrayM = [NSMutableArray array];
    for (CIFaceFeature *faceFeature in features){
        
        SRFaceFeature *face = [[SRFaceFeature alloc] init];
        CGRect faceViewBounds = CGRectApplyAffineTransform(faceFeature.bounds, transform);
        faceViewBounds = CGRectApplyAffineTransform(faceViewBounds, scaleTransform);

        face.bounds = faceViewBounds;
        face.hasLeftEyePosition = faceFeature.hasLeftEyePosition;
        face.hasRightEyePosition = faceFeature.hasRightEyePosition;
        face.hasMouthPosition = faceFeature.hasMouthPosition;
        
        face.hasSmile = faceFeature.hasSmile;
        face.leftEyeClosed = faceFeature.leftEyeClosed;
        face.rightEyeClosed = faceFeature.rightEyeClosed;

        if (face.hasLeftEyePosition) {
            face.leftEyePosition = CGPointApplyAffineTransform(faceFeature.leftEyePosition, transform);
            face.leftEyePosition = CGPointApplyAffineTransform(face.leftEyePosition, scaleTransform);
        }
        
        if (face.hasRightEyePosition) {
            face.rightEyePosition = CGPointApplyAffineTransform(faceFeature.rightEyePosition, transform);
            face.rightEyePosition = CGPointApplyAffineTransform(face.rightEyePosition, scaleTransform);
        }
        
        if (face.hasMouthPosition) {
            face.mouthPosition = CGPointApplyAffineTransform(faceFeature.mouthPosition, transform);
            face.mouthPosition = CGPointApplyAffineTransform(face.mouthPosition, scaleTransform);
        }

        [arrayM addObject:face];
    }
    return arrayM;
}
@end
