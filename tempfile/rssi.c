#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <assert.h>
#include <iio.h>

#define ASSERT(expr) { \
	if (!(expr)) { \
		(void) fprintf(stderr, "assertion failed (%s:%d)\n", __FILE__, __LINE__); \
		(void) abort(); \
	} \
}

double rx_voltage0_rssi;
double rx_voltage1_rssi;

/** IIO structs required for acquire RSSI */
static struct iio_context *ctx = NULL;
static struct iio_device *dev = NULL;
static struct iio_channel *chn_0 = NULL;
static struct iio_channel *chn_1 = NULL;

int main(void) {
    int ret0;
    int ret1;
    ctx = iio_create_default_context();
    ASSERT(iio_context_get_devices_count(ctx) > 0 && "No context");
    dev = iio_context_find_device(ctx, "ad9361-phy");
    ASSERT(dev && "No ad9361-phy found");
    chn_0 = iio_device_find_channel(dev, "voltage0", /*is_tx*/false);
    chn_1 = iio_device_find_channel(dev, "voltage1", /*is_tx*/false);
    while(true) {
        ret0 = iio_channel_attr_read_double(chn_0, "rssi", &rx_voltage0_rssi);
        ret1 = iio_channel_attr_read_double(chn_1, "rssi", &rx_voltage1_rssi);
        ret0 == 0 ? printf("chn0 rx rssi is %f. \n", rx_voltage0_rssi) : printf("chn0 rssi read failed.\n");
        ret1 == 0 ? printf("chn1 rx rssi is %f. \n", rx_voltage1_rssi) : printf("chn1 rssi read failed.\n");
        sleep(1);
    }

}

