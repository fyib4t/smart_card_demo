async function connectSmartCardReader() {
    try {
        const device = await navigator.usb.requestDevice({ filters: [{ vendorId: 0x1234 }] });
        await device.open();
        console.log('Device opened:', device);
        console.log('Device serial number:', device.serialNumber);
        // Add more code to interact with the device
    } catch (error) {
        console.error('Error connecting to smart card reader:', error);
    }
}
