//
//  POIModelManager.m
//  wolaiSocial
//
//  Created by xiangwenwen on 15/8/17.
//  Copyright (c) 2015年 POI. All rights reserved.
//

#import "POIAppDelegate.h"
#import "POIStore.h"
#import "POIModelManager.h"

@interface POIModelManager()

@property(strong,nonatomic) NSMutableArray *model;
@property(strong,nonatomic) NSManagedObjectContext *context;
@property(assign,nonatomic) POIModelManagerArrayStyle managerArrayStyle;

@end

@implementation POIModelManager

-(instancetype)initWithManagerStyle:(POIModelManagerArrayStyle)style
{
    self = [super init];
    if (self) {
        self.managerArrayStyle = style;
    }
    return self;
}

-(POIModelManagerArrayStyle)managerArrayStyle
{
    if (!_managerArrayStyle) {
        _managerArrayStyle = POIModelManagerArrayStyleNone;
    }
    return _managerArrayStyle;
}

-(NSManagedObjectContext *)context
{
    if (!_context) {
        POIAppDelegate *delegate = (POIAppDelegate *)[UIApplication sharedApplication].delegate;
        _context = delegate.store.privateManagedObjectContext;
    }
    return _context;
}

-(NSMutableArray *)model
{
    if (!_model) {
        _model = [[NSMutableArray alloc] init];
    }
    return _model;
}

-(NSMutableArray *)data
{
    return self.model;
}

-(NSUInteger)length
{
    return self.model.count;
}

-(void)modelForSave:(void (^)(BOOL, NSError *))completion
{
    NSError *error = nil;
    [self.context save:&error];
    !error ? completion(YES,error) : completion(NO,error);
}

-(void)modelForDeletes
{
    [self.context deletedObjects];
}

-(void)modelForRowAtIndexPath:(NSIndexPath *)indexPath completion:(void (^)(id))completion
{
    if (self.managerArrayStyle == POIModelManagerArrayStyleNone) {
        completion([self.model objectAtIndex:indexPath.row]);
    }else{
        NSMutableArray *arr = (NSMutableArray *)[self.model objectAtIndex:indexPath.section];
        completion([arr objectAtIndex:indexPath.row]);
    }
}

-(void)modelForRowAtInsert:(id (^)(NSManagedObjectContext *))insertBlock
{
    [self insertToModel:insertBlock];
}

-(void)modelForRowAtInsert:(id (^)(NSManagedObjectContext *))insertBlock comple:(void (^)(void))comple
{
    [self insertToModel:insertBlock];
    comple();
}

-(void)modelForRowAtInsert:(id (^)(NSManagedObjectContext *))insertBlock completion:(void (^)(BOOL, NSError *))completion
{
    [self insertToModel:insertBlock];
    [self modelForSave:^(BOOL success, NSError *error) {
        completion(success,error);
    }];
}

-(void)insertToModel:(id (^)(NSManagedObjectContext *))insertBlock
{
    id value = insertBlock(self.context);
    [self.model addObject:value];
}

-(NSSet *)deletedModelObjects
{
    return [self.context deletedObjects];
}

-(void)deleteModelObject:(NSManagedObject *)obj
{
    [self.context deleteObject:obj];
}

-(void)modelForRowAtDelete:(NSIndexPath *)indexPath
{
    [self deleteToModel:indexPath];
}

-(void)modelForRowAtDelete:(NSIndexPath *)indexPath completion:(void (^)(void))completion
{
    [self deleteToModel:indexPath];
    completion();
}
-(void)deleteToModel:(NSIndexPath *)indexPath
{
    if (self.managerArrayStyle == POIModelManagerArrayStyleNone) {
        id value = [self.model objectAtIndex:indexPath.row];
        [self.model removeObject:value];
        [self deleteModelObject:(NSManagedObject *)value];
    }else{
        NSMutableArray *arr = (NSMutableArray *)[self.model objectAtIndex:indexPath.section];
        id value = [arr objectAtIndex:indexPath.row];
        [arr removeObject:value];
        [self deleteModelObject:(NSManagedObject *)value];
    }
}

-(void)modelfilteredArrayUsingPredicate:(NSPredicate *)dicate completion:(void (^)(NSArray *))completion
{
    completion([self.model filteredArrayUsingPredicate:dicate]);
}

-(void)fetchRequestAddToModel:(NSArray *(^)(NSManagedObjectContext *))fetchBlock
{
    [self fetchRequestToModel:fetchBlock indexPath:nil];
}

-(void)fetchRequestAddToModel:(NSArray *(^)(NSManagedObjectContext *))fetchBlock comple:(void (^)(void))comple
{
    [self fetchRequestToModel:fetchBlock indexPath:nil];
    comple();
}

-(void)fetchRequestAddToModel:(NSArray *(^)(NSManagedObjectContext *))fetchBlock indexPath:(NSIndexPath *)indexPath comple:(void (^)(void))comple
{
    [self fetchRequestToModel:fetchBlock indexPath:indexPath];
    comple();
}

-(void)fetchRequestToModel:(NSArray *(^)(NSManagedObjectContext *))fetchBlock indexPath:(NSIndexPath *)indexPath
{
    if (self.managerArrayStyle == POIModelManagerArrayStyleNone) {
        NSArray *fetchArr = fetchBlock(self.context);
        for (id value in fetchArr) {
            [self.model addObject:value];
        }
    }else{
        NSMutableArray *arr = (NSMutableArray *)[self.model objectAtIndex:indexPath.section];
        NSArray *fetchArr = fetchBlock(self.context);
        for (id value in fetchArr) {
            [arr addObject:value];
        }
    }
}

-(void)modelForRowAtUpdate:(NSIndexPath *)indexPath updateblock:(void (^)(id))updateblock
{
    [self updateToModel:indexPath updateblock:updateblock];
}

-(void)modelForRowAtUpdate:(NSIndexPath *)indexPath updateblock:(void (^)(id))updateblock comple:(void (^)(void))comple
{
    [self updateToModel:indexPath updateblock:updateblock];
    comple();
}

-(void)updateToModel:(NSIndexPath *)indexPath updateblock:(void (^)(id))updateblock
{
    if (self.managerArrayStyle == POIModelManagerArrayStyleNone) {
        updateblock([self.model objectAtIndex:indexPath.row]);
    }else{
        NSMutableArray *arr = (NSMutableArray *)[self.model objectAtIndex:indexPath.section];
        updateblock([arr objectAtIndex:indexPath.row]);
    }
}
@end