//
//  ViewTestingController.h
//  NELGStats
//
//  Created by Murali Raghuram on 9/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NGBarChartView.h"
@interface ViewTestingController : UIViewController <NGBarChartViewDataSource, NGBarChartViewDelegate>{
	@private
	NSArray *barItems;
}


@property (nonatomic, strong) IBOutlet NGBarChartView *barChartView;
@property (nonatomic, strong) NGBarChartView *barChartView2;

@end

