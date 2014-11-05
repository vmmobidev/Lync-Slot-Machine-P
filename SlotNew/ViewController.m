//
//  ViewController.m
//  SlotNew
//
//  Created by Vmoksha on 31/10/14.
//  Copyright (c) 2014 Vmoksha. All rights reserved.
//

#import "ViewController.h"
#import "ZCSlotMachine.h"

@interface ViewController () <ZCSlotMachineDataSource, ZCSlotMachineDelegate>
{
    NSArray *slot1Icons;
    NSArray *slot2Icons;
    NSArray *slot3Icons;

//    ZCSlotMachine *slot1;
    
}
@property (strong, nonatomic) IBOutlet UIView *slotContainer;
@property (strong, nonatomic) IBOutlet ZCSlotMachine *slotOutlet1;
@property (strong, nonatomic) IBOutlet ZCSlotMachine *slotOutlet2;
@property (strong, nonatomic) IBOutlet ZCSlotMachine *slotOutlet3;
@property (strong, nonatomic) IBOutlet UIButton *spinOutlet;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImgViweOutlet;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    slot1Icons = [NSArray arrayWithObjects: [UIImage imageNamed:@"airport.jpg"], [UIImage imageNamed:@"home.jpg"], [UIImage imageNamed:@"meeting room.jpeg"], [UIImage imageNamed:@"office.jpg"], nil];
    
    slot2Icons = [NSArray arrayWithObjects: [UIImage imageNamed:@"I listen.jpg"], [UIImage imageNamed:@"ipad.jpg"], [UIImage imageNamed:@"iphone.jpg"], [UIImage imageNamed:@"pcLync.png"], nil];
    
    slot3Icons = [NSArray arrayWithObjects: [UIImage imageNamed:@"Guest.jpg"], [UIImage imageNamed:@"Organizer.jpg"], [UIImage imageNamed:@"participant.jpg"], [UIImage imageNamed:@"Presenter.jpg"], nil];

    self.slotOutlet1.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.slotOutlet1.minNoOfRotations = 4;
    self.slotOutlet1.delegate = self;
    self.slotOutlet1.dataSource = self;
    
    self.slotOutlet2.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.slotOutlet2.minNoOfRotations = 5;
    self.slotOutlet2.delegate = self;
    self.slotOutlet2.dataSource = self;
    
    self.slotOutlet3.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.slotOutlet3.minNoOfRotations = 6;
    self.slotOutlet3.delegate = self;
    self.slotOutlet3.dataSource = self;
    
}
- (IBAction)spinAction:(id)sender
{
    self.spinOutlet.enabled = NO;
//    NSUInteger slotIconCount = [slot1Icons count];
    self.slotOutlet1.slotResults = [self arrayOfRandomResultsForCount:[slot1Icons count]];
    self.slotOutlet2.slotResults = [self arrayOfRandomResultsForCount:[slot2Icons count]];
    self.slotOutlet3.slotResults = [self arrayOfRandomResultsForCount:[slot3Icons count]];

    [self.slotOutlet1 startSliding];
    [self.slotOutlet2 startSliding];
    [self.slotOutlet3 startSliding];

}

- (NSArray *)arrayOfRandomResultsForCount:(NSInteger)iconCount
{
    NSUInteger slotOneIndex = abs(rand() % iconCount);
    NSUInteger slotTwoIndex = abs(rand() % iconCount);
    NSUInteger slotThreeIndex = abs(rand() % iconCount);
    NSUInteger slotFourIndex = abs(rand() % iconCount);
    
    return [NSArray arrayWithObjects:
            [NSNumber numberWithInteger:slotOneIndex],
            [NSNumber numberWithInteger:slotTwoIndex],
            [NSNumber numberWithInteger:slotThreeIndex],
            [NSNumber numberWithInteger:slotFourIndex],
            nil];
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
 
    
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
    {
        self.backgroundImgViweOutlet.image = [UIImage imageNamed:@"Screen-03.png"];
    }
    else
    {
        self.backgroundImgViweOutlet.image = [UIImage imageNamed:@"Lync Slot Game - UI - Option #2.png"];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSArray *)iconsForSlotsInSlotMachine:(ZCSlotMachine *)slotMachine
{
    if ([slotMachine isEqual:self.slotOutlet1])
    {
        return slot1Icons;
    }else if ( [slotMachine isEqual:self.slotOutlet2])
    {
        return slot2Icons;
    }
    return slot3Icons;
}

- (NSUInteger)numberOfSlotsInSlotMachine:(ZCSlotMachine *)slotMachine {
    return 1;
}

- (CGFloat)slotWidthInSlotMachine:(ZCSlotMachine *)slotMachine {
    return 90;
}

- (CGFloat)slotSpacingInSlotMachine:(ZCSlotMachine *)slotMachine {
    return 0;
}

- (void)slotMachineWillStartSliding:(ZCSlotMachine *)slotMachine
{
    if ([slotMachine isEqual:self.slotOutlet1])
    {
        NSLog(@"Slot 1 started");
        return;
    }else if ( [slotMachine isEqual:self.slotOutlet2])
    {
        NSLog(@"Slot 2 started");

        return ;
    }
    
    NSLog(@"Slot 3 started");
}
- (void)slotMachineDidEndSliding:(ZCSlotMachine *)slotMachine
{
    if ([slotMachine isEqual:self.slotOutlet1])
    {
        NSLog(@"Slot 1 stoped");
        return;
    }else if ( [slotMachine isEqual:self.slotOutlet2])
    {
        NSLog(@"Slot 2 stoped");
        
        return ;
    }
    
    self.spinOutlet.enabled=YES;
    NSLog(@"Slot 3 stoped");
}

- (CGFloat)slotDurationFactorinSlotMachine:(ZCSlotMachine *)slotMachine
{
    if ([slotMachine isEqual:self.slotOutlet1])
    {
        return 15;
    }else if ( [slotMachine isEqual:self.slotOutlet2])
    {
        return 21;
    }
    return 27;
}

@end
