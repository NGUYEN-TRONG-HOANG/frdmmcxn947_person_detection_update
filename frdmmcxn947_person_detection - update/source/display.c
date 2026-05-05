//#include <stdint.h>
//#include "video.h"
//#include "usb_video_stream.h"
//
//#define USB_VIDEO_FRAME_DIV 3U   /* gửi 1 frame trên mỗi 3 frame */
//
//static uint32_t s_txFrameCounter = 0U;
//static uint8_t s_sendThisFrame = 1U;
//
//void display_init(void)
//{
//    USB_VIDEO_STREAM_Init();
//}
//
//void display_show_bg_image(void)
//{
//    /* no-op */
//}
//
//void display_show_slice(uint32_t g_stripe_index, uint32_t buffer, uint32_t maxidx)
//{
//    if (buffer == 0U)
//    {
//        return;
//    }
//
//    if (g_stripe_index >= maxidx)
//    {
//        return;
//    }
//
//    if (g_stripe_index == 0U)
//    {
//        s_sendThisFrame = ((s_txFrameCounter % USB_VIDEO_FRAME_DIV) == 0U) ? 1U : 0U;
//        s_txFrameCounter++;
//    }
//
//    if (!s_sendThisFrame)
//    {
//        return;
//    }
//
//    if (USB_VIDEO_STREAM_EnqueueSlice((uint16_t)g_stripe_index,
//                                      (uint16_t)maxidx,
//                                      (const uint8_t *)(uintptr_t)buffer,
//                                      (uint16_t)CAMERA_WIDTH,
//                                      (uint16_t)CAMERA_HEIGHT,
//                                      (uint16_t)BUFF_HEIGHT))
//    {
//        /* CỰC KỲ QUAN TRỌNG: kick send ngay khi enqueue xong */
//        USB_VIDEO_STREAM_Service();
//    }
//}


#include <stdint.h>
#include "video.h"
#include "usb_video_stream.h"

void display_init(void)
{
    USB_VIDEO_STREAM_Init();
}

void display_show_bg_image(void)
{
    /* no-op */
}

void display_show_slice(uint32_t g_stripe_index, uint32_t buffer, uint32_t maxidx)
{
    if (buffer == 0U)
    {
        return;
    }

    if (g_stripe_index >= maxidx)
    {
        return;
    }

    if (USB_VIDEO_STREAM_EnqueueSlice((uint16_t)g_stripe_index,
                                      (uint16_t)maxidx,
                                      (const uint8_t *)(uintptr_t)buffer,
                                      (uint16_t)CAMERA_WIDTH,
                                      (uint16_t)CAMERA_HEIGHT,
                                      (uint16_t)BUFF_HEIGHT))
    {
        /* slice tới là kick send ngay */
        USB_VIDEO_STREAM_Service();
    }
}
