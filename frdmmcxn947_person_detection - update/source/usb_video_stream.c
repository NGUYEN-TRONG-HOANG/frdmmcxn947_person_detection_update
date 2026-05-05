//#include "usb_video_stream.h"
//
//#include <string.h>
//
//#include "video.h"
//#include "virtual_com.h"
//
//#define USB_VIDEO_MAGIC               (0x30444956UL) /* "VID0" little-endian */
//#define USB_VIDEO_PIXEL_FORMAT_RGB565 (0U)
//#define USB_VIDEO_QUEUE_DEPTH         (1U)
//
//#pragma pack(push, 1)
//typedef struct
//{
//    uint32_t magic;
//    uint16_t sliceIndex;
//    uint16_t sliceCount;
//    uint16_t frameWidth;
//    uint16_t frameHeight;
//    uint16_t sliceHeight;
//    uint16_t pixelFormat;
//    uint32_t frameId;
//    uint32_t payloadLength;
//} usb_video_packet_header_t;
//#pragma pack(pop)
//
//#define USB_VIDEO_MAX_PAYLOAD_SIZE (CAMERA_WIDTH * BUFF_HEIGHT * 2U)
//#define USB_VIDEO_MAX_PACKET_SIZE  (sizeof(usb_video_packet_header_t) + USB_VIDEO_MAX_PAYLOAD_SIZE)
//
//typedef struct
//{
//    volatile uint8_t ready;
//    uint32_t length;
//    uint8_t packet[USB_VIDEO_MAX_PACKET_SIZE];
//} usb_video_slot_t;
//
//static usb_video_slot_t s_slots[USB_VIDEO_QUEUE_DEPTH];
//static volatile uint8_t s_writeIndex = 0U;
//static volatile uint8_t s_readIndex  = 0U;
//static volatile uint8_t s_txInFlight = 0U;
//static uint32_t s_frameId            = 0U;
//
//static uint8_t USB_VIDEO_STREAM_NextIndex(uint8_t index)
//{
//    index++;
//    if (index >= USB_VIDEO_QUEUE_DEPTH)
//    {
//        index = 0U;
//    }
//    return index;
//}
//
//static void USB_VIDEO_STREAM_ServiceInternal(void)
//{
//    usb_video_slot_t *slot;
//
//    if (!USB_VIDEO_CDC_IsReady())
//    {
//        return;
//    }
//
//    slot = &s_slots[s_readIndex];
//
//    if (s_txInFlight != 0U)
//    {
//        if (USB_VIDEO_CDC_CanSend())
//        {
//            slot->ready = 0U;
//            s_readIndex = USB_VIDEO_STREAM_NextIndex(s_readIndex);
//            s_txInFlight = 0U;
//        }
//        return;
//    }
//
//    if (slot->ready == 0U)
//    {
//        return;
//    }
//
//    if (!USB_VIDEO_CDC_CanSend())
//    {
//        return;
//    }
//
//    if (USB_VIDEO_CDC_Send(slot->packet, slot->length))
//    {
//        s_txInFlight = 1U;
//    }
//}
//
//void USB_VIDEO_STREAM_Init(void)
//{
//    memset((void *)s_slots, 0, sizeof(s_slots));
//    s_writeIndex = 0U;
//    s_readIndex  = 0U;
//    s_txInFlight = 0U;
//    s_frameId    = 0U;
//
//    USB_VIDEO_CDC_Init();
//}
//
//bool USB_VIDEO_STREAM_EnqueueSlice(uint16_t sliceIndex,
//                                   uint16_t sliceCount,
//                                   const uint8_t *payload,
//                                   uint16_t frameWidth,
//                                   uint16_t frameHeight,
//                                   uint16_t sliceHeight)
//{
//    usb_video_slot_t *slot;
//    usb_video_packet_header_t header;
//    uint32_t payloadLength;
//
//    if (payload == NULL)
//    {
//        return false;
//    }
//
//    payloadLength = ((uint32_t)frameWidth * (uint32_t)sliceHeight * 2U);
//    if (payloadLength > USB_VIDEO_MAX_PAYLOAD_SIZE)
//    {
//        return false;
//    }
//
//    slot = &s_slots[s_writeIndex];
//    if (slot->ready != 0U)
//    {
//        /* Queue full: drop this slice to keep camera realtime */
//        return false;
//    }
//
//    if (sliceIndex == 0U)
//    {
//        s_frameId++;
//    }
//
//    header.magic         = USB_VIDEO_MAGIC;
//    header.sliceIndex    = sliceIndex;
//    header.sliceCount    = sliceCount;
//    header.frameWidth    = frameWidth;
//    header.frameHeight   = frameHeight;
//    header.sliceHeight   = sliceHeight;
//    header.pixelFormat   = USB_VIDEO_PIXEL_FORMAT_RGB565;
//    header.frameId       = s_frameId;
//    header.payloadLength = payloadLength;
//
//    memcpy(slot->packet, &header, sizeof(header));
//    memcpy(slot->packet + sizeof(header), payload, payloadLength);
//    slot->length = (uint32_t)sizeof(header) + payloadLength;
//
//    slot->ready = 1U;
//    s_writeIndex = USB_VIDEO_STREAM_NextIndex(s_writeIndex);
//
//    return true;
//}
//
//void USB_VIDEO_STREAM_Service(void)
//{
//    USB_VIDEO_STREAM_ServiceInternal();
//}
//
//void USB_VIDEO_STREAM_Task(void)
//{
//    USB_VIDEO_CDC_Task();
//    USB_VIDEO_STREAM_ServiceInternal();
//}

#include "usb_video_stream.h"

#include <string.h>

#include "video.h"
#include "virtual_com.h"

#define USB_VIDEO_MAGIC               (0x30444956UL) /* "VID0" little-endian */
#define USB_VIDEO_PIXEL_FORMAT_RGB565 (0U)
#define USB_VIDEO_QUEUE_DEPTH         (1U)

#pragma pack(push, 1)
typedef struct
{
    uint32_t magic;
    uint16_t sliceIndex;
    uint16_t sliceCount;
    uint16_t frameWidth;
    uint16_t frameHeight;
    uint16_t sliceHeight;
    uint16_t pixelFormat;
    uint32_t frameId;
    uint32_t payloadLength;
} usb_video_packet_header_t;
#pragma pack(pop)

#define USB_VIDEO_MAX_PAYLOAD_SIZE (CAMERA_WIDTH * BUFF_HEIGHT * 2U)
#define USB_VIDEO_MAX_PACKET_SIZE  (sizeof(usb_video_packet_header_t) + USB_VIDEO_MAX_PAYLOAD_SIZE)

typedef struct
{
    volatile uint8_t ready;
    uint32_t length;
    uint8_t packet[USB_VIDEO_MAX_PACKET_SIZE];
} usb_video_slot_t;

static usb_video_slot_t s_slots[USB_VIDEO_QUEUE_DEPTH];
static volatile uint8_t s_writeIndex = 0U;
static volatile uint8_t s_readIndex  = 0U;
static volatile uint8_t s_txInFlight = 0U;
static uint32_t s_frameId            = 0U;

static uint8_t USB_VIDEO_STREAM_NextIndex(uint8_t index)
{
    index++;
    if (index >= USB_VIDEO_QUEUE_DEPTH)
    {
        index = 0U;
    }
    return index;
}

static void USB_VIDEO_STREAM_ServiceInternal(void)
{
    usb_video_slot_t *slot;

    if (!USB_VIDEO_CDC_IsReady())
    {
        return;
    }

    slot = &s_slots[s_readIndex];

    if (s_txInFlight != 0U)
    {
        if (USB_VIDEO_CDC_CanSend())
        {
            slot->ready = 0U;
            s_readIndex = USB_VIDEO_STREAM_NextIndex(s_readIndex);
            s_txInFlight = 0U;
        }
        return;
    }

    if (slot->ready == 0U)
    {
        return;
    }

    if (!USB_VIDEO_CDC_CanSend())
    {
        return;
    }

    if (USB_VIDEO_CDC_Send(slot->packet, slot->length))
    {
        s_txInFlight = 1U;
    }
}

void USB_VIDEO_STREAM_Init(void)
{
    memset((void *)s_slots, 0, sizeof(s_slots));
    s_writeIndex = 0U;
    s_readIndex  = 0U;
    s_txInFlight = 0U;
    s_frameId    = 0U;

    USB_VIDEO_CDC_Init();
}

bool USB_VIDEO_STREAM_EnqueueSlice(uint16_t sliceIndex,
                                   uint16_t sliceCount,
                                   const uint8_t *payload,
                                   uint16_t frameWidth,
                                   uint16_t frameHeight,
                                   uint16_t sliceHeight)
{
    usb_video_slot_t *slot;
    usb_video_packet_header_t header;
    uint32_t payloadLength;

    if (payload == NULL)
    {
        return false;
    }

    payloadLength = ((uint32_t)frameWidth * (uint32_t)sliceHeight * 2U);
    if (payloadLength > USB_VIDEO_MAX_PAYLOAD_SIZE)
    {
        return false;
    }

    slot = &s_slots[s_writeIndex];
    if (slot->ready != 0U)
    {
        /* queue full -> drop current slice */
        return false;
    }

    if (sliceIndex == 0U)
    {
        s_frameId++;
    }

    header.magic         = USB_VIDEO_MAGIC;
    header.sliceIndex    = sliceIndex;
    header.sliceCount    = sliceCount;
    header.frameWidth    = frameWidth;
    header.frameHeight   = frameHeight;
    header.sliceHeight   = sliceHeight;
    header.pixelFormat   = USB_VIDEO_PIXEL_FORMAT_RGB565;
    header.frameId       = s_frameId;
    header.payloadLength = payloadLength;

    memcpy(slot->packet, &header, sizeof(header));
    memcpy(slot->packet + sizeof(header), payload, payloadLength);
    slot->length = (uint32_t)sizeof(header) + payloadLength;

    slot->ready = 1U;
    s_writeIndex = USB_VIDEO_STREAM_NextIndex(s_writeIndex);

    return true;
}

void USB_VIDEO_STREAM_Service(void)
{
    USB_VIDEO_STREAM_ServiceInternal();
}

void USB_VIDEO_STREAM_Task(void)
{
    USB_VIDEO_CDC_Task();
    USB_VIDEO_STREAM_ServiceInternal();
}
