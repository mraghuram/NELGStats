//
//  NELGStatsTests.m
//  NELGStatsTests
//
//  Created by Murali Raghuram on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>

#import "NGBarChartView.h"
@interface NGBarChartView (Test)
-(CGRect) calculateBarRectForBarItemHeight:(float)barHeight
						  withBarItemWidth:(float)barWidth
					  withNumberOfBarItems:(NSInteger)numberOfItems
							atBarItemIndex:(NSInteger)index;

@end
@interface NELGStatsTests : SenTestCase{
	@private
	NGBarChartView *barChart;
}

@end

@implementation NELGStatsTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
	barChart = [[NGBarChartView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
	STAssertNotNil(barChart, @"Cannot create BarChartView Instance");
	
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}
- (void) testInitWithFrameSetFrame
{
	STAssertEquals(barChart.bounds.size.width, (CGFloat)200, @"width is not set properly");
	STAssertEquals(barChart.bounds.size.height, (CGFloat)100, @"width is not set properly");
}

- (void) testAdditionOfGesture
{
	STAssertNotNil([barChart gestureRecognizers],@"Cannot add gesture recognizer");
}

- (void) testBarWidthReturnsDefaultValue
{
	STAssertEquals(10, barChart.barItemWidth, @"Cannot set the default width of a Bar Item");
}

- (void) testBarWidthReturnsSetValue
{
	barChart.barItemWidth = 20;
	STAssertEquals(20, barChart.barItemWidth, @"Cannot set the default width of a Bar Item");
}

- (void) testCalculatedBarHeightForBarChatWithNoGridLinesAndNoTitle
{
	id mockDatasource = [OCMockObject mockForProtocol:@protocol(NGBarChartViewDataSource)];
	CGFloat maxValue = 50.0;
	barChart.dataSource = mockDatasource;
	[[[mockDatasource expect] andReturnValue:OCMOCK_VALUE(maxValue)] maximumBarHeightInBarChartView:barChart];
	CGRect r = [barChart calculateBarRectForBarItemHeight:10 withBarItemWidth:10 withNumberOfBarItems:4 atBarItemIndex:1];
	STAssertEquals(r.size.height, (CGFloat)16, @"Cannot calculate the correct height for the Bar Item at Index 1");
	STAssertEquals(r.size.width, (CGFloat)10, @"Cannot calculate the correct height for the Bar Item at Index 1");
	[mockDatasource verify];
}

/*- (void) testCalculatedBarHeightForBarChatWithGridLinesAndNoTitle
{
	id mockDatasource = [OCMockObject mockForProtocol:@protocol(NGBarChartViewDataSource)];
	CGFloat maxValue = 50.0;
	barChart.dataSource = mockDatasource;
	barChart.gridLines = YES;
	barChart.barItemTitle = NO;
	[[[mockDatasource expect] andReturnValue:OCMOCK_VALUE(maxValue)] maximumBarHeightInBarChartView:barChart];
	CGRect r = [barChart calculateBarRectForBarItemHeight:10 withNumberOfBarItems:4 atBarItemIndex:1];
	STAssertEquals(r.size.height, (CGFloat)14, @"Cannot calculate the correct height for the Bar Item at Index 1");
	[mockDatasource verify];
}

- (void) testCalculatedBarHeightForBarChatWithNoGridLinesAndWithTitle
{
	id mockDatasource = [OCMockObject mockForProtocol:@protocol(NGBarChartViewDataSource)];
	CGFloat maxValue = 50.0;
	barChart.dataSource = mockDatasource;
	barChart.gridLines = NO;
	barChart.barItemTitle = YES;
	barChart.barItemTitleHeight = 10.0;
	[[[mockDatasource expect] andReturnValue:OCMOCK_VALUE(maxValue)] maximumBarHeightInBarChartView:barChart];
	CGRect r = [barChart calculateBarRectForBarItemHeight:10 withNumberOfBarItems:4 atBarItemIndex:1];
	STAssertEquals(r.size.height, (CGFloat)14, @"Cannot calculate the correct height for the Bar Item at Index 1");
	[mockDatasource verify];
}*/
@end
