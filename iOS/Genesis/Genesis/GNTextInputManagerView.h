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

#import <UIKit/UIKit.h>
#import "GNFileRepresentation.h"
#import "GNTextCaretView.h"
#import "GNTextInputAccessoryView.h"
#import "GNTextAlternateInputView.h"

#import "GNTextAutocompleteInputView.h"

@protocol GNTextInputManagerViewDelegate

-(CGFloat)verticalScrollOffset;

@end

@interface GNTextInputManagerView : UIView <UIKeyInput,
                                            UITextInputTraits,
                                            GNTextAlternateInputViewDelegate>
{
    GNFileRepresentation* fileRepresentation;
    NSUInteger textCaretIndex;
    
    GNTextCaretView* caretView;
    
    GNTextAlternateInputView* alternateInputView;
    GNTextInputAccessoryView* inputAccessoryView;
    
    id<GNTextInputManagerViewDelegate> delegate;
}

-(id)initWithFileRepresentation:(GNFileRepresentation*)representation;
-(void)insertionPointChanged:(NSNotification*)notification;
-(void)didScrollToVerticalOffset:(CGFloat)offset;
-(void)cleanUp;

@property(nonatomic,retain) id<GNTextInputManagerViewDelegate> delegate;
@property(readwrite) UIView* inputView;
@property(readwrite) UIView* inputAccessoryView;

@end
