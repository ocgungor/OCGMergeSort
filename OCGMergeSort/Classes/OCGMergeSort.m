/*
 * OCGMergeSort.h
 *
 * Created by Oguzhan Cansin Gungor on 23/07/16.
 *
 * Copyright (c) 2016 Aslan-Apps. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *       This product includes software developed by Aslan-Apps.
 * 4. The name of the author may not be used to endorse or promote
 *    products derived from this software without specific prior written
 *    permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "OCGMergeSort.h"

@implementation NSMutableArray(OCGMergeSort)

- (void)mergeSortUsingSelector:(SEL)comparator {
    if (self.count > 0) {
        [self divideAndMerge:self.clone usingSelector:comparator
               forBeginIndex:0 andMiddleIndex:self.middleIndex andEndIndex:self.endIndex];
    }
}

- (void)divideAndMerge:(NSMutableArray *)temp usingSelector:(SEL)comparator
         forBeginIndex:(NSInteger)beginIndex andMiddleIndex:(NSInteger)middleIndex andEndIndex:(NSInteger)endIndex {
    if (beginIndex < middleIndex) {
        [self divideAndMerge:temp usingSelector:comparator forBeginIndex:beginIndex
              andMiddleIndex:(beginIndex+middleIndex)/2 andEndIndex:middleIndex];
    }
    if (middleIndex+1 < endIndex) {
        [self divideAndMerge:temp usingSelector:comparator forBeginIndex:middleIndex+1
              andMiddleIndex:(middleIndex+1+endIndex)/2 andEndIndex:endIndex];
    }
    [self merge:temp usingSelector:comparator forBeginIndex:beginIndex andMiddleIndex:middleIndex andEndIndex:endIndex];
}

- (void)merge:(NSMutableArray *)temp usingSelector:(SEL)comparator
forBeginIndex:(NSInteger)beginIndex andMiddleIndex:(NSInteger)middleIndex andEndIndex:(NSInteger)endIndex {
    NSInteger firstIndex = beginIndex;      // first sorted subarray index
    NSInteger midIndex = middleIndex + 1;   // second sorted subarray index

    for (NSInteger i = beginIndex; i <= endIndex; i++) {
        if (firstIndex > middleIndex)
            temp[i] = self[midIndex++];
        else if (midIndex > endIndex)
            temp[i] = self[firstIndex++];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        else if ((NSInteger)[self[firstIndex] performSelector:comparator withObject:self[midIndex]] == NSOrderedAscending)
            temp[i] = self[firstIndex++];
#pragma clang diagnostic pop
        else
            temp[i] = self[midIndex++];
    }
    [self copy:temp usingSelector:comparator forBeginIndex:beginIndex andEndIndex:endIndex];
}

- (void)copy:(NSMutableArray *)temp usingSelector:(SEL)comparator forBeginIndex:(NSInteger)beginIndex
 andEndIndex:(NSInteger)endIndex {
    for (NSInteger i = beginIndex; i <= endIndex; i++) {
        self[i] = temp[i];
    }
}

- (NSInteger)middleIndex {
    return self.endIndex/2;
}

- (NSInteger)endIndex {
    return self.count-1;
}

- (NSMutableArray *)clone {
    return [NSMutableArray arrayWithArray:self];
}

@end
