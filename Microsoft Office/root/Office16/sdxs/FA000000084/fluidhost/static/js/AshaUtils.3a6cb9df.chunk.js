"use strict";(self.webpackChunkfluidhost=self.webpackChunkfluidhost||[]).push([[9576],{98023:function(a,e,t){t.r(e),t.d(e,{handleAshaEvent:function(){return z},initializeAshaForFluid:function(){return N},shutdownAshaForFluid:function(){return H},updateAshaAdditionalPartCEventDataFromTelemetryProperties:function(){return F}});var n=t(74165),r=t(15861),i=t(44925),s=t(37762),o={partAMetadata:{},ariaTenantPrefix:"",ariaHeartbeatTenantPrefix:"",isAshaEnabled:!1,isHeartbeatEventEnabled:!1,additionalPartCEventData:{},heartbeatIntervalMs:18e5,pillarIntervalMs:864e5,disabledAshaErrors:[],sendTelemetryEventCallback:function(){}},l=t(93433),d=t(96914),u={dataCategories:2,diagnosticLevel:110},v=[],c=[];function f(){for(var a in c=[],o.additionalPartCEventData)c.push({name:a,dataType:0,value:o.additionalPartCEventData[a].toString()})}function p(a,e){y&&o.isAshaEnabled&&o.sendTelemetryEventCallback({eventName:a,eventContract:{name:"AshaPartAMetadata",dataFields:v},dataFields:[].concat((0,l.Z)(e),(0,l.Z)(c)),eventFlags:u})}var E=new Set,h=0,b=0;function m(a){y&&o.isAshaEnabled&&(h=Date.now(),p("".concat(o.ariaTenantPrefix,".Asha.Pillars"),[(0,d.dt)("Pillars",a?a.toString():(0,l.Z)(E).join(","))]))}function A(){var a=arguments.length>0&&void 0!==arguments[0]?arguments[0]:o.pillarIntervalMs;b=window.setTimeout((function(){E.size>0&&m(),A()}),a)}var P=0;function T(){y&&o.isAshaEnabled&&o.isHeartbeatEventEnabled&&0!==E.size&&p("".concat(o.ariaHeartbeatTenantPrefix,".Asha.Heartbeat"),[(0,d.dt)("Pillars",(0,l.Z)(E).join(","))])}function I(){o.isHeartbeatEventEnabled&&0===P&&C()}function g(){0!==P&&(window.clearTimeout(P),P=0)}function C(){T(),P=window.setTimeout((function(){C()}),o.heartbeatIntervalMs)}var y=!1;function M(a){var e,t,n,r;return!!(!y&&a&&a.partAMetadata&&a.ariaTenantPrefix&&a.ariaHeartbeatTenantPrefix&&a.sendTelemetryEventCallback)&&(o.partAMetadata=a.partAMetadata,o.ariaTenantPrefix=a.ariaTenantPrefix,o.ariaHeartbeatTenantPrefix=a.ariaHeartbeatTenantPrefix,o.isAshaEnabled=a.isAshaEnabled,o.isHeartbeatEventEnabled=a.isHeartbeatEventEnabled,o.additionalPartCEventData=null!==(e=a.additionalPartCEventData)&&void 0!==e?e:o.additionalPartCEventData,o.heartbeatIntervalMs=null!==(t=a.heartbeatIntervalMs)&&void 0!==t?t:o.heartbeatIntervalMs,o.pillarIntervalMs=null!==(n=a.pillarIntervalMs)&&void 0!==n?n:o.pillarIntervalMs,o.disabledAshaErrors=null!==(r=a.disabledAshaErrors)&&void 0!==r?r:o.disabledAshaErrors,o.sendTelemetryEventCallback=a.sendTelemetryEventCallback,function(){for(var a in v=[],o.partAMetadata)v.push({name:a,dataType:0,value:o.partAMetadata[a].toString()})}(),f(),y=!0,!0)}function w(){y&&o.isAshaEnabled&&(!function(a){a?k():S();o.isAshaEnabled=a}(!1),function(a){a?I():g();o.isHeartbeatEventEnabled=a}(!1),y=!1)}function x(a){o.additionalPartCEventData&&function(a,e){var t=Object.keys(a),n=Object.keys(e);return t.length===n.length&&t.every((function(a){return a in e}))&&t.every((function(t){return a[t]===e[t]}))}(o.additionalPartCEventData,a)||(o.additionalPartCEventData=Object.assign(Object.assign({},o.additionalPartCEventData),a),f(),T(),m())}function k(){y&&o.isAshaEnabled&&(I(),function(){if(0===b)if(0===h)A();else{var a=Date.now()-h;o.pillarIntervalMs&&a>=o.pillarIntervalMs||a<=0?(m(),A()):o.pillarIntervalMs&&A(o.pillarIntervalMs-a)}}())}function S(){g(),0!==b&&(window.clearTimeout(b),b=0)}var D=["errorName","veto","pillar","durationMs","inStaging","isIntentional","isInternal","isSessionEndingError","stack"],N=function(a,e,t){M({ariaHeartbeatTenantPrefix:a,ariaTenantPrefix:a,isAshaEnabled:!0,isHeartbeatEventEnabled:!0,sendTelemetryEventCallback:t,partAMetadata:{},additionalPartCEventData:R(e)})},H=w,F=function(a){x(R(a))},Z=function(a){!function(a){if(y&&o.isAshaEnabled&&a&&!E.has(a)){var e=0===E.size;E.add(a),e?k():T(),m(a)}}(a.props.pillar)},j=function(a){var e;e=a.props.pillar,y&&o.isAshaEnabled&&e&&E.has(e)&&(E.delete(e),m(e),T(),0===E.size&&S())},L=function(a){var e=a.props,t=e.errorName,n=e.veto,r=e.pillar,l=e.durationMs,d=e.inStaging,u=e.isIntentional,v=e.isInternal,c=e.isSessionEndingError,f=e.stack,h=(0,i.Z)(e,D);x(R(h)),function(a){var e;if(y&&o.isAshaEnabled&&a&&a.errorName){if(o.disabledAshaErrors){var t,n=(0,s.Z)(o.disabledAshaErrors);try{for(n.s();!(t=n.n()).done;){var r=t.value;if(r.vetoName){if(r.vetoName.toLowerCase()===a.veto.name.toLowerCase()&&r.errorName.toLowerCase()===a.errorName.toLowerCase())return}else if(r.errorName.toLowerCase()===a.errorName.toLowerCase())return}}catch(d){n.e(d)}finally{n.f()}}var i=[{name:"Pillar",dataType:0,value:a.veto.pillar},{name:"Veto",dataType:0,value:a.veto.name},{name:"InStaging",dataType:1,value:null===(e=a.inStaging)||void 0===e||e}];if(void 0!==a.isIntentional&&i.push({name:"IsIntentional",dataType:1,value:a.isIntentional}),void 0!==a.isInternal&&i.push({name:"IsInternal",dataType:1,value:a.isInternal}),void 0!==a.durationMs&&i.push({name:"DurationMs",dataType:3,value:a.durationMs}),void 0!==a.isSessionEndingError&&i.push({name:"IsSessionEndingError",dataType:1,value:a.isSessionEndingError}),void 0!==a.extendedProperties)for(var l in a.extendedProperties)i.push({name:"ExtendedProperties_".concat(l),dataType:0,value:a.extendedProperties[l].toString()});E.has(a.veto.pillar)?p("".concat(o.ariaTenantPrefix,".Asha.Error.").concat(a.errorName),i):(i.push({name:"Error",dataType:0,value:a.errorName}),i.push({name:"FailureReason",dataType:0,value:"Inactive Pillar"}),p("".concat(o.ariaTenantPrefix,".Asha.ApiError.DroppedErrors"),i)),a.isSessionEndingError&&(m(),w())}}({errorName:t,veto:{name:n,pillar:r},durationMs:l,inStaging:d,isIntentional:u,isInternal:v,isSessionEndingError:c,extendedProperties:{stack:f}})},z=function(){var a=(0,r.Z)((0,n.Z)().mark((function a(e){var t;return(0,n.Z)().wrap((function(a){for(;;)switch(a.prev=a.next){case 0:t=e.props,a.t0=t.eventName,a.next="AshaPillarAdd"===a.t0?4:"AshaPillarRemove"===a.t0?5:"AshaError"===a.t0?6:7;break;case 4:return a.abrupt("return",Z(e));case 5:return a.abrupt("return",j(e));case 6:return a.abrupt("return",L(e));case 7:return a.abrupt("break",8);case 8:case"end":return a.stop()}}),a)})));return function(e){return a.apply(this,arguments)}}(),O=["containerType","hostCorrelationId","hostName","hostScenarioName"],R=function(a){for(var e={},t=0,n=O;t<n.length;t++){var r=n[t],i=a[r];void 0!==i&&"object"!==typeof i&&(e[r]=i)}return e}}}]);
//# sourceMappingURL=AshaUtils.3a6cb9df.chunk.js.map