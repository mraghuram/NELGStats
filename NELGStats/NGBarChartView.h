//
//  NGBarChartView.h
//  NELGPieChart
//
//  Created by Murali Raghuram on 8/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

//Bar Chart View Header File
//******
//******

#import <UIKit/UIKit.h>


typedef enum{
	NGBarChartViewSeparatorStyleNone,
	NGBarChartViewSeparatorStyleSingleLine,
	NGBarChartViewSeparatorStyleEmptySpace
}NGBarChartViewSeparatorStyle;

typedef enum{
	NGBarChartViewStyleHorizontal,
	NGBarChartViewStyleVertical
}NGBarChartViewStyle;

typedef enum{
	NGBarChartViewAlignCenter,
	NGBarChartViewAlignLeft,
	NGBarChartViewAlignRight,
}NGBarChartViewAlignment;


@class NGBarChartView;

@protocol NGBarChartViewDataSource <NSObject>

- (NSInteger) numberOfBarsInBarChartView:(NGBarChartView *)barChartView;
- (float) barChartView:(NGBarChartView *)barChartView heightForBarAtIndex:(NSInteger)index;
- (float) maximumBarHeightInBarChartView:(NGBarChartView *)barChartView;

@optional

-(NSString *) barChartView:(NGBarChartView*)barChartView titleForBarAtIndex:(NSInteger)index;
-(UIColor *) barChartView:(NGBarChartView*)barChartView colorForBarAtIndex:(NSInteger)index;

@end

@protocol NGBarChartViewDelegate <NSObject>

@optional
- (void) barChartView:(NGBarChartView *)barChartView willSelectBarAtIndex:(NSInteger)index;
- (void) barChartView:(NGBarChartView *)barChartView didSelectBarAtIndex:(NSInteger)index;
- (void) barChartView:(NGBarChartView *)barChartView willDeselectBarAtIndex:(NSInteger)index;
- (void) barChartView:(NGBarChartView *)barChartView didDeselectBarAtIndex:(NSInteger)index;

@end


@interface NGBarChartView : UIView{
	
}

@property (nonatomic, strong) id <NGBarChartViewDelegate> delegate;
@property (nonatomic, strong) id <NGBarChartViewDataSource> dataSource;

@property (nonatomic, getter = isGridLines) BOOL gridLines;

/*******
@property (nonatomic) NGBarChartViewSeparatorStyle separatorStyle;
@property (nonatomic) UIColor *separatorColor;
*******/

@property (nonatomic) NSInteger separatorWidth;

@property (nonatomic,readonly) NGBarChartViewStyle style;
@property (nonatomic) NGBarChartViewAlignment alignment;

@property (nonatomic) NSInteger barItemWidth;

//To determine if the top portion of the bar is rounded
@property (nonatomic) BOOL barItemRoundedTop;

//@property (nonatomic) NSInteger barItemTitleHeight;
//@property (nonatomic) BOOL barItemTitle;

@property (nonatomic, strong) UIColor *barItemSelectedColor;
@property (nonatomic, strong) UIColor *barItemColor;
//@property (nonatomic, strong) UIColor *backgroundColor;

- (id) initWithFrame:(CGRect)frame;

@end
