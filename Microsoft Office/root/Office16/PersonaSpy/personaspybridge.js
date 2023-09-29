// Provides a sensor that the tests can hook into to capture the messages
var PersonaSpyBridgeSensorImpl = (function () {
	function PersonaSpyBridgeSensorImpl() {
	}
	return PersonaSpyBridgeSensorImpl;
}());
var PersonaSpyBridgeSensor = new PersonaSpyBridgeSensorImpl();

// Setup the bridge for the persona spy
var PersonaSpyBridgeImpl = (function () {
	function PersonaSpyBridgeImpl() {
	}
	PersonaSpyBridgeImpl.prototype.sendMessageToHost = function (value) {
        if (PersonaSpyBridgeSensor.onSendMessageToHostSensor) {
            PersonaSpyBridgeSensor.onSendMessageToHostSensor(value);
        }

        window.external.executeRichApiRequestAsync(value);
	};
	return PersonaSpyBridgeImpl;
}());
var PersonaSpyBridge = new PersonaSpyBridgeImpl();

window.processMessageFromHost = function (value) {
    if (PersonaSpyBridgeSensor.onMessageFromHostSensor) {
        PersonaSpyBridgeSensor.onMessageFromHostSensor(value);
    }

    if (PersonaSpyBridge.onMessageFromHost) {
		PersonaSpyBridge.onMessageFromHost(value);
	}
};

OfficeExtension.HostBridge.init(PersonaSpyBridge);
OfficeExtension.HostBridge.s_instance.addHostMessageHandler(function (message) {
	if (message.type===3) {
		OfficeExtension.GenericEventRegistration.getGenericEventRegistration()._handleRichApiMessage(message.message);
	}
});

OfficeExtension.CoreUtility._logEnabled = true;
OfficeExtension.CoreUtility.log = function (message) {
	if (PersonaSpyBridgeSensor.onCoreUtilityLog) {
		PersonaSpyBridgeSensor.onCoreUtilityLog(message);
	}
};
