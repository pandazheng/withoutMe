//
//  POIModelManager.h
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/MagicalRecord.h>

typedef NS_ENUM(NSUInteger,POIModelManagerArrayStyle){
    POIModelManagerArrayStyleNone,
    POIModelManagerArrayStyleGroup
};

@interface POIModelManager : NSObject

@property(weak,nonatomic,readonly) NSMutableArray *data;
@property(assign,nonatomic,readonly) NSUInteger length;

-(instancetype)initWithManagerStyle:(POIModelManagerArrayStyle)style;

-(void)modelForSave:(void(^)(BOOL success,NSError *error))completion;
-(NSSet *)deletedModelObjects;
-(void)deleteModelObject:(NSManagedObject *)obj;

-(void)modelForRowAtIndexPath:(NSIndexPath *)indexPath completion:(void(^)(id model))completion;

-(void)modelForRowAtInsert:(id(^)(NSManagedObjectContext *context))insertBlock;
-(void)modelForRowAtInsert:(id(^)(NSManagedObjectContext *context))insertBlock comple:(void(^)(void))comple;
-(void)modelForRowAtInsert:(id(^)(NSManagedObjectContext *context))insertBlock completion:(void(^)(BOOL success,NSError *error))completion;

-(void)modelForRowAtDelete:(NSIndexPath *)indexPath;
-(void)modelForRowAtDelete:(NSIndexPath *)indexPath completion:(void(^)(void))completion;

-(void)modelfilteredArrayUsingPredicate:(NSPredicate *)dicate completion:(void(^)(NSArray *filterData))completion;

-(void)fetchRequestAddToModel:(NSArray *(^)(NSManagedObjectContext *context))fetchBlock;
-(void)fetchRequestAddToModel:(NSArray *(^)(NSManagedObjectContext *context))fetchBlock comple:(void(^)(void))comple;
-(void)fetchRequestAddToModel:(NSArray *(^)(NSManagedObjectContext *context))fetchBlock indexPath:(NSIndexPath *)indexPath comple:(void(^)(void))comple;

-(void)modelForRowAtUpdate:(NSIndexPath *)indexPath updateblock:(void(^)(id model))updateblock;
-(void)modelForRowAtUpdate:(NSIndexPath *)indexPath updateblock:(void(^)(id model))updateblock comple:(void(^)(void))comple;

@end