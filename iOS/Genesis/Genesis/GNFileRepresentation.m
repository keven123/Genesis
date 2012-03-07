/* Copyright (c) 2012, individual contributors
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#import "GNFileRepresentation.h"
#import "GNFileManager.h"

@implementation GNFileRepresentation

-(id)initWithRelativePath:(NSString*)path
{
    self = [super init];
    if(self)
    {
        // Set relative path
        relativePath = path;
        
        // Grab file contents with GNFileManager
        NSData* contents = [GNFileManager fileContentsAtRelativePath:relativePath];
        if(contents)
        {
            fileContents = [[NSString alloc] initWithData:contents encoding:NSUTF8StringEncoding];
        }
        else
        {
            fileContents = @"";
        }
        [self refreshLineArray];
    }
    return self;
}

-(void)refreshLineArray
{
    fileLines = [NSMutableArray arrayWithArray:[fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]]];
}

-(NSUInteger)lineCount
{
    return [fileLines count];
}

-(NSString*)lineAtIndex:(NSUInteger)index
{
    return [fileLines objectAtIndex:index];
}

-(void)insertLineWithText:(NSString*)text afterLineAtIndex:(NSUInteger)index
{
    [fileLines insertObject:text atIndex:index];
}

-(void)removeLineAtIndex:(NSUInteger)index
{
    [fileLines removeObjectAtIndex:index];
}

-(void)moveLineAtIndex:(NSUInteger)index toIndex:(NSUInteger)index
{
    
}

@end