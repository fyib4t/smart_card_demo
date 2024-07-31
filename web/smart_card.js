async function connectSmartCardReader() {
    try {
        const device = await navigator.usb.requestDevice({ filters: [{ vendorId: 0x1234 }] });
        await device.open();
        console.log('Device opened:', device);
        console.log('Device serial number:', device.serialNumber);
        // Add more code to interact with the device

        // Select the appropriate configuration and interface
        await device.selectConfiguration(1);
        await device.claimInterface(0);

        // Send the necessary commands to read data from the card
        const data = new Uint8Array([0x00, 0xA4, 0x04, 0x00, 0x00]); // Example command, replace with actual command
        const result = await device.transferOut(1, data);
        console.log('Command sent:', result);
        
        // Read the response
        const response = await device.transferIn(1, 64); // Adjust length as needed
        const decoder = new TextDecoder();
        const cardData = decoder.decode(response.data);
        console.log('Data from ID card:', cardData);

        return cardData; // Return data to be used in Flutter
    } catch (error) {
        console.error('Error connecting to smart card reader:', error);
    }
}
