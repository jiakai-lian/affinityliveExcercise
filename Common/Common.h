//
//  Common.h
//  AffinityLiveExercise
//
//  Created by jiakai lian on 4/04/2015.
//  Copyright (c) 2015 jiakai. All rights reserved.
//

#ifndef AffinityLiveExercise_Common_h
#define AffinityLiveExercise_Common_h

//enhanced logging
#ifdef DEBUG
#   define LOG(fmt, ...) NSLog((@"\n\n%s [Line %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define LOG(...)
#endif

#define APP_DELEGATE (AppDelegate *)[[UIApplication sharedApplication] delegate]


#endif
