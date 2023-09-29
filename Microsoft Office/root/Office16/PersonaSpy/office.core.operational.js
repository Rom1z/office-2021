var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var OfficeCoreOp;
(function (OfficeCoreOp) {
    var _hostName = "Office";
    var _defaultApiSetName = "OfficeSharedApi";
    var _throwIfApiNotSupported = OfficeExtension.CommonUtility.throwIfApiNotSupported;
    var _invokeRetrieve = OfficeExtension.OperationalApiHelper.invokeRetrieve;
    var _invokeMethod = OfficeExtension.OperationalApiHelper.invokeMethod;
    var _invokeRecursiveUpdate = OfficeExtension.OperationalApiHelper.invokeRecursiveUpdate;
    var _createRootServiceObject = OfficeExtension.OperationalApiHelper.createRootServiceObject;
    var _createTopLevelServiceObject = OfficeExtension.OperationalApiHelper.createTopLevelServiceObject;
    var _createPropertyObject = OfficeExtension.OperationalApiHelper.createPropertyObject;
    var _createIndexerObject = OfficeExtension.OperationalApiHelper.createIndexerObject;
    var _createMethodObject = OfficeExtension.OperationalApiHelper.createMethodObject;
    var _createAndInstantiateMethodObject = OfficeExtension.OperationalApiHelper.createAndInstantiateMethodObject;
    var _localDocumentContext = OfficeExtension.OperationalApiHelper.localDocumentContext;
    var _eventOn = OfficeExtension.EventHelper.invokeOn;
    var _eventOff = OfficeExtension.EventHelper.invokeOff;
    var IdentityType;
    (function (IdentityType) {
        IdentityType["organizationAccount"] = "OrganizationAccount";
        IdentityType["microsoftAccount"] = "MicrosoftAccount";
        IdentityType["unsupported"] = "Unsupported";
    })(IdentityType = OfficeCoreOp.IdentityType || (OfficeCoreOp.IdentityType = {}));
    var AuthenticationService = (function (_super) {
        __extends(AuthenticationService, _super);
        function AuthenticationService() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(AuthenticationService.prototype, "_className", {
            get: function () {
                return "AuthenticationService";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(AuthenticationService.prototype, "_navigationPropertyNames", {
            get: function () {
                return ["roamingSettings"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(AuthenticationService.prototype, "roamingSettings", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.RoamingSettingCollection, this, "RoamingSettings", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        AuthenticationService.prototype.getAccessToken = function (tokenParameters, targetId) {
            return _invokeMethod(this, "GetAccessToken", 1, [tokenParameters, targetId], 4 | 1, 0);
        };
        AuthenticationService.prototype.getIdentities = function () {
            _throwIfApiNotSupported("AuthenticationService.getIdentities", "FirstPartyAuthentication", "1.3", _hostName);
            return _invokeMethod(this, "GetIdentities", 1, [], 4 | 1, 0);
        };
        AuthenticationService.prototype.getPrimaryIdentityInfo = function () {
            _throwIfApiNotSupported("AuthenticationService.getPrimaryIdentityInfo", "FirstPartyAuthentication", "1.2", _hostName);
            return _invokeMethod(this, "GetPrimaryIdentityInfo", 1, [], 4 | 1, 0);
        };
        AuthenticationService.prototype.toJSON = function () {
            return {};
        };
        return AuthenticationService;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.AuthenticationService = AuthenticationService;
    OfficeCoreOp.authenticationService = _createTopLevelServiceObject(AuthenticationService, _localDocumentContext, "Microsoft.Authentication.AuthenticationService", false, 4);
    var RoamingSetting = (function (_super) {
        __extends(RoamingSetting, _super);
        function RoamingSetting() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(RoamingSetting.prototype, "_className", {
            get: function () {
                return "RoamingSetting";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(RoamingSetting.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["id", "value"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(RoamingSetting.prototype, "_scalarPropertyUpdateable", {
            get: function () {
                return [false, true];
            },
            enumerable: true,
            configurable: true
        });
        RoamingSetting.prototype.update = function (properties) {
            return _invokeRecursiveUpdate(this, properties);
        };
        RoamingSetting.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        RoamingSetting.prototype.toJSON = function () {
            return {};
        };
        return RoamingSetting;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.RoamingSetting = RoamingSetting;
    var RoamingSettingCollection = (function (_super) {
        __extends(RoamingSettingCollection, _super);
        function RoamingSettingCollection() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(RoamingSettingCollection.prototype, "_className", {
            get: function () {
                return "RoamingSettingCollection";
            },
            enumerable: true,
            configurable: true
        });
        RoamingSettingCollection.prototype.getItem = function (id) {
            return _createMethodObject(OfficeCoreOp.RoamingSetting, this, "GetItem", 1, [id], false, false, null, 4);
        };
        RoamingSettingCollection.prototype.getItemOrNullObject = function (id) {
            return _createMethodObject(OfficeCoreOp.RoamingSetting, this, "GetItemOrNullObject", 1, [id], false, false, null, 4);
        };
        RoamingSettingCollection.prototype.toJSON = function () {
            return {};
        };
        return RoamingSettingCollection;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.RoamingSettingCollection = RoamingSettingCollection;
    var ServiceProvider;
    (function (ServiceProvider) {
        ServiceProvider["ariaBrowserPipeUrl"] = "AriaBrowserPipeUrl";
        ServiceProvider["ariaUploadUrl"] = "AriaUploadUrl";
        ServiceProvider["ariaVNextUploadUrl"] = "AriaVNextUploadUrl";
    })(ServiceProvider = OfficeCoreOp.ServiceProvider || (OfficeCoreOp.ServiceProvider = {}));
    var ServiceUrlProvider = (function (_super) {
        __extends(ServiceUrlProvider, _super);
        function ServiceUrlProvider() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(ServiceUrlProvider.prototype, "_className", {
            get: function () {
                return "ServiceUrlProvider";
            },
            enumerable: true,
            configurable: true
        });
        ServiceUrlProvider.prototype.getServiceUrl = function (emailAddress, provider) {
            return _invokeMethod(this, "GetServiceUrl", 0, [emailAddress, provider], 0, 0);
        };
        ServiceUrlProvider.prototype.toJSON = function () {
            return {};
        };
        return ServiceUrlProvider;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.ServiceUrlProvider = ServiceUrlProvider;
    OfficeCoreOp.serviceUrlProvider = _createTopLevelServiceObject(ServiceUrlProvider, _localDocumentContext, "Microsoft.DesktopCompliance.ServiceUrlProvider", false, 4);
    var LinkedIn = (function (_super) {
        __extends(LinkedIn, _super);
        function LinkedIn() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(LinkedIn.prototype, "_className", {
            get: function () {
                return "LinkedIn";
            },
            enumerable: true,
            configurable: true
        });
        LinkedIn.prototype.isEnabledForOffice = function () {
            return _invokeMethod(this, "IsEnabledForOffice", 0, [], 0, 0);
        };
        LinkedIn.prototype.recordLinkedInSettingsCompliance = function (featureName, isEnabled) {
            return _invokeMethod(this, "RecordLinkedInSettingsCompliance", 0, [featureName, isEnabled], 0);
        };
        LinkedIn.prototype.toJSON = function () {
            return {};
        };
        return LinkedIn;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.LinkedIn = LinkedIn;
    OfficeCoreOp.linkedIn = _createTopLevelServiceObject(LinkedIn, _localDocumentContext, "Microsoft.DesktopCompliance.LinkedIn", false, 4);
    var NetworkUsage = (function (_super) {
        __extends(NetworkUsage, _super);
        function NetworkUsage() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(NetworkUsage.prototype, "_className", {
            get: function () {
                return "NetworkUsage";
            },
            enumerable: true,
            configurable: true
        });
        NetworkUsage.prototype.isInOnlineMode = function () {
            return _invokeMethod(this, "IsInOnlineMode", 0, [], 0, 0);
        };
        NetworkUsage.prototype.toJSON = function () {
            return {};
        };
        return NetworkUsage;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.NetworkUsage = NetworkUsage;
    OfficeCoreOp.networkUsage = _createTopLevelServiceObject(NetworkUsage, _localDocumentContext, "Microsoft.DesktopCompliance.NetworkUsage", false, 4);
    var DynamicRibbon = (function (_super) {
        __extends(DynamicRibbon, _super);
        function DynamicRibbon() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(DynamicRibbon.prototype, "_className", {
            get: function () {
                return "DynamicRibbon";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(DynamicRibbon.prototype, "_navigationPropertyNames", {
            get: function () {
                return ["buttons"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(DynamicRibbon.prototype, "buttons", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.RibbonButtonCollection, this, "Buttons", true, 4);
            },
            enumerable: true,
            configurable: true
        });
        DynamicRibbon.prototype.executeRequestUpdate = function (jsonUpdate) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.RibbonButton, this, "ExecuteRequestUpdate", 0, [jsonUpdate], false, false, null, 0);
        };
        DynamicRibbon.prototype.getButton = function (id) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.RibbonButton, this, "GetButton", 0, [id], false, false, null, 0);
        };
        DynamicRibbon.prototype.getTab = function (id) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.RibbonTab, this, "GetTab", 0, [id], false, false, null, 0);
        };
        DynamicRibbon.prototype.toJSON = function () {
            return {};
        };
        return DynamicRibbon;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.DynamicRibbon = DynamicRibbon;
    OfficeCoreOp.dynamicRibbon = _createTopLevelServiceObject(DynamicRibbon, _localDocumentContext, "Microsoft.DynamicRibbon.DynamicRibbon", false, 4);
    var RibbonTab = (function (_super) {
        __extends(RibbonTab, _super);
        function RibbonTab() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(RibbonTab.prototype, "_className", {
            get: function () {
                return "RibbonTab";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(RibbonTab.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["id"];
            },
            enumerable: true,
            configurable: true
        });
        RibbonTab.prototype.setVisibility = function (visibility) {
            return _invokeMethod(this, "SetVisibility", 0, [visibility], 0);
        };
        RibbonTab.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        RibbonTab.prototype.toJSON = function () {
            return {};
        };
        return RibbonTab;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.RibbonTab = RibbonTab;
    var RibbonButton = (function (_super) {
        __extends(RibbonButton, _super);
        function RibbonButton() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(RibbonButton.prototype, "_className", {
            get: function () {
                return "RibbonButton";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(RibbonButton.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["id", "enabled", "label"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(RibbonButton.prototype, "_scalarPropertyUpdateable", {
            get: function () {
                return [false, true, false];
            },
            enumerable: true,
            configurable: true
        });
        RibbonButton.prototype.update = function (properties) {
            return _invokeRecursiveUpdate(this, properties);
        };
        RibbonButton.prototype.setEnabled = function (enabled) {
            return _invokeMethod(this, "SetEnabled", 0, [enabled], 0);
        };
        RibbonButton.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        RibbonButton.prototype.toJSON = function () {
            return {};
        };
        return RibbonButton;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.RibbonButton = RibbonButton;
    var RibbonButtonCollection = (function (_super) {
        __extends(RibbonButtonCollection, _super);
        function RibbonButtonCollection() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(RibbonButtonCollection.prototype, "_className", {
            get: function () {
                return "RibbonButtonCollection";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(RibbonButtonCollection.prototype, "_isCollection", {
            get: function () {
                return true;
            },
            enumerable: true,
            configurable: true
        });
        RibbonButtonCollection.prototype.getItem = function (key) {
            return _createIndexerObject(OfficeCoreOp.RibbonButton, this, [key]);
        };
        RibbonButtonCollection.prototype.getCount = function () {
            return _invokeMethod(this, "GetCount", 1, [], 4, 0);
        };
        RibbonButtonCollection.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        RibbonButtonCollection.prototype.toJSON = function () {
            return {};
        };
        return RibbonButtonCollection;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.RibbonButtonCollection = RibbonButtonCollection;
    var TimeStringFormat;
    (function (TimeStringFormat) {
        TimeStringFormat["shortTime"] = "ShortTime";
        TimeStringFormat["longTime"] = "LongTime";
        TimeStringFormat["shortDate"] = "ShortDate";
        TimeStringFormat["longDate"] = "LongDate";
    })(TimeStringFormat = OfficeCoreOp.TimeStringFormat || (OfficeCoreOp.TimeStringFormat = {}));
    var LocaleApi = (function (_super) {
        __extends(LocaleApi, _super);
        function LocaleApi() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(LocaleApi.prototype, "_className", {
            get: function () {
                return "LocaleApi";
            },
            enumerable: true,
            configurable: true
        });
        LocaleApi.prototype.formatDateTimeString = function (localeName, value, format) {
            return _invokeMethod(this, "FormatDateTimeString", 0, [localeName, value, format], 0, 0);
        };
        LocaleApi.prototype.getLocaleDateTimeFormattingInfo = function (localeName) {
            return _invokeMethod(this, "GetLocaleDateTimeFormattingInfo", 0, [localeName], 0, 0);
        };
        LocaleApi.prototype.toJSON = function () {
            return {};
        };
        return LocaleApi;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.LocaleApi = LocaleApi;
    OfficeCoreOp.localeApi = _createTopLevelServiceObject(LocaleApi, _localDocumentContext, "Microsoft.LocaleApi.LocaleApi", false, 4);
    var OfficeServicesManagerApi = (function (_super) {
        __extends(OfficeServicesManagerApi, _super);
        function OfficeServicesManagerApi() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(OfficeServicesManagerApi.prototype, "_className", {
            get: function () {
                return "OfficeServicesManagerApi";
            },
            enumerable: true,
            configurable: true
        });
        OfficeServicesManagerApi.prototype.bindServiceToProfile = function (servicePrefix, identityUniqueId, correlationId) {
            return _invokeMethod(this, "BindServiceToProfile", 0, [servicePrefix, identityUniqueId, correlationId], 0, 0);
        };
        OfficeServicesManagerApi.prototype.toJSON = function () {
            return {};
        };
        return OfficeServicesManagerApi;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.OfficeServicesManagerApi = OfficeServicesManagerApi;
    OfficeCoreOp.officeServicesManagerApi = _createTopLevelServiceObject(OfficeServicesManagerApi, _localDocumentContext, "Microsoft.OfficeServicesManager.OfficeServicesManagerApi", false, 4);
    var Comment = (function (_super) {
        __extends(Comment, _super);
        function Comment() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(Comment.prototype, "_className", {
            get: function () {
                return "Comment";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Comment.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["id", "text", "created", "level", "resolved", "author", "mentions"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Comment.prototype, "_scalarPropertyUpdateable", {
            get: function () {
                return [false, true, false, false, true, false, false];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Comment.prototype, "_navigationPropertyNames", {
            get: function () {
                return ["parent", "parentOrNullObject", "replies"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Comment.prototype, "parent", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.Comment, this, "Parent", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Comment.prototype, "parentOrNullObject", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.Comment, this, "ParentOrNullObject", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Comment.prototype, "replies", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.CommentCollection, this, "Replies", true, 4);
            },
            enumerable: true,
            configurable: true
        });
        Comment.prototype.getParentOrSelf = function () {
            return _createMethodObject(OfficeCoreOp.Comment, this, "GetParentOrSelf", 1, [], false, false, null, 4);
        };
        Comment.prototype.reply = function (text, format) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.Comment, this, "Reply", 0, [text, format], false, false, null, 0);
        };
        Comment.prototype.update = function (properties) {
            return _invokeRecursiveUpdate(this, properties);
        };
        Comment.prototype.delete = function () {
            return _invokeMethod(this, "Delete", 0, [], 0);
        };
        Comment.prototype.getRichText = function (format) {
            return _invokeMethod(this, "GetRichText", 1, [format], 4, 0);
        };
        Comment.prototype.setRichText = function (text, format) {
            return _invokeMethod(this, "SetRichText", 0, [text, format], 0, 0);
        };
        Comment.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        Comment.prototype.toJSON = function () {
            return {};
        };
        return Comment;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.Comment = Comment;
    var CommentCollection = (function (_super) {
        __extends(CommentCollection, _super);
        function CommentCollection() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(CommentCollection.prototype, "_className", {
            get: function () {
                return "CommentCollection";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(CommentCollection.prototype, "_isCollection", {
            get: function () {
                return true;
            },
            enumerable: true,
            configurable: true
        });
        CommentCollection.prototype.getItem = function (id) {
            return _createIndexerObject(OfficeCoreOp.Comment, this, [id]);
        };
        CommentCollection.prototype.getCount = function () {
            return _invokeMethod(this, "GetCount", 1, [], 4, 0);
        };
        CommentCollection.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        CommentCollection.prototype.toJSON = function () {
            return {};
        };
        return CommentCollection;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.CommentCollection = CommentCollection;
    var CommentTextFormat;
    (function (CommentTextFormat) {
        CommentTextFormat["plain"] = "Plain";
        CommentTextFormat["markdown"] = "Markdown";
        CommentTextFormat["delta"] = "Delta";
    })(CommentTextFormat = OfficeCoreOp.CommentTextFormat || (OfficeCoreOp.CommentTextFormat = {}));
    var PersonaCardPerfPoint;
    (function (PersonaCardPerfPoint) {
        PersonaCardPerfPoint["placeHolderRendered"] = "PlaceHolderRendered";
        PersonaCardPerfPoint["initialCardRendered"] = "InitialCardRendered";
    })(PersonaCardPerfPoint = OfficeCoreOp.PersonaCardPerfPoint || (OfficeCoreOp.PersonaCardPerfPoint = {}));
    var UnifiedCommunicationAvailability;
    (function (UnifiedCommunicationAvailability) {
        UnifiedCommunicationAvailability["notSet"] = "NotSet";
        UnifiedCommunicationAvailability["free"] = "Free";
        UnifiedCommunicationAvailability["idle"] = "Idle";
        UnifiedCommunicationAvailability["busy"] = "Busy";
        UnifiedCommunicationAvailability["idleBusy"] = "IdleBusy";
        UnifiedCommunicationAvailability["doNotDisturb"] = "DoNotDisturb";
        UnifiedCommunicationAvailability["unalertable"] = "Unalertable";
        UnifiedCommunicationAvailability["unavailable"] = "Unavailable";
    })(UnifiedCommunicationAvailability = OfficeCoreOp.UnifiedCommunicationAvailability || (OfficeCoreOp.UnifiedCommunicationAvailability = {}));
    var UnifiedCommunicationStatus;
    (function (UnifiedCommunicationStatus) {
        UnifiedCommunicationStatus["online"] = "Online";
        UnifiedCommunicationStatus["notOnline"] = "NotOnline";
        UnifiedCommunicationStatus["away"] = "Away";
        UnifiedCommunicationStatus["busy"] = "Busy";
        UnifiedCommunicationStatus["beRightBack"] = "BeRightBack";
        UnifiedCommunicationStatus["onThePhone"] = "OnThePhone";
        UnifiedCommunicationStatus["outToLunch"] = "OutToLunch";
        UnifiedCommunicationStatus["inAMeeting"] = "InAMeeting";
        UnifiedCommunicationStatus["outOfOffice"] = "OutOfOffice";
        UnifiedCommunicationStatus["doNotDisturb"] = "DoNotDisturb";
        UnifiedCommunicationStatus["inAConference"] = "InAConference";
        UnifiedCommunicationStatus["getting"] = "Getting";
        UnifiedCommunicationStatus["notABuddy"] = "NotABuddy";
        UnifiedCommunicationStatus["disconnected"] = "Disconnected";
        UnifiedCommunicationStatus["notInstalled"] = "NotInstalled";
        UnifiedCommunicationStatus["urgentInterruptionsOnly"] = "UrgentInterruptionsOnly";
        UnifiedCommunicationStatus["mayBeAvailable"] = "MayBeAvailable";
        UnifiedCommunicationStatus["idle"] = "Idle";
        UnifiedCommunicationStatus["inPresentation"] = "InPresentation";
    })(UnifiedCommunicationStatus = OfficeCoreOp.UnifiedCommunicationStatus || (OfficeCoreOp.UnifiedCommunicationStatus = {}));
    var UnifiedCommunicationPresence;
    (function (UnifiedCommunicationPresence) {
        UnifiedCommunicationPresence["free"] = "Free";
        UnifiedCommunicationPresence["busy"] = "Busy";
        UnifiedCommunicationPresence["idle"] = "Idle";
        UnifiedCommunicationPresence["doNotDistrub"] = "DoNotDistrub";
        UnifiedCommunicationPresence["blocked"] = "Blocked";
        UnifiedCommunicationPresence["notSet"] = "NotSet";
        UnifiedCommunicationPresence["outOfOffice"] = "OutOfOffice";
    })(UnifiedCommunicationPresence = OfficeCoreOp.UnifiedCommunicationPresence || (OfficeCoreOp.UnifiedCommunicationPresence = {}));
    var FreeBusyCalendarState;
    (function (FreeBusyCalendarState) {
        FreeBusyCalendarState["unknown"] = "Unknown";
        FreeBusyCalendarState["free"] = "Free";
        FreeBusyCalendarState["busy"] = "Busy";
        FreeBusyCalendarState["elsewhere"] = "Elsewhere";
        FreeBusyCalendarState["tentative"] = "Tentative";
        FreeBusyCalendarState["outOfOffice"] = "OutOfOffice";
    })(FreeBusyCalendarState = OfficeCoreOp.FreeBusyCalendarState || (OfficeCoreOp.FreeBusyCalendarState = {}));
    var PersonaType;
    (function (PersonaType) {
        PersonaType["unknown"] = "Unknown";
        PersonaType["enterprise"] = "Enterprise";
        PersonaType["contact"] = "Contact";
        PersonaType["bot"] = "Bot";
        PersonaType["phoneOnly"] = "PhoneOnly";
        PersonaType["oneOff"] = "OneOff";
        PersonaType["distributionList"] = "DistributionList";
        PersonaType["personalDistributionList"] = "PersonalDistributionList";
        PersonaType["anonymous"] = "Anonymous";
        PersonaType["unifiedGroup"] = "UnifiedGroup";
    })(PersonaType = OfficeCoreOp.PersonaType || (OfficeCoreOp.PersonaType = {}));
    var PhoneType;
    (function (PhoneType) {
        PhoneType["workPhone"] = "WorkPhone";
        PhoneType["homePhone"] = "HomePhone";
        PhoneType["mobilePhone"] = "MobilePhone";
        PhoneType["businessFax"] = "BusinessFax";
        PhoneType["otherPhone"] = "OtherPhone";
    })(PhoneType = OfficeCoreOp.PhoneType || (OfficeCoreOp.PhoneType = {}));
    var AddressType;
    (function (AddressType) {
        AddressType["workAddress"] = "WorkAddress";
        AddressType["homeAddress"] = "HomeAddress";
        AddressType["otherAddress"] = "OtherAddress";
    })(AddressType = OfficeCoreOp.AddressType || (OfficeCoreOp.AddressType = {}));
    var MemberType;
    (function (MemberType) {
        MemberType["unknown"] = "Unknown";
        MemberType["individual"] = "Individual";
        MemberType["group"] = "Group";
    })(MemberType = OfficeCoreOp.MemberType || (OfficeCoreOp.MemberType = {}));
    var MemberInfoList = (function (_super) {
        __extends(MemberInfoList, _super);
        function MemberInfoList() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(MemberInfoList.prototype, "_className", {
            get: function () {
                return "MemberInfoList";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(MemberInfoList.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["isWarmedUp", "isWarmingUp"];
            },
            enumerable: true,
            configurable: true
        });
        MemberInfoList.prototype.getPersonaForMember = function (memberCookie) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.Persona, this, "GetPersonaForMember", 0, [memberCookie], false, false, null, 0);
        };
        MemberInfoList.prototype.items = function () {
            return _invokeMethod(this, "Items", 0, [], 0, 0);
        };
        MemberInfoList.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        MemberInfoList.prototype.toJSON = function () {
            return {};
        };
        return MemberInfoList;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.MemberInfoList = MemberInfoList;
    var PersonaDataUpdated;
    (function (PersonaDataUpdated) {
        PersonaDataUpdated["hostId"] = "HostId";
        PersonaDataUpdated["type"] = "Type";
        PersonaDataUpdated["photo"] = "Photo";
        PersonaDataUpdated["personaInfo"] = "PersonaInfo";
        PersonaDataUpdated["unifiedCommunicationInfo"] = "UnifiedCommunicationInfo";
        PersonaDataUpdated["organization"] = "Organization";
        PersonaDataUpdated["unifiedGroupInfo"] = "UnifiedGroupInfo";
        PersonaDataUpdated["members"] = "Members";
        PersonaDataUpdated["membership"] = "Membership";
        PersonaDataUpdated["capabilities"] = "Capabilities";
        PersonaDataUpdated["customizations"] = "Customizations";
        PersonaDataUpdated["viewableSources"] = "ViewableSources";
        PersonaDataUpdated["placeholder"] = "Placeholder";
    })(PersonaDataUpdated = OfficeCoreOp.PersonaDataUpdated || (OfficeCoreOp.PersonaDataUpdated = {}));
    var PersonaActions = (function (_super) {
        __extends(PersonaActions, _super);
        function PersonaActions() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(PersonaActions.prototype, "_className", {
            get: function () {
                return "PersonaActions";
            },
            enumerable: true,
            configurable: true
        });
        PersonaActions.prototype.addContact = function () {
            return _invokeMethod(this, "AddContact", 0, [], 0);
        };
        PersonaActions.prototype.callPhoneNumber = function (contactNumber) {
            return _invokeMethod(this, "CallPhoneNumber", 0, [contactNumber], 0);
        };
        PersonaActions.prototype.composeEmail = function (emailAddress) {
            return _invokeMethod(this, "ComposeEmail", 0, [emailAddress], 0);
        };
        PersonaActions.prototype.composeInstantMessage = function (sipAddress) {
            return _invokeMethod(this, "ComposeInstantMessage", 0, [sipAddress], 0);
        };
        PersonaActions.prototype.editContact = function () {
            return _invokeMethod(this, "EditContact", 0, [], 0);
        };
        PersonaActions.prototype.editContactByIdentifier = function (identifier) {
            return _invokeMethod(this, "EditContactByIdentifier", 0, [identifier], 0);
        };
        PersonaActions.prototype.hideHoverCardForPersona = function () {
            return _invokeMethod(this, "HideHoverCardForPersona", 0, [], 0);
        };
        PersonaActions.prototype.openGroupCalendar = function () {
            return _invokeMethod(this, "OpenGroupCalendar", 0, [], 0);
        };
        PersonaActions.prototype.openLinkContactUx = function () {
            return _invokeMethod(this, "OpenLinkContactUx", 0, [], 0);
        };
        PersonaActions.prototype.pinPersonaToQuickContacts = function () {
            return _invokeMethod(this, "PinPersonaToQuickContacts", 0, [], 0);
        };
        PersonaActions.prototype.scheduleMeeting = function () {
            return _invokeMethod(this, "ScheduleMeeting", 0, [], 0);
        };
        PersonaActions.prototype.showContactCard = function (pointToShowX, pointToShowY, personaRectTop, personaRectLeft, personaRectWidth, personaRectHeight) {
            return _invokeMethod(this, "ShowContactCard", 0, [pointToShowX, pointToShowY, personaRectTop, personaRectLeft, personaRectWidth, personaRectHeight], 0);
        };
        PersonaActions.prototype.showContextMenu = function (pointToShowX, pointToShowY, personaRectTop, personaRectLeft, personaRectWidth, personaRectHeight) {
            return _invokeMethod(this, "ShowContextMenu", 0, [pointToShowX, pointToShowY, personaRectTop, personaRectLeft, personaRectWidth, personaRectHeight], 0);
        };
        PersonaActions.prototype.showExpandedCard = function (pointToShowX, pointToShowY, personaRectTop, personaRectLeft, personaRectWidth, personaRectHeight) {
            return _invokeMethod(this, "ShowExpandedCard", 0, [pointToShowX, pointToShowY, personaRectTop, personaRectLeft, personaRectWidth, personaRectHeight], 0);
        };
        PersonaActions.prototype.showHoverCardForPersona = function (pointToShowX, pointToShowY, personaRectTop, personaRectLeft, personaRectWidth, personaRectHeight) {
            return _invokeMethod(this, "ShowHoverCardForPersona", 0, [pointToShowX, pointToShowY, personaRectTop, personaRectLeft, personaRectWidth, personaRectHeight], 0);
        };
        PersonaActions.prototype.subscribeToGroup = function () {
            return _invokeMethod(this, "SubscribeToGroup", 0, [], 0);
        };
        PersonaActions.prototype.toggleTagForAlerts = function () {
            return _invokeMethod(this, "ToggleTagForAlerts", 0, [], 0);
        };
        PersonaActions.prototype.unsubscribeFromGroup = function () {
            return _invokeMethod(this, "UnsubscribeFromGroup", 0, [], 0);
        };
        PersonaActions.prototype.toJSON = function () {
            return {};
        };
        return PersonaActions;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.PersonaActions = PersonaActions;
    var PersonaInfoSource = (function (_super) {
        __extends(PersonaInfoSource, _super);
        function PersonaInfoSource() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(PersonaInfoSource.prototype, "_className", {
            get: function () {
                return "PersonaInfoSource";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaInfoSource.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["displayName", "email", "emailAddresses", "sipAddresses", "birthday", "birthdays", "title", "jobInfoDepartment", "companyName", "office", "linkedTitles", "linkedDepartments", "linkedCompanyNames", "linkedOffices", "phones", "addresses", "webSites", "notes"];
            },
            enumerable: true,
            configurable: true
        });
        PersonaInfoSource.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        PersonaInfoSource.prototype.toJSON = function () {
            return {};
        };
        return PersonaInfoSource;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.PersonaInfoSource = PersonaInfoSource;
    var PersonaInfo = (function (_super) {
        __extends(PersonaInfo, _super);
        function PersonaInfo() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(PersonaInfo.prototype, "_className", {
            get: function () {
                return "PersonaInfo";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaInfo.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["displayName", "email", "emailAddresses", "sipAddresses", "birthday", "birthdays", "title", "jobInfoDepartment", "companyName", "office", "linkedTitles", "linkedDepartments", "linkedCompanyNames", "linkedOffices", "webSites", "notes", "isPersonResolved"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaInfo.prototype, "_navigationPropertyNames", {
            get: function () {
                return ["sources"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaInfo.prototype, "sources", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.PersonaInfoSource, this, "Sources", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        PersonaInfo.prototype.getAddresses = function () {
            return _invokeMethod(this, "GetAddresses", 1, [], 4, 0);
        };
        PersonaInfo.prototype.getPhones = function () {
            return _invokeMethod(this, "GetPhones", 1, [], 4, 0);
        };
        PersonaInfo.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        PersonaInfo.prototype.toJSON = function () {
            return {};
        };
        return PersonaInfo;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.PersonaInfo = PersonaInfo;
    var PersonaUnifiedCommunicationInfo = (function (_super) {
        __extends(PersonaUnifiedCommunicationInfo, _super);
        function PersonaUnifiedCommunicationInfo() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(PersonaUnifiedCommunicationInfo.prototype, "_className", {
            get: function () {
                return "PersonaUnifiedCommunicationInfo";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaUnifiedCommunicationInfo.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["availability", "status", "isSelf", "isTagged", "customStatusString", "isBlocked", "presenceTooltip", "isOutOfOffice", "outOfOfficeNote", "timezone", "meetingLocation", "meetingSubject", "timezoneBias", "idleStartTime", "overallCapability", "isOnBuddyList", "presenceNote", "voiceMailUri", "availabilityText", "availabilityTooltip", "isDurationInAvailabilityText", "freeBusyStatus", "calendarState", "presence"];
            },
            enumerable: true,
            configurable: true
        });
        PersonaUnifiedCommunicationInfo.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        PersonaUnifiedCommunicationInfo.prototype.toJSON = function () {
            return {};
        };
        return PersonaUnifiedCommunicationInfo;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.PersonaUnifiedCommunicationInfo = PersonaUnifiedCommunicationInfo;
    var PersonaPhotoInfo = (function (_super) {
        __extends(PersonaPhotoInfo, _super);
        function PersonaPhotoInfo() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(PersonaPhotoInfo.prototype, "_className", {
            get: function () {
                return "PersonaPhotoInfo";
            },
            enumerable: true,
            configurable: true
        });
        PersonaPhotoInfo.prototype.getImageUri = function (uriScheme) {
            return _invokeMethod(this, "getImageUri", 0, [uriScheme], 0, 0);
        };
        PersonaPhotoInfo.prototype.getPlaceholderUri = function (uriScheme) {
            return _invokeMethod(this, "getPlaceholderUri", 0, [uriScheme], 0, 0);
        };
        PersonaPhotoInfo.prototype.setPlaceholderColor = function (color) {
            return _invokeMethod(this, "setPlaceholderColor", 0, [color], 0);
        };
        PersonaPhotoInfo.prototype.toJSON = function () {
            return {};
        };
        return PersonaPhotoInfo;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.PersonaPhotoInfo = PersonaPhotoInfo;
    var PersonaCollection = (function (_super) {
        __extends(PersonaCollection, _super);
        function PersonaCollection() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(PersonaCollection.prototype, "_className", {
            get: function () {
                return "PersonaCollection";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaCollection.prototype, "_isCollection", {
            get: function () {
                return true;
            },
            enumerable: true,
            configurable: true
        });
        PersonaCollection.prototype.getItem = function (index) {
            return _createIndexerObject(OfficeCoreOp.Persona, this, [index]);
        };
        PersonaCollection.prototype.getCount = function () {
            return _invokeMethod(this, "GetCount", 1, [], 4, 0);
        };
        PersonaCollection.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        PersonaCollection.prototype.toJSON = function () {
            return {};
        };
        return PersonaCollection;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.PersonaCollection = PersonaCollection;
    var PersonaOrganizationInfo = (function (_super) {
        __extends(PersonaOrganizationInfo, _super);
        function PersonaOrganizationInfo() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(PersonaOrganizationInfo.prototype, "_className", {
            get: function () {
                return "PersonaOrganizationInfo";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaOrganizationInfo.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["isWarmedUp", "isWarmingUp"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaOrganizationInfo.prototype, "_navigationPropertyNames", {
            get: function () {
                return ["hierarchy", "manager", "directReports"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaOrganizationInfo.prototype, "directReports", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.PersonaCollection, this, "DirectReports", true, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaOrganizationInfo.prototype, "hierarchy", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.PersonaCollection, this, "Hierarchy", true, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaOrganizationInfo.prototype, "manager", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.Persona, this, "Manager", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        PersonaOrganizationInfo.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        PersonaOrganizationInfo.prototype.toJSON = function () {
            return {};
        };
        return PersonaOrganizationInfo;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.PersonaOrganizationInfo = PersonaOrganizationInfo;
    var CustomizedData;
    (function (CustomizedData) {
        CustomizedData["email"] = "Email";
        CustomizedData["workPhone"] = "WorkPhone";
        CustomizedData["workPhone2"] = "WorkPhone2";
        CustomizedData["workFax"] = "WorkFax";
        CustomizedData["mobilePhone"] = "MobilePhone";
        CustomizedData["homePhone"] = "HomePhone";
        CustomizedData["homePhone2"] = "HomePhone2";
        CustomizedData["otherPhone"] = "OtherPhone";
        CustomizedData["sipAddress"] = "SipAddress";
        CustomizedData["profile"] = "Profile";
        CustomizedData["office"] = "Office";
        CustomizedData["company"] = "Company";
        CustomizedData["workAddress"] = "WorkAddress";
        CustomizedData["homeAddress"] = "HomeAddress";
        CustomizedData["otherAddress"] = "OtherAddress";
        CustomizedData["birthday"] = "Birthday";
    })(CustomizedData = OfficeCoreOp.CustomizedData || (OfficeCoreOp.CustomizedData = {}));
    var UnifiedGroupInfo = (function (_super) {
        __extends(UnifiedGroupInfo, _super);
        function UnifiedGroupInfo() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(UnifiedGroupInfo.prototype, "_className", {
            get: function () {
                return "UnifiedGroupInfo";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(UnifiedGroupInfo.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["description", "oneDrive", "oneNote", "isPublic", "amIOwner", "amIMember", "amISubscribed", "memberCount", "ownerCount", "hasGuests", "site", "planner", "classification", "subscriptionEnabled"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(UnifiedGroupInfo.prototype, "_scalarPropertyUpdateable", {
            get: function () {
                return [true, true, true, true, true, true, true, true, true, true, true, true, true, true];
            },
            enumerable: true,
            configurable: true
        });
        UnifiedGroupInfo.prototype.update = function (properties) {
            return _invokeRecursiveUpdate(this, properties);
        };
        UnifiedGroupInfo.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        UnifiedGroupInfo.prototype.toJSON = function () {
            return {};
        };
        return UnifiedGroupInfo;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.UnifiedGroupInfo = UnifiedGroupInfo;
    var PersonaPromiseType;
    (function (PersonaPromiseType) {
        PersonaPromiseType[PersonaPromiseType["immediate"] = 0] = "immediate";
        PersonaPromiseType[PersonaPromiseType["load"] = 3] = "load";
    })(PersonaPromiseType = OfficeCoreOp.PersonaPromiseType || (OfficeCoreOp.PersonaPromiseType = {}));
    var PersonaInfoResult = (function () {
        function PersonaInfoResult() {
        }
        return PersonaInfoResult;
    }());
    OfficeCoreOp.PersonaInfoResult = PersonaInfoResult;
    ;
    var PersonaOrganizationResult = (function () {
        function PersonaOrganizationResult() {
        }
        return PersonaOrganizationResult;
    }());
    OfficeCoreOp.PersonaOrganizationResult = PersonaOrganizationResult;
    var MemberInfoListResult = (function () {
        function MemberInfoListResult() {
        }
        return MemberInfoListResult;
    }());
    OfficeCoreOp.MemberInfoListResult = MemberInfoListResult;
    var Persona = (function (_super) {
        __extends(Persona, _super);
        function Persona() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(Persona.prototype, "_className", {
            get: function () {
                return "Persona";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Persona.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["hostId", "type", "capabilities", "diagnosticId", "instanceId"];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Persona.prototype, "_navigationPropertyNames", {
            get: function () {
                return ["photo", "personaInfo", "unifiedCommunicationInfo", "organization", "unifiedGroupInfo", "actions"];
            },
            enumerable: true,
            configurable: true
        });
        Persona.prototype.performAsyncOperation = function (type, waitFor, action, check) {
            var _this = this;
            if (type === PersonaPromiseType.immediate) {
                return action();
            }
            return check().then(function (isWarmedUp) {
                if (isWarmedUp) {
                    return action();
                }
                return OfficeExtension.CoreUtility.Promise.all([
                    _this.retrieve({ hostId: true }),
                    _this.getPersonaLifetime()
                ]).then(function (values) {
                    var hostId = values[0].hostId, personaLifetime = values[1];
                    return new OfficeExtension.CoreUtility.Promise(function (resolve, reject) {
                        var eventHandler = function (args) {
                            if (args.sendingPersonaHostId === hostId) {
                                for (var _i = 0, _a = args.dataUpdated; _i < _a.length; _i++) {
                                    var updated = _a[_i];
                                    if (waitFor === updated) {
                                        check().then(function (isWarmedUp) {
                                            if (isWarmedUp) {
                                                personaLifetime.off('PersonaUpdated', eventHandler).catch(function () { });
                                                resolve(action());
                                            }
                                        }).catch(reject);
                                    }
                                }
                            }
                        };
                        personaLifetime.on('PersonaUpdated', eventHandler)
                            .then(function () { return _this.retrieve({ hostId: true }); })
                            .catch(reject);
                    });
                });
            });
        };
        Persona.prototype.getOrganizationAsync = function (type) {
            var _this = this;
            var action = function () { return _this.organization.retrieve({ $all: true })
                .then(function (value) { return ({
                data: value,
                organization: _this.organization
            }); }); };
            var check = function () { return _this.organization.retrieve({ isWarmedUp: true })
                .then(function (value) { return value.isWarmedUp; }); };
            return this.performAsyncOperation(type, PersonaDataUpdated.organization, action, check);
        };
        Persona.prototype.getIsPersonaInfoResolvedCheck = function () {
            return this.personaInfo.retrieve({ isPersonResolved: true })
                .then(function (value) { return value.isPersonResolved; });
        };
        Persona.prototype.getPersonaInfoAsync = function (type) {
            var _this = this;
            var action = function () {
                return OfficeExtension.CoreUtility.Promise.all([
                    _this.retrieve({ hostId: true, diagnosticId: true, type: true }),
                    _this.personaInfo.retrieve({ $all: true, sources: { $all: true } }),
                    _this.personaInfo.getAddresses(),
                    _this.personaInfo.getPhones()
                ])
                    .then(function (values) {
                    var _a;
                    var result = new PersonaInfoResult();
                    _a = values[0], result.hostId = _a.hostId, result.diagnosticId = _a.diagnosticId, result.type = _a.type, result.infoAndSources = values[1], result.infoAndSources.addresses = values[2], result.infoAndSources.phones = values[3];
                    result.addresses = result.infoAndSources.addresses;
                    result.phones = result.infoAndSources.phones;
                    if (typeof result.infoAndSources.birthday === 'string') {
                        result.infoAndSources.birthday = OfficeExtension.CommonUtility.adjustToDateTime(result.infoAndSources.birthday);
                        result.infoAndSources.birthdays = OfficeExtension.CommonUtility.adjustToDateTime(result.infoAndSources.birthdays);
                    }
                    return result;
                });
            };
            var check = function () { return _this.getIsPersonaInfoResolvedCheck(); };
            return this.performAsyncOperation(type, PersonaDataUpdated.personaInfo, action, check);
        };
        Persona.prototype.getPhotoUriAsync = function (uriScheme, type) {
            var _this = this;
            var action = function () { return _this.photo.getImageUri(uriScheme); };
            var check = function () { return _this.getIsPersonaInfoResolvedCheck(); };
            return this.performAsyncOperation(type, PersonaDataUpdated.personaInfo, action, check);
        };
        Persona.prototype.getUnifiedCommunicationInfoAsync = function (type) {
            var _this = this;
            var action = function () { return _this.unifiedCommunicationInfo.retrieve({ $all: true }); };
            var check = function () { return _this.getIsPersonaInfoResolvedCheck(); };
            return this.performAsyncOperation(type, PersonaDataUpdated.personaInfo, action, check);
        };
        Persona.prototype.getUnifiedGroupInfoAsync = function (type) {
            var _this = this;
            var action = function () { return _this.unifiedGroupInfo.retrieve({ $all: true }); };
            var check = function () { return _this.getIsPersonaInfoResolvedCheck(); };
            return this.performAsyncOperation(type, PersonaDataUpdated.personaInfo, action, check);
        };
        Persona.prototype.getTypeAsync = function (type) {
            var _this = this;
            var action = function () { return _this.retrieve({ type: true }).then(function (value) { return value.type; }); };
            var check = function () { return _this.getIsPersonaInfoResolvedCheck(); };
            return this.performAsyncOperation(type, PersonaDataUpdated.personaInfo, action, check);
        };
        Persona.prototype.getCustomizationsAsync = function (type) {
            var _this = this;
            var action = function () { return _this.getCustomizations(); };
            var check = function () { return _this.getIsPersonaInfoResolvedCheck(); };
            return this.performAsyncOperation(type, PersonaDataUpdated.personaInfo, action, check);
        };
        Persona.prototype.getMembersAsync = function (type) {
            var _this = this;
            var action = function () { return _this.getMembers()
                .then(function (memberInfo) { return OfficeExtension.CoreUtility.Promise.all([
                memberInfo,
                memberInfo.retrieve({ $all: true }),
                memberInfo.items()
            ]); })
                .then(function (values) {
                var result = new MemberInfoListResult();
                result.list = values[0], result.data = values[1], result.members = values[2];
                return result;
            }); };
            var check = function () { return _this.getMembers()
                .then(function (members) { return members.retrieve({ isWarmedUp: true }); })
                .then(function (value) { return value.isWarmedUp; }); };
            return this.performAsyncOperation(type, PersonaDataUpdated.members, action, check);
        };
        Persona.prototype.getMembershipAsync = function (type) {
            var _this = this;
            var action = function () { return _this.getMembership()
                .then(function (membership) { return OfficeExtension.CoreUtility.Promise.all([
                membership,
                membership.retrieve({ $all: true }),
                membership.items()
            ]); })
                .then(function (values) {
                var result = new MemberInfoListResult();
                result.list = values[0], result.data = values[1], result.members = values[2];
                return result;
            }); };
            var check = function () { return _this.getMembership()
                .then(function (membership) { return membership.retrieve({ isWarmedUp: true }); })
                .then(function (value) { return value.isWarmedUp; }); };
            return this.performAsyncOperation(type, PersonaDataUpdated.membership, action, check);
        };
        Persona.prototype.getPersonaLifetime = function () {
            return this.retrieve({ instanceId: true })
                .then(function (data) { return new PeopleApiContext(data.instanceId).getPersonaLifetime(); });
        };
        Persona.prototype.getViewableSourcesAsync = function (type) {
            var _this = this;
            var action = function () { return _this.getViewableSources(); };
            var check = function () { return _this.getIsPersonaInfoResolvedCheck(); };
            return this.performAsyncOperation(type, PersonaDataUpdated.personaInfo, action, check);
        };
        Object.defineProperty(Persona.prototype, "actions", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.PersonaActions, this, "Actions", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Persona.prototype, "organization", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.PersonaOrganizationInfo, this, "Organization", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Persona.prototype, "personaInfo", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.PersonaInfo, this, "PersonaInfo", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Persona.prototype, "photo", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.PersonaPhotoInfo, this, "Photo", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Persona.prototype, "unifiedCommunicationInfo", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.PersonaUnifiedCommunicationInfo, this, "UnifiedCommunicationInfo", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Persona.prototype, "unifiedGroupInfo", {
            get: function () {
                return _createPropertyObject(OfficeCoreOp.UnifiedGroupInfo, this, "UnifiedGroupInfo", false, 4);
            },
            enumerable: true,
            configurable: true
        });
        Persona.prototype.getMembers = function () {
            return _createAndInstantiateMethodObject(OfficeCoreOp.MemberInfoList, this, "GetMembers", 0, [], false, false, null, 0);
        };
        Persona.prototype.getMembership = function () {
            return _createAndInstantiateMethodObject(OfficeCoreOp.MemberInfoList, this, "GetMembership", 0, [], false, false, null, 0);
        };
        Persona.prototype.dispose = function () {
            return _invokeMethod(this, "Dispose", 0, [], 0);
        };
        Persona.prototype.getCustomizations = function () {
            return _invokeMethod(this, "GetCustomizations", 0, [], 0, 0);
        };
        Persona.prototype.getViewableSources = function () {
            return _invokeMethod(this, "GetViewableSources", 0, [], 0, 0);
        };
        Persona.prototype.reportTimeForRender = function (perfpoint, millisecUTC) {
            return _invokeMethod(this, "ReportTimeForRender", 0, [perfpoint, millisecUTC], 0);
        };
        Persona.prototype.warmup = function (dataToWarmUp) {
            return _invokeMethod(this, "Warmup", 0, [dataToWarmUp], 0);
        };
        Persona.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        Persona.prototype.toJSON = function () {
            return {};
        };
        return Persona;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.Persona = Persona;
    var PersonaLifetime = (function (_super) {
        __extends(PersonaLifetime, _super);
        function PersonaLifetime() {
            var _this = _super !== null && _super.apply(this, arguments) || this;
            _this.m_GenericEventInfoOperational = {};
            return _this;
        }
        Object.defineProperty(PersonaLifetime.prototype, "_className", {
            get: function () {
                return "PersonaLifetime";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PersonaLifetime.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["instanceId"];
            },
            enumerable: true,
            configurable: true
        });
        PersonaLifetime.prototype.Initialize = function (instanceId) {
            this.instanceId = instanceId;
        };
        PersonaLifetime.prototype.getPersona = function (hostId) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.Persona, this, "GetPersona", 0, [hostId], false, false, null, 0);
        };
        PersonaLifetime.prototype.getPersonaForOrgByEntryId = function (entryId, name, sip, smtp) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.Persona, this, "GetPersonaForOrgByEntryId", 0, [entryId, name, sip, smtp], false, false, null, 0);
        };
        PersonaLifetime.prototype.getPersonaForOrgEntry = function (name, sip, smtp, entryId) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.Persona, this, "GetPersonaForOrgEntry", 0, [name, sip, smtp, entryId], false, false, null, 0);
        };
        PersonaLifetime.prototype.getPolicies = function () {
            return _invokeMethod(this, "GetPolicies", 0, [], 0, 0);
        };
        PersonaLifetime.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        PersonaLifetime.prototype.toJSON = function () {
            return {};
        };
        Object.defineProperty(PersonaLifetime.prototype, "onPersonaUpdated", {
            get: function () {
                var _this = this;
                return new OfficeExtension.GenericEventHandlerOperational({
                    object: this,
                    getTargetIdFunc: function () { return _this.instanceId; },
                    eventType: 3502,
                    register: '_RegisterPersonaUpdatedEvent',
                    unregister: '_UnregisterPersonaUpdatedEvent',
                    eventArgsTransformFunc: function (value) {
                        var event = {
                            dataUpdated: value.dataUpdated,
                            sendingPersonaHostId: value.sendingPersonaHostId
                        };
                        return OfficeExtension.CoreUtility._createPromiseFromResult(event);
                    }
                });
            },
            enumerable: true,
            configurable: true
        });
        PersonaLifetime.prototype.getGenericEventHandler = function (eventName) {
            var _this = this;
            var map = {
                "PersonaUpdated": function () { return _this.onPersonaUpdated; }
            };
            if (!eventName || !map.hasOwnProperty(eventName)) {
                throw 'invalid event name';
            }
            if (!this.m_GenericEventInfoOperational.hasOwnProperty(eventName)) {
                this.m_GenericEventInfoOperational[eventName] = map[eventName]();
            }
            return this.m_GenericEventInfoOperational[eventName];
        };
        PersonaLifetime.prototype.on = function (eventName, handler, options) {
            return _eventOn(this.getGenericEventHandler(eventName), handler, options);
        };
        PersonaLifetime.prototype.off = function (eventName, handler) {
            return _eventOff(this.m_GenericEventInfoOperational, this.getGenericEventHandler(eventName), eventName, handler);
        };
        return PersonaLifetime;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.PersonaLifetime = PersonaLifetime;
    function getLokiTokenProvider(accountId) {
        return OfficeCoreOp.lokiTokenProviderFactory.getLokiTokenProvider(accountId)
            .then(function (provider) { return provider.initialize().then(function () { return provider; }); });
    }
    OfficeCoreOp.getLokiTokenProvider = getLokiTokenProvider;
    var LokiTokenProvider = (function (_super) {
        __extends(LokiTokenProvider, _super);
        function LokiTokenProvider() {
            var _this = _super !== null && _super.apply(this, arguments) || this;
            _this.m_GenericEventInfoOperational = {};
            return _this;
        }
        Object.defineProperty(LokiTokenProvider.prototype, "_className", {
            get: function () {
                return "LokiTokenProvider";
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(LokiTokenProvider.prototype, "_scalarPropertyNames", {
            get: function () {
                return ["emailOrUpn", "instanceId"];
            },
            enumerable: true,
            configurable: true
        });
        LokiTokenProvider.prototype.initialize = function () {
            var _this = this;
            return this.retrieve({ instanceId: true }).then(function (value) {
                _this.instanceId = value.instanceId;
            });
        };
        LokiTokenProvider.prototype.requestTokenAsync = function () {
            var _this = this;
            return new OfficeExtension.CoreUtility.Promise(function (resolve, reject) {
                var eventHandler = function (args) {
                    _this.off('LokiTokenAvailable', eventHandler).catch(function () { });
                    resolve(args);
                };
                _this.on('LokiTokenAvailable', eventHandler)
                    .then(function () { return _this.retrieve({ instanceId: true }); })
                    .then(function (_) { return _this.requestToken(); })
                    .catch(reject);
            });
        };
        LokiTokenProvider.prototype.requestIdentityUniqueIdAsync = function () {
            var _this = this;
            return new OfficeExtension.CoreUtility.Promise(function (resolve, reject) {
                var eventHandler = function (args) {
                    _this.off('IdentityUniqueIdAvailable', eventHandler).catch(function () { });
                    resolve(args);
                };
                _this.on('IdentityUniqueIdAvailable', eventHandler)
                    .then(function () { return _this.retrieve({ instanceId: true }); })
                    .then(function (_) { return _this.requestIdentityUniqueId(); })
                    .catch(reject);
            });
        };
        LokiTokenProvider.prototype.requestIdentityUniqueId = function () {
            return _invokeMethod(this, "RequestIdentityUniqueId", 0, [], 0);
        };
        LokiTokenProvider.prototype.requestToken = function () {
            return _invokeMethod(this, "RequestToken", 0, [], 0);
        };
        LokiTokenProvider.prototype.retrieve = function () {
            var select = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                select[_i] = arguments[_i];
            }
            return _invokeRetrieve(this, select);
        };
        LokiTokenProvider.prototype.toJSON = function () {
            return {};
        };
        Object.defineProperty(LokiTokenProvider.prototype, "onIdentityUniqueIdAvailable", {
            get: function () {
                var _this = this;
                return new OfficeExtension.GenericEventHandlerOperational({
                    object: this,
                    getTargetIdFunc: function () { return _this.instanceId; },
                    eventType: 3504,
                    register: '_RegisterIdentityUniqueIdAvailableEvent',
                    unregister: '_UnregisterIdentityUniqueIdAvailableEvent',
                    eventArgsTransformFunc: function (value) {
                        var event = {
                            isAvailable: value.isAvailable,
                            uniqueId: value.uniqueId
                        };
                        return OfficeExtension.CoreUtility._createPromiseFromResult(event);
                    }
                });
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(LokiTokenProvider.prototype, "onLokiTokenAvailable", {
            get: function () {
                var _this = this;
                return new OfficeExtension.GenericEventHandlerOperational({
                    object: this,
                    getTargetIdFunc: function () { return _this.instanceId; },
                    eventType: 3503,
                    register: '_RegisterLokiTokenAvailableEvent',
                    unregister: '_UnregisterLokiTokenAvailableEvent',
                    eventArgsTransformFunc: function (value) {
                        var event = {
                            isAvailable: value.isAvailable,
                            lokiAutoDiscoverUrl: value.lokiAutoDiscoverUrl,
                            lokiToken: value.lokiToken
                        };
                        return OfficeExtension.CoreUtility._createPromiseFromResult(event);
                    }
                });
            },
            enumerable: true,
            configurable: true
        });
        LokiTokenProvider.prototype.getGenericEventHandler = function (eventName) {
            var _this = this;
            var map = {
                "IdentityUniqueIdAvailable": function () { return _this.onIdentityUniqueIdAvailable; },
                "LokiTokenAvailable": function () { return _this.onLokiTokenAvailable; }
            };
            if (!eventName || !map.hasOwnProperty(eventName)) {
                throw 'invalid event name';
            }
            if (!this.m_GenericEventInfoOperational.hasOwnProperty(eventName)) {
                this.m_GenericEventInfoOperational[eventName] = map[eventName]();
            }
            return this.m_GenericEventInfoOperational[eventName];
        };
        LokiTokenProvider.prototype.on = function (eventName, handler, options) {
            return _eventOn(this.getGenericEventHandler(eventName), handler, options);
        };
        LokiTokenProvider.prototype.off = function (eventName, handler) {
            return _eventOff(this.m_GenericEventInfoOperational, this.getGenericEventHandler(eventName), eventName, handler);
        };
        return LokiTokenProvider;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.LokiTokenProvider = LokiTokenProvider;
    var LokiTokenProviderFactory = (function (_super) {
        __extends(LokiTokenProviderFactory, _super);
        function LokiTokenProviderFactory() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(LokiTokenProviderFactory.prototype, "_className", {
            get: function () {
                return "LokiTokenProviderFactory";
            },
            enumerable: true,
            configurable: true
        });
        LokiTokenProviderFactory.prototype.getLokiTokenProvider = function (accountName) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.LokiTokenProvider, this, "GetLokiTokenProvider", 0, [accountName], false, false, null, 0);
        };
        LokiTokenProviderFactory.prototype.toJSON = function () {
            return {};
        };
        return LokiTokenProviderFactory;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.LokiTokenProviderFactory = LokiTokenProviderFactory;
    OfficeCoreOp.lokiTokenProviderFactory = _createTopLevelServiceObject(LokiTokenProviderFactory, _localDocumentContext, "Microsoft.People.LokiTokenProviderFactory", false, 4);
    var PeopleApiContext = (function () {
        function PeopleApiContext(instanceId) {
            this.instanceId = instanceId;
            this.m_serviceContext = OfficeCoreOp.serviceContext;
        }
        PeopleApiContext.prototype.getAccountEmail = function () {
            return this.m_serviceContext.accountEmailOrUpn(this.instanceId);
        };
        PeopleApiContext.prototype.launchLinkedIn2WayBinding = function (correlationId) {
            return this.getAccountEmail()
                .then(function (emailOrUpn) { return OfficeCoreOp.getLokiTokenProvider(emailOrUpn); })
                .then(function (provider) { return provider.requestIdentityUniqueIdAsync(); })
                .then(function (value) { return value.isAvailable &&
                OfficeCoreOp.officeServicesManagerApi.bindServiceToProfile('FP_LINKEDIN_2WAY', value.uniqueId, correlationId); });
        };
        PeopleApiContext.prototype.getPersonaLifetime = function () {
            var _this = this;
            return this.m_serviceContext.getPersonaLifetime(this.instanceId)
                .then(function (lifetime) {
                lifetime.Initialize(_this.instanceId);
                return lifetime;
            });
        };
        PeopleApiContext.prototype.getInitialPersona = function () {
            return this.m_serviceContext.getInitialPersona(this.instanceId);
        };
        PeopleApiContext.prototype.getLokiTokenProvider = function () {
            return this.m_serviceContext.getLokiTokenProvider(this.instanceId).then(function (provider) {
                return provider.initialize().then(function () {
                    return provider;
                });
            });
        };
        return PeopleApiContext;
    }());
    OfficeCoreOp.PeopleApiContext = PeopleApiContext;
    function getPersonaPolicies() {
        return OfficeCoreOp.serviceContext.getPersonaPolicies();
    }
    OfficeCoreOp.getPersonaPolicies = getPersonaPolicies;
    var ServiceContext = (function (_super) {
        __extends(ServiceContext, _super);
        function ServiceContext() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(ServiceContext.prototype, "_className", {
            get: function () {
                return "ServiceContext";
            },
            enumerable: true,
            configurable: true
        });
        ServiceContext.prototype.getInitialPersona = function (instanceId) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.Persona, this, "GetInitialPersona", 0, [instanceId], false, false, null, 0);
        };
        ServiceContext.prototype.getLokiTokenProvider = function (instanceId) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.LokiTokenProvider, this, "GetLokiTokenProvider", 0, [instanceId], false, false, null, 0);
        };
        ServiceContext.prototype.getPersonaLifetime = function (instanceId) {
            return _createAndInstantiateMethodObject(OfficeCoreOp.PersonaLifetime, this, "GetPersonaLifetime", 0, [instanceId], false, false, null, 0);
        };
        ServiceContext.prototype.accountEmailOrUpn = function (instanceId) {
            return _invokeMethod(this, "AccountEmailOrUpn", 0, [instanceId], 0, 0);
        };
        ServiceContext.prototype.dispose = function (instance) {
            return _invokeMethod(this, "Dispose", 0, [instance], 0);
        };
        ServiceContext.prototype.getPersonaPolicies = function () {
            return _invokeMethod(this, "GetPersonaPolicies", 0, [], 0, 0);
        };
        ServiceContext.prototype.toJSON = function () {
            return {};
        };
        return ServiceContext;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.ServiceContext = ServiceContext;
    OfficeCoreOp.serviceContext = _createTopLevelServiceObject(ServiceContext, _localDocumentContext, "Microsoft.People.ServiceContext", false, 4);
    var Tap = (function (_super) {
        __extends(Tap, _super);
        function Tap() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Object.defineProperty(Tap.prototype, "_className", {
            get: function () {
                return "Tap";
            },
            enumerable: true,
            configurable: true
        });
        Tap.prototype.getEnterpriseUserInfo = function () {
            return _invokeMethod(this, "GetEnterpriseUserInfo", 1, [], 4 | 1, 0);
        };
        Tap.prototype.getMruFriendlyPath = function (documentUrl) {
            return _invokeMethod(this, "GetMruFriendlyPath", 1, [documentUrl], 4 | 1, 0);
        };
        Tap.prototype.launchFileUrlInOfficeApp = function (documentUrl, useUniversalAsBackup) {
            return _invokeMethod(this, "LaunchFileUrlInOfficeApp", 1, [documentUrl, useUniversalAsBackup], 4 | 1, 0);
        };
        Tap.prototype.performLocalSearch = function (query, numResultsRequested, supportedFileExtensions, documentUrlToExclude) {
            return _invokeMethod(this, "PerformLocalSearch", 1, [query, numResultsRequested, supportedFileExtensions, documentUrlToExclude], 4 | 1, 0);
        };
        Tap.prototype.readSearchCache = function (keyword, expiredHours, filterObjectType) {
            return _invokeMethod(this, "ReadSearchCache", 1, [keyword, expiredHours, filterObjectType], 4 | 1, 0);
        };
        Tap.prototype.writeSearchCache = function (fileContent, keyword, filterObjectType) {
            return _invokeMethod(this, "WriteSearchCache", 1, [fileContent, keyword, filterObjectType], 4 | 1, 0);
        };
        Tap.prototype.toJSON = function () {
            return {};
        };
        return Tap;
    }(OfficeExtension.ClientObjectBase));
    OfficeCoreOp.Tap = Tap;
    OfficeCoreOp.tap = _createTopLevelServiceObject(Tap, _localDocumentContext, "Microsoft.TapRichApi.Tap", false, 4);
    var ObjectType;
    (function (ObjectType) {
        ObjectType["unknown"] = "Unknown";
        ObjectType["chart"] = "Chart";
        ObjectType["smartArt"] = "SmartArt";
        ObjectType["table"] = "Table";
        ObjectType["image"] = "Image";
        ObjectType["slide"] = "Slide";
        ObjectType["ole"] = "OLE";
        ObjectType["text"] = "Text";
    })(ObjectType = OfficeCoreOp.ObjectType || (OfficeCoreOp.ObjectType = {}));
    var ErrorCodes;
    (function (ErrorCodes) {
        ErrorCodes["apiNotAvailable"] = "ApiNotAvailable";
        ErrorCodes["clientError"] = "ClientError";
        ErrorCodes["controlIdNotFound"] = "ControlIdNotFound";
        ErrorCodes["entryIdRequired"] = "EntryIdRequired";
        ErrorCodes["generalException"] = "GeneralException";
        ErrorCodes["hostRestartNeeded"] = "HostRestartNeeded";
        ErrorCodes["instanceNotFound"] = "InstanceNotFound";
        ErrorCodes["interactiveFlowAborted"] = "InteractiveFlowAborted";
        ErrorCodes["invalidArgument"] = "InvalidArgument";
        ErrorCodes["invalidGrant"] = "InvalidGrant";
        ErrorCodes["invalidResourceUrl"] = "InvalidResourceUrl";
        ErrorCodes["noPhoto"] = "NoPhoto";
        ErrorCodes["objectNotFound"] = "ObjectNotFound";
        ErrorCodes["resourceNotSupported"] = "ResourceNotSupported";
        ErrorCodes["serverError"] = "ServerError";
        ErrorCodes["serviceUrlNotFound"] = "ServiceUrlNotFound";
        ErrorCodes["ticketInvalidParams"] = "TicketInvalidParams";
        ErrorCodes["ticketNetworkError"] = "TicketNetworkError";
        ErrorCodes["ticketUnauthorized"] = "TicketUnauthorized";
        ErrorCodes["ticketUninitialized"] = "TicketUninitialized";
        ErrorCodes["ticketUnknownError"] = "TicketUnknownError";
        ErrorCodes["unexpectedError"] = "UnexpectedError";
        ErrorCodes["unsupportedUserIdentity"] = "UnsupportedUserIdentity";
        ErrorCodes["userNotSignedIn"] = "UserNotSignedIn";
    })(ErrorCodes = OfficeCoreOp.ErrorCodes || (OfficeCoreOp.ErrorCodes = {}));
})(OfficeCoreOp || (OfficeCoreOp = {}));
