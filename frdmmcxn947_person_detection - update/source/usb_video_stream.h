//#ifndef USB_VIDEO_STREAM_H_
//#define USB_VIDEO_STREAM_H_
//
//#include <stdbool.h>
//#include <stdint.h>
//
//#ifdef __cplusplus
//extern "C" {
//#endif
//
//void USB_VIDEO_STREAM_Init(void);
//void USB_VIDEO_STREAM_Task(void);
//void USB_VIDEO_STREAM_Service(void);
//
//bool USB_VIDEO_STREAM_EnqueueSlice(uint16_t sliceIndex,
//                                   uint16_t sliceCount,
//                                   const uint8_t *payload,
//                                   uint16_t frameWidth,
//                                   uint16_t frameHeight,
//                                   uint16_t sliceHeight);
//
//#ifdef __cplusplus
//}
//#endif
//
//#endif /* USB_VIDEO_STREAM_H_ */

#ifndef USB_VIDEO_STREAM_H_
#define USB_VIDEO_STREAM_H_

#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

void USB_VIDEO_STREAM_Init(void);
void USB_VIDEO_STREAM_Task(void);
void USB_VIDEO_STREAM_Service(void);

bool USB_VIDEO_STREAM_EnqueueSlice(uint16_t sliceIndex,
                                   uint16_t sliceCount,
                                   const uint8_t *payload,
                                   uint16_t frameWidth,
                                   uint16_t frameHeight,
                                   uint16_t sliceHeight);

#ifdef __cplusplus
}
#endif

#endif /* USB_VIDEO_STREAM_H_ */
