// The initialize function must be run each time a new page is loaded
(function() {
    try {
        Office.initialize = function(reason) {
            $(document).ready(function() {
                document.getElementById('spinner').style.display = 'block';
                document.getElementById('flow-div').style.display = 'none';

                OfficeFirstPartyAuth.debugging = true;
                OfficeFirstPartyAuth.delay = 5000;
                OfficeFirstPartyAuth.delayMsal = 5000;
                OfficeFirstPartyAuth.authVersion = "flight";

                // Needs to be changed if login.html is updated.
                // The change should be replacing it with the build number pertaining to the build containing the new login.html bits.
                // Only make the change once the login.html change has been deployed to at least fast food.
                const BUILD_NUMBER = '1.0.2301.17006';
                // Reply urls need to match exactly with the urls registered on the first-party registration page.
                // The build url changes with every build, thus the reply url we automatically send would change as well.
                // Urls registered on the first-party registration page are registered manually.
                // This is a workaround so that we do not have to manually register a new url with every new build.
                // Since pages on the CDN live indefinitely, we just send an old page containing an up to date login.html page.
                const WORKAROUND_REPLY_URL = window.location.origin.startsWith("https://localhost") ?
                    'https://localhost:3000/login.html' :
                    `https://fa000000113.resources.office.net/f7024bdc-7caf-4ca8-807d-2908f09640d6/${BUILD_NUMBER}/en-us_web/login.html`;

                // TODO: call graph to get flow list
                OfficeFirstPartyAuth.load(WORKAROUND_REPLY_URL, ["https://service.flow.microsoft.com/"]).then(
                    function() {
                        sdk = new MsFlowSdk({
                            hostName: "https://make.test.powerautomate.com",
                            locale: "en-us",
                            hostId: "excel"
                        });

                        let widgetRenderParams = {
                            container: 'flow-div',
                            flowsSettings: {
                                hideTabs: true,
                                isMini: true,
                                createFromBlankTemplateId: '753df2c60faf485aa104631bab68bbb5',
                                flowsFilter: 'operations/any(operation: operation/excel.fileId eq \'nothing/nothing\') and properties/definitionSummary/triggers/any(t: t/type eq \'request\')',
                                widgetFlowListDisplaySettings: {
                                    hideIcon: true,
                                    hideLastModified: true,
                                    hideType: true,
                                    hideCheckBoxSelection: true,
                                    hideActionMenuOnHover: true,
                                    actionMenuDisplayRunButton: true,
                                    actionMenuOverFlowItems: true,
                                    actionMenuClassName: 'fl-ActionMenu-ExcelWidget',
                                    triggerOperationKey: 'SHARED_EXCELONLINEBUSINESS-ONROWSELECTED',
                                    triggerOperationName: 'OnRowSelected',
                                    triggerOperationGroupName: 'shared_excelonlinebusiness'
                                },
                            },
                            templatesSettings: {
                                metadataSortProperty: 'ExcelTablesPriority',
                                showGoBack: true,
                                templateCategory: 'excelonlinebusinessv2'
                            },
                            enableOnBehalfOfTokens: true
                        };

                        widget = sdk.renderWidget('flows', widgetRenderParams);

                        widget.listen('GET_ACCESS_TOKEN', (_requestParam, widgetDoneCallback) => {
                            var tokenParams = {
                                'resource': 'https://service.flow.microsoft.com/',
                                'authChallenge': '',
                                'policy': ''
                            };

                            var behaviorParam = {
                                'popup': false, // popup,
                                'forceRefresh': false /// forceRefresh
                            };

                            OfficeFirstPartyAuth.getAccessToken(tokenParams, behaviorParam).then((tokenResult) => {
                                widgetDoneCallback(null, { token: tokenResult.accessToken });

                                document.getElementById('spinner').style.display = 'none';
                                document.getElementById('flow-div').style.display = 'block';
                            });
                        });
                    },
                    function() {
                        //TODO enable them just if the host is BlueChicken
                        console.log("idk something broke");
                    }
                );
            });
        }
    } catch (e) {
        console.log("Office.initialize throws exception:" + e);
    }
})();