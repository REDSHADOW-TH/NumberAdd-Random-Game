deviceInfo = {}

deviceInfo.platform = system.getInfo('platform'):lower()
deviceInfo.model = system.getInfo('model'):lower()


return deviceInfo