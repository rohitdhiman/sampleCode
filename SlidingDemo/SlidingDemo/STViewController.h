//
//  STViewController.h
//  SlidingDemo
//
//  Created by Sagar R. Kothari on 01/10/12.
//  Copyright (c) 2012 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *vBottom;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (nonatomic, readwrite, getter = isSlidingView) BOOL slidingView;

@end
