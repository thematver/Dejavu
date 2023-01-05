//
//  DjvuParser.h
//  
//
//  Created by Матвей Корепанов on 05.01.2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if !TARGET_OS_IPHONE && !TARGET_OS_IOS && !TARGET_OS_TV && !TARGET_OS_WATCH
    #define DJVU_PLUGIN_MAC 1
#else
    #define DJVU_PLUGIN_MAC 0
#endif

#if AVIF_PLUGIN_MAC
#import <AppKit/AppKit.h>
#define Image   NSImage
#else
#import <UIKit/UIKit.h>
#define Image   UIImage
#endif

@interface DjvuParser: NSObject
{
    NSString *filePath;
}

- (nullable id)initWithPath:(nonnull NSString*)path error:(NSError *_Nullable * _Nullable)error;

@property(nonatomic, assign, readonly) NSUInteger numberOfPages;

- (nullable Image*)imageForPage:(NSUInteger)page dpi:(NSUInteger)dpi error:(NSError *_Nullable * _Nullable)error;
- (nullable Image*)imageForPage:(NSUInteger)page dpi:(NSUInteger)dpi maxSideSize:(NSUInteger)maxSideSize error:(NSError *_Nullable * _Nullable)error;
- (nullable NSString*)getPageText:(NSUInteger)page error:(NSError *_Nullable * _Nullable)error;
- (nullable NSString*)getDocumentDump:(NSError *_Nullable * _Nullable)error;

@end
