//
//  ModelManager.m
//  NSFetchedResultsController
//
//  Created by xiangwenwen on 15/8/11.
//  Copyright (c) 2015年 xiangwenwen. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "ModelManager.h"
#import "Event.h"


@interface ModelManager()

@property(copy,nonatomic) NSString *baseDoc;

@property(strong,nonatomic) NSManagedObjectContext *context;
@property(strong,nonatomic) NSDateFormatter *formatter;

@end

@implementation ModelManager

- (NSString *)baseDoc
{
    if (!_baseDoc) {
        _baseDoc = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    }
    return _baseDoc;
}

- (NSDateFormatter *)formatter
{
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"YYYY年M月dd日 HH时mm分ss秒"];
    }
    return _formatter;
}


- (NSManagedObjectContext *)context
{
    if (!_context) {
        NSError *error = nil;
        NSString *path = [self.baseDoc stringByAppendingPathComponent:@"fetch.db"];
        NSURL *dburl = [NSURL fileURLWithPath:path];
        NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dburl options:nil error:&error];
        _context = [[NSManagedObjectContext alloc] init];
        [_context setPersistentStoreCoordinator:store];
    }
    return _context;
}

-(NSFetchedResultsController *)fetchResult
{
    if (!_fetchResult) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.context];
        [fetchRequest setEntity:entity];
        NSSortDescriptor *sore1 = [[NSSortDescriptor alloc] initWithKey:@"sectionMinute" ascending:YES];
        [fetchRequest setSortDescriptors:@[sore1]];
        _fetchResult = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.context sectionNameKeyPath:nil cacheName:@"democache"];
    }
    return _fetchResult;
}

-(NSString *)createDateNowString:(NSDate *)date
{
    NSString *nowTime = [self.formatter stringFromDate:date];
    return nowTime;
}

- (void)saveDate
{
    NSDate *date = [NSDate date];
    NSString *nowTime = [self createDateNowString:date];
    NSEntityDescription *event = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.context];
    Event *eventTag = [[Event alloc] initWithEntity:event insertIntoManagedObjectContext:self.context];
    eventTag.sectionMinute = nowTime;
    
    NSLog(@"存储的时间：%@",nowTime);
    
    NSError *error = nil;
    [self.context save:&error];
}

@end
