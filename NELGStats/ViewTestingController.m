//
//  ViewTestingController.m
//  NELGStats
//
//  Created by Murali Raghuram on 9/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewTestingController.h"

@implementation ViewTestingController
@synthesize barChartView = barChartView_;
@synthesize barChartView2 = barChartView2_;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		barItems = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:4404], [NSNumber numberWithInt:8170],[NSNumber numberWithInt:1746],[NSNumber numberWithInt:6634],[NSNumber numberWithInt:7409],[NSNumber numberWithInt:7240],[NSNumber numberWithInt:1372],[NSNumber numberWithInt:7726],
					[NSNumber numberWithInt:12272],
					[NSNumber numberWithInt:5504],
					[NSNumber numberWithInt:11056],
					[NSNumber numberWithInt:6301],
					[NSNumber numberWithInt:10475],
					[NSNumber numberWithInt:16133],
					[NSNumber numberWithInt:6415],
					[NSNumber numberWithInt:11000],
					[NSNumber numberWithInt:6982],
					[NSNumber numberWithInt:9203],
					[NSNumber numberWithInt:10183],
					[NSNumber numberWithInt:16156],
					[NSNumber numberWithInt:7974],
					[NSNumber numberWithInt:16867],
					[NSNumber numberWithInt:6086],nil];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - barChartView DataSource
- (NSInteger) numberOfBarsInBarChartView:(NGBarChartView *)barChartView
{
	return barItems.count;
}

- (float) barChartView:(NGBarChartView *)barChartView heightForBarAtIndex:(NSInteger)index
{
	return [[barItems objectAtIndex:index] floatValue];
}

- (float) maximumBarHeightInBarChartView:(NGBarChartView *)barChartView
{
	return [[barItems valueForKeyPath:@"@max.floatValue"] floatValue];
	
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	//	self.barChartView.backgroundColor
	self.barChartView2 = [[NGBarChartView alloc] initWithFrame:CGRectMake(50, 50, 75, 568)];
	self.barChartView2.dataSource = self;
	self.barChartView2.separatorWidth = 3;
	self.barChartView2.barItemWidth = 7;
	[self.view addSubview:self.barChartView2];
	self.barChartView.dataSource = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
