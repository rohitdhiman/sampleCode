//
//  STViewController.m
//  SlidingDemo
//
//  Created by Sagar R. Kothari on 01/10/12.
//  Copyright (c) 2012 http://sugartin.info. All rights reserved.
//

#import "STViewController.h"

@interface STViewController ()

@end

@implementation STViewController

@synthesize vBottom = _vBottom;
@synthesize imgV = _imgV;
@synthesize slidingView = _slidingView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
	[self setImgV:nil];
	[self setVBottom:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint point = [touch locationInView:self.view];
	CGRect rect = self.imgV.frame;
	BOOL xRange = point.x >= rect.origin.x && point.x<=rect.origin.x+rect.size.width;
	BOOL yRange = point.y >= rect.origin.y && point.y<=rect.origin.y+rect.size.height;
	if(xRange && yRange) {
		self.slidingView=YES;
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if([self isSlidingView]) {
		UITouch *touch = [touches anyObject];
		CGPoint point = [touch locationInView:self.view];
		CGRect rect = self.imgV.frame;
		if((point.y-rect.size.height/2)<0) {
			point = CGPointMake(point.x,rect.size.height/2);
		} else if(((point.y+rect.size.height/2)>self.view.frame.size.height)) {
			point = CGPointMake(point.x,self.view.frame.size.height-rect.size.height/2);
		}
		CGRect newRect = CGRectMake(rect.origin.x, point.y-rect.size.height/2, rect.size.width, rect.size.height);
		self.imgV.frame=newRect;
		self.vBottom.frame=CGRectMake(0, self.imgV.frame.origin.y+self.imgV.frame.size.height, self.vBottom.frame.size.width, self.vBottom.frame.size.height);
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if([self isSlidingView]) {
		self.slidingView=NO;
		UITouch *touch = [touches anyObject];
		CGPoint point = [touch locationInView:self.view];
		[UIView beginAnimations:@"move" context:nil];
		[UIView setAnimationDuration:0.5];
		if(point.y>(self.view.frame.size.height-self.view.frame.size.height/2)) {
			self.imgV.frame=CGRectMake(0, self.view.frame.size.height-self.imgV.frame.size.height, self.imgV.frame.size.width, self.imgV.frame.size.height);
		} else {
			self.imgV.frame=CGRectMake(0, 0, self.imgV.frame.size.width, self.imgV.frame.size.height);
		}
		self.vBottom.frame=CGRectMake(0, self.imgV.frame.origin.y+self.imgV.frame.size.height, self.vBottom.frame.size.width, self.vBottom.frame.size.height);
		[UIView commitAnimations];
	}
}

@end
