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
var OfficeExtension;
(function (OfficeExtension) {
    var _Internal;
    (function (_Internal) {
        _Internal.OfficeRequire = function () {
            return null;
        }();
    })(_Internal = OfficeExtension._Internal || (OfficeExtension._Internal = {}));
    (function (_Internal) {
        var PromiseImpl;
        (function (PromiseImpl) {
            function Init() {
                return (function () {
                    "use strict";
                    function lib$es6$promise$utils$$objectOrFunction(x) {
                        return typeof x === 'function' || (typeof x === 'object' && x !== null);
                    }
                    function lib$es6$promise$utils$$isFunction(x) {
                        return typeof x === 'function';
                    }
                    function lib$es6$promise$utils$$isMaybeThenable(x) {
                        return typeof x === 'object' && x !== null;
                    }
                    var lib$es6$promise$utils$$_isArray;
                    if (!Array.isArray) {
                        lib$es6$promise$utils$$_isArray = function (x) {
                            return Object.prototype.toString.call(x) === '[object Array]';
                        };
                    }
                    else {
                        lib$es6$promise$utils$$_isArray = Array.isArray;
                    }
                    var lib$es6$promise$utils$$isArray = lib$es6$promise$utils$$_isArray;
                    var lib$es6$promise$asap$$len = 0;
                    var lib$es6$promise$asap$$toString = {}.toString;
                    var lib$es6$promise$asap$$vertxNext;
                    var lib$es6$promise$asap$$customSchedulerFn;
                    var lib$es6$promise$asap$$asap = function asap(callback, arg) {
                        lib$es6$promise$asap$$queue[lib$es6$promise$asap$$len] = callback;
                        lib$es6$promise$asap$$queue[lib$es6$promise$asap$$len + 1] = arg;
                        lib$es6$promise$asap$$len += 2;
                        if (lib$es6$promise$asap$$len === 2) {
                            if (lib$es6$promise$asap$$customSchedulerFn) {
                                lib$es6$promise$asap$$customSchedulerFn(lib$es6$promise$asap$$flush);
                            }
                            else {
                                lib$es6$promise$asap$$scheduleFlush();
                            }
                        }
                    };
                    function lib$es6$promise$asap$$setScheduler(scheduleFn) {
                        lib$es6$promise$asap$$customSchedulerFn = scheduleFn;
                    }
                    function lib$es6$promise$asap$$setAsap(asapFn) {
                        lib$es6$promise$asap$$asap = asapFn;
                    }
                    var lib$es6$promise$asap$$browserWindow = (typeof window !== 'undefined') ? window : undefined;
                    var lib$es6$promise$asap$$browserGlobal = lib$es6$promise$asap$$browserWindow || {};
                    var lib$es6$promise$asap$$BrowserMutationObserver = lib$es6$promise$asap$$browserGlobal.MutationObserver || lib$es6$promise$asap$$browserGlobal.WebKitMutationObserver;
                    var lib$es6$promise$asap$$isNode = typeof process !== 'undefined' && {}.toString.call(process) === '[object process]';
                    var lib$es6$promise$asap$$isWorker = typeof Uint8ClampedArray !== 'undefined' &&
                        typeof importScripts !== 'undefined' &&
                        typeof MessageChannel !== 'undefined';
                    function lib$es6$promise$asap$$useNextTick() {
                        var nextTick = process.nextTick;
                        var version = process.versions.node.match(/^(?:(\d+)\.)?(?:(\d+)\.)?(\*|\d+)$/);
                        if (Array.isArray(version) && version[1] === '0' && version[2] === '10') {
                            nextTick = window.setImmediate;
                        }
                        return function () {
                            nextTick(lib$es6$promise$asap$$flush);
                        };
                    }
                    function lib$es6$promise$asap$$useVertxTimer() {
                        return function () {
                            lib$es6$promise$asap$$vertxNext(lib$es6$promise$asap$$flush);
                        };
                    }
                    function lib$es6$promise$asap$$useMutationObserver() {
                        var iterations = 0;
                        var observer = new lib$es6$promise$asap$$BrowserMutationObserver(lib$es6$promise$asap$$flush);
                        var node = document.createTextNode('');
                        observer.observe(node, { characterData: true });
                        return function () {
                            node.data = (iterations = ++iterations % 2);
                        };
                    }
                    function lib$es6$promise$asap$$useMessageChannel() {
                        var channel = new MessageChannel();
                        channel.port1.onmessage = lib$es6$promise$asap$$flush;
                        return function () {
                            channel.port2.postMessage(0);
                        };
                    }
                    function lib$es6$promise$asap$$useSetTimeout() {
                        return function () {
                            setTimeout(lib$es6$promise$asap$$flush, 1);
                        };
                    }
                    var lib$es6$promise$asap$$queue = new Array(1000);
                    function lib$es6$promise$asap$$flush() {
                        for (var i = 0; i < lib$es6$promise$asap$$len; i += 2) {
                            var callback = lib$es6$promise$asap$$queue[i];
                            var arg = lib$es6$promise$asap$$queue[i + 1];
                            callback(arg);
                            lib$es6$promise$asap$$queue[i] = undefined;
                            lib$es6$promise$asap$$queue[i + 1] = undefined;
                        }
                        lib$es6$promise$asap$$len = 0;
                    }
                    var lib$es6$promise$asap$$scheduleFlush;
                    if (lib$es6$promise$asap$$isNode) {
                        lib$es6$promise$asap$$scheduleFlush = lib$es6$promise$asap$$useNextTick();
                    }
                    else if (lib$es6$promise$asap$$isWorker) {
                        lib$es6$promise$asap$$scheduleFlush = lib$es6$promise$asap$$useMessageChannel();
                    }
                    else {
                        lib$es6$promise$asap$$scheduleFlush = lib$es6$promise$asap$$useSetTimeout();
                    }
                    function lib$es6$promise$$internal$$noop() { }
                    var lib$es6$promise$$internal$$PENDING = void 0;
                    var lib$es6$promise$$internal$$FULFILLED = 1;
                    var lib$es6$promise$$internal$$REJECTED = 2;
                    var lib$es6$promise$$internal$$GET_THEN_ERROR = new lib$es6$promise$$internal$$ErrorObject();
                    function lib$es6$promise$$internal$$selfFullfillment() {
                        return new TypeError("You cannot resolve a promise with itself");
                    }
                    function lib$es6$promise$$internal$$cannotReturnOwn() {
                        return new TypeError('A promises callback cannot return that same promise.');
                    }
                    function lib$es6$promise$$internal$$getThen(promise) {
                        try {
                            return promise.then;
                        }
                        catch (error) {
                            lib$es6$promise$$internal$$GET_THEN_ERROR.error = error;
                            return lib$es6$promise$$internal$$GET_THEN_ERROR;
                        }
                    }
                    function lib$es6$promise$$internal$$tryThen(then, value, fulfillmentHandler, rejectionHandler) {
                        try {
                            then.call(value, fulfillmentHandler, rejectionHandler);
                        }
                        catch (e) {
                            return e;
                        }
                    }
                    function lib$es6$promise$$internal$$handleForeignThenable(promise, thenable, then) {
                        lib$es6$promise$asap$$asap(function (promise) {
                            var sealed = false;
                            var error = lib$es6$promise$$internal$$tryThen(then, thenable, function (value) {
                                if (sealed) {
                                    return;
                                }
                                sealed = true;
                                if (thenable !== value) {
                                    lib$es6$promise$$internal$$resolve(promise, value);
                                }
                                else {
                                    lib$es6$promise$$internal$$fulfill(promise, value);
                                }
                            }, function (reason) {
                                if (sealed) {
                                    return;
                                }
                                sealed = true;
                                lib$es6$promise$$internal$$reject(promise, reason);
                            }, 'Settle: ' + (promise._label || ' unknown promise'));
                            if (!sealed && error) {
                                sealed = true;
                                lib$es6$promise$$internal$$reject(promise, error);
                            }
                        }, promise);
                    }
                    function lib$es6$promise$$internal$$handleOwnThenable(promise, thenable) {
                        if (thenable._state === lib$es6$promise$$internal$$FULFILLED) {
                            lib$es6$promise$$internal$$fulfill(promise, thenable._result);
                        }
                        else if (thenable._state === lib$es6$promise$$internal$$REJECTED) {
                            lib$es6$promise$$internal$$reject(promise, thenable._result);
                        }
                        else {
                            lib$es6$promise$$internal$$subscribe(thenable, undefined, function (value) {
                                lib$es6$promise$$internal$$resolve(promise, value);
                            }, function (reason) {
                                lib$es6$promise$$internal$$reject(promise, reason);
                            });
                        }
                    }
                    function lib$es6$promise$$internal$$handleMaybeThenable(promise, maybeThenable) {
                        if (maybeThenable.constructor === promise.constructor) {
                            lib$es6$promise$$internal$$handleOwnThenable(promise, maybeThenable);
                        }
                        else {
                            var then = lib$es6$promise$$internal$$getThen(maybeThenable);
                            if (then === lib$es6$promise$$internal$$GET_THEN_ERROR) {
                                lib$es6$promise$$internal$$reject(promise, lib$es6$promise$$internal$$GET_THEN_ERROR.error);
                            }
                            else if (then === undefined) {
                                lib$es6$promise$$internal$$fulfill(promise, maybeThenable);
                            }
                            else if (lib$es6$promise$utils$$isFunction(then)) {
                                lib$es6$promise$$internal$$handleForeignThenable(promise, maybeThenable, then);
                            }
                            else {
                                lib$es6$promise$$internal$$fulfill(promise, maybeThenable);
                            }
                        }
                    }
                    function lib$es6$promise$$internal$$resolve(promise, value) {
                        if (promise === value) {
                            lib$es6$promise$$internal$$reject(promise, lib$es6$promise$$internal$$selfFullfillment());
                        }
                        else if (lib$es6$promise$utils$$objectOrFunction(value)) {
                            lib$es6$promise$$internal$$handleMaybeThenable(promise, value);
                        }
                        else {
                            lib$es6$promise$$internal$$fulfill(promise, value);
                        }
                    }
                    function lib$es6$promise$$internal$$publishRejection(promise) {
                        if (promise._onerror) {
                            promise._onerror(promise._result);
                        }
                        lib$es6$promise$$internal$$publish(promise);
                    }
                    function lib$es6$promise$$internal$$fulfill(promise, value) {
                        if (promise._state !== lib$es6$promise$$internal$$PENDING) {
                            return;
                        }
                        promise._result = value;
                        promise._state = lib$es6$promise$$internal$$FULFILLED;
                        if (promise._subscribers.length !== 0) {
                            lib$es6$promise$asap$$asap(lib$es6$promise$$internal$$publish, promise);
                        }
                    }
                    function lib$es6$promise$$internal$$reject(promise, reason) {
                        if (promise._state !== lib$es6$promise$$internal$$PENDING) {
                            return;
                        }
                        promise._state = lib$es6$promise$$internal$$REJECTED;
                        promise._result = reason;
                        lib$es6$promise$asap$$asap(lib$es6$promise$$internal$$publishRejection, promise);
                    }
                    function lib$es6$promise$$internal$$subscribe(parent, child, onFulfillment, onRejection) {
                        var subscribers = parent._subscribers;
                        var length = subscribers.length;
                        parent._onerror = null;
                        subscribers[length] = child;
                        subscribers[length + lib$es6$promise$$internal$$FULFILLED] = onFulfillment;
                        subscribers[length + lib$es6$promise$$internal$$REJECTED] = onRejection;
                        if (length === 0 && parent._state) {
                            lib$es6$promise$asap$$asap(lib$es6$promise$$internal$$publish, parent);
                        }
                    }
                    function lib$es6$promise$$internal$$publish(promise) {
                        var subscribers = promise._subscribers;
                        var settled = promise._state;
                        if (subscribers.length === 0) {
                            return;
                        }
                        var child, callback, detail = promise._result;
                        for (var i = 0; i < subscribers.length; i += 3) {
                            child = subscribers[i];
                            callback = subscribers[i + settled];
                            if (child) {
                                lib$es6$promise$$internal$$invokeCallback(settled, child, callback, detail);
                            }
                            else {
                                callback(detail);
                            }
                        }
                        promise._subscribers.length = 0;
                    }
                    function lib$es6$promise$$internal$$ErrorObject() {
                        this.error = null;
                    }
                    var lib$es6$promise$$internal$$TRY_CATCH_ERROR = new lib$es6$promise$$internal$$ErrorObject();
                    function lib$es6$promise$$internal$$tryCatch(callback, detail) {
                        try {
                            return callback(detail);
                        }
                        catch (e) {
                            lib$es6$promise$$internal$$TRY_CATCH_ERROR.error = e;
                            return lib$es6$promise$$internal$$TRY_CATCH_ERROR;
                        }
                    }
                    function lib$es6$promise$$internal$$invokeCallback(settled, promise, callback, detail) {
                        var hasCallback = lib$es6$promise$utils$$isFunction(callback), value, error, succeeded, failed;
                        if (hasCallback) {
                            value = lib$es6$promise$$internal$$tryCatch(callback, detail);
                            if (value === lib$es6$promise$$internal$$TRY_CATCH_ERROR) {
                                failed = true;
                                error = value.error;
                                value = null;
                            }
                            else {
                                succeeded = true;
                            }
                            if (promise === value) {
                                lib$es6$promise$$internal$$reject(promise, lib$es6$promise$$internal$$cannotReturnOwn());
                                return;
                            }
                        }
                        else {
                            value = detail;
                            succeeded = true;
                        }
                        if (promise._state !== lib$es6$promise$$internal$$PENDING) {
                        }
                        else if (hasCallback && succeeded) {
                            lib$es6$promise$$internal$$resolve(promise, value);
                        }
                        else if (failed) {
                            lib$es6$promise$$internal$$reject(promise, error);
                        }
                        else if (settled === lib$es6$promise$$internal$$FULFILLED) {
                            lib$es6$promise$$internal$$fulfill(promise, value);
                        }
                        else if (settled === lib$es6$promise$$internal$$REJECTED) {
                            lib$es6$promise$$internal$$reject(promise, value);
                        }
                    }
                    function lib$es6$promise$$internal$$initializePromise(promise, resolver) {
                        try {
                            resolver(function resolvePromise(value) {
                                lib$es6$promise$$internal$$resolve(promise, value);
                            }, function rejectPromise(reason) {
                                lib$es6$promise$$internal$$reject(promise, reason);
                            });
                        }
                        catch (e) {
                            lib$es6$promise$$internal$$reject(promise, e);
                        }
                    }
                    function lib$es6$promise$enumerator$$Enumerator(Constructor, input) {
                        var enumerator = this;
                        enumerator._instanceConstructor = Constructor;
                        enumerator.promise = new Constructor(lib$es6$promise$$internal$$noop);
                        if (enumerator._validateInput(input)) {
                            enumerator._input = input;
                            enumerator.length = input.length;
                            enumerator._remaining = input.length;
                            enumerator._init();
                            if (enumerator.length === 0) {
                                lib$es6$promise$$internal$$fulfill(enumerator.promise, enumerator._result);
                            }
                            else {
                                enumerator.length = enumerator.length || 0;
                                enumerator._enumerate();
                                if (enumerator._remaining === 0) {
                                    lib$es6$promise$$internal$$fulfill(enumerator.promise, enumerator._result);
                                }
                            }
                        }
                        else {
                            lib$es6$promise$$internal$$reject(enumerator.promise, enumerator._validationError());
                        }
                    }
                    lib$es6$promise$enumerator$$Enumerator.prototype._validateInput = function (input) {
                        return lib$es6$promise$utils$$isArray(input);
                    };
                    lib$es6$promise$enumerator$$Enumerator.prototype._validationError = function () {
                        return new _Internal.Error('Array Methods must be provided an Array');
                    };
                    lib$es6$promise$enumerator$$Enumerator.prototype._init = function () {
                        this._result = new Array(this.length);
                    };
                    var lib$es6$promise$enumerator$$default = lib$es6$promise$enumerator$$Enumerator;
                    lib$es6$promise$enumerator$$Enumerator.prototype._enumerate = function () {
                        var enumerator = this;
                        var length = enumerator.length;
                        var promise = enumerator.promise;
                        var input = enumerator._input;
                        for (var i = 0; promise._state === lib$es6$promise$$internal$$PENDING && i < length; i++) {
                            enumerator._eachEntry(input[i], i);
                        }
                    };
                    lib$es6$promise$enumerator$$Enumerator.prototype._eachEntry = function (entry, i) {
                        var enumerator = this;
                        var c = enumerator._instanceConstructor;
                        if (lib$es6$promise$utils$$isMaybeThenable(entry)) {
                            if (entry.constructor === c && entry._state !== lib$es6$promise$$internal$$PENDING) {
                                entry._onerror = null;
                                enumerator._settledAt(entry._state, i, entry._result);
                            }
                            else {
                                enumerator._willSettleAt(c.resolve(entry), i);
                            }
                        }
                        else {
                            enumerator._remaining--;
                            enumerator._result[i] = entry;
                        }
                    };
                    lib$es6$promise$enumerator$$Enumerator.prototype._settledAt = function (state, i, value) {
                        var enumerator = this;
                        var promise = enumerator.promise;
                        if (promise._state === lib$es6$promise$$internal$$PENDING) {
                            enumerator._remaining--;
                            if (state === lib$es6$promise$$internal$$REJECTED) {
                                lib$es6$promise$$internal$$reject(promise, value);
                            }
                            else {
                                enumerator._result[i] = value;
                            }
                        }
                        if (enumerator._remaining === 0) {
                            lib$es6$promise$$internal$$fulfill(promise, enumerator._result);
                        }
                    };
                    lib$es6$promise$enumerator$$Enumerator.prototype._willSettleAt = function (promise, i) {
                        var enumerator = this;
                        lib$es6$promise$$internal$$subscribe(promise, undefined, function (value) {
                            enumerator._settledAt(lib$es6$promise$$internal$$FULFILLED, i, value);
                        }, function (reason) {
                            enumerator._settledAt(lib$es6$promise$$internal$$REJECTED, i, reason);
                        });
                    };
                    function lib$es6$promise$promise$all$$all(entries) {
                        return new lib$es6$promise$enumerator$$default(this, entries).promise;
                    }
                    var lib$es6$promise$promise$all$$default = lib$es6$promise$promise$all$$all;
                    function lib$es6$promise$promise$race$$race(entries) {
                        var Constructor = this;
                        var promise = new Constructor(lib$es6$promise$$internal$$noop);
                        if (!lib$es6$promise$utils$$isArray(entries)) {
                            lib$es6$promise$$internal$$reject(promise, new TypeError('You must pass an array to race.'));
                            return promise;
                        }
                        var length = entries.length;
                        function onFulfillment(value) {
                            lib$es6$promise$$internal$$resolve(promise, value);
                        }
                        function onRejection(reason) {
                            lib$es6$promise$$internal$$reject(promise, reason);
                        }
                        for (var i = 0; promise._state === lib$es6$promise$$internal$$PENDING && i < length; i++) {
                            lib$es6$promise$$internal$$subscribe(Constructor.resolve(entries[i]), undefined, onFulfillment, onRejection);
                        }
                        return promise;
                    }
                    var lib$es6$promise$promise$race$$default = lib$es6$promise$promise$race$$race;
                    function lib$es6$promise$promise$resolve$$resolve(object) {
                        var Constructor = this;
                        if (object && typeof object === 'object' && object.constructor === Constructor) {
                            return object;
                        }
                        var promise = new Constructor(lib$es6$promise$$internal$$noop);
                        lib$es6$promise$$internal$$resolve(promise, object);
                        return promise;
                    }
                    var lib$es6$promise$promise$resolve$$default = lib$es6$promise$promise$resolve$$resolve;
                    function lib$es6$promise$promise$reject$$reject(reason) {
                        var Constructor = this;
                        var promise = new Constructor(lib$es6$promise$$internal$$noop);
                        lib$es6$promise$$internal$$reject(promise, reason);
                        return promise;
                    }
                    var lib$es6$promise$promise$reject$$default = lib$es6$promise$promise$reject$$reject;
                    var lib$es6$promise$promise$$counter = 0;
                    function lib$es6$promise$promise$$needsResolver() {
                        throw new TypeError('You must pass a resolver function as the first argument to the promise constructor');
                    }
                    function lib$es6$promise$promise$$needsNew() {
                        throw new TypeError("Failed to construct 'Promise': Please use the 'new' operator, this object constructor cannot be called as a function.");
                    }
                    var lib$es6$promise$promise$$default = lib$es6$promise$promise$$Promise;
                    function lib$es6$promise$promise$$Promise(resolver) {
                        this._id = lib$es6$promise$promise$$counter++;
                        this._state = undefined;
                        this._result = undefined;
                        this._subscribers = [];
                        if (lib$es6$promise$$internal$$noop !== resolver) {
                            if (!lib$es6$promise$utils$$isFunction(resolver)) {
                                lib$es6$promise$promise$$needsResolver();
                            }
                            if (!(this instanceof lib$es6$promise$promise$$Promise)) {
                                lib$es6$promise$promise$$needsNew();
                            }
                            lib$es6$promise$$internal$$initializePromise(this, resolver);
                        }
                    }
                    lib$es6$promise$promise$$Promise.all = lib$es6$promise$promise$all$$default;
                    lib$es6$promise$promise$$Promise.race = lib$es6$promise$promise$race$$default;
                    lib$es6$promise$promise$$Promise.resolve = lib$es6$promise$promise$resolve$$default;
                    lib$es6$promise$promise$$Promise.reject = lib$es6$promise$promise$reject$$default;
                    lib$es6$promise$promise$$Promise._setScheduler = lib$es6$promise$asap$$setScheduler;
                    lib$es6$promise$promise$$Promise._setAsap = lib$es6$promise$asap$$setAsap;
                    lib$es6$promise$promise$$Promise._asap = lib$es6$promise$asap$$asap;
                    lib$es6$promise$promise$$Promise.prototype = {
                        constructor: lib$es6$promise$promise$$Promise,
                        then: function (onFulfillment, onRejection) {
                            var parent = this;
                            var state = parent._state;
                            if (state === lib$es6$promise$$internal$$FULFILLED && !onFulfillment || state === lib$es6$promise$$internal$$REJECTED && !onRejection) {
                                return this;
                            }
                            var child = new this.constructor(lib$es6$promise$$internal$$noop);
                            var result = parent._result;
                            if (state) {
                                var callback = arguments[state - 1];
                                lib$es6$promise$asap$$asap(function () {
                                    lib$es6$promise$$internal$$invokeCallback(state, child, callback, result);
                                });
                            }
                            else {
                                lib$es6$promise$$internal$$subscribe(parent, child, onFulfillment, onRejection);
                            }
                            return child;
                        },
                        'catch': function (onRejection) {
                            return this.then(null, onRejection);
                        }
                    };
                    return lib$es6$promise$promise$$default;
                }).call(this);
            }
            PromiseImpl.Init = Init;
        })(PromiseImpl = _Internal.PromiseImpl || (_Internal.PromiseImpl = {}));
    })(_Internal = OfficeExtension._Internal || (OfficeExtension._Internal = {}));
    (function (_Internal) {
        function isEdgeLessThan14() {
            var userAgent = window.navigator.userAgent;
            var versionIdx = userAgent.indexOf("Edge/");
            if (versionIdx >= 0) {
                userAgent = userAgent.substring(versionIdx + 5, userAgent.length);
                if (userAgent < "14.14393")
                    return true;
                else
                    return false;
            }
            return false;
        }
        function determinePromise() {
            if (typeof (window) === "undefined" && typeof (Promise) === "function") {
                return Promise;
            }
            if (typeof (window) !== "undefined" && window.Promise) {
                if (isEdgeLessThan14()) {
                    return _Internal.PromiseImpl.Init();
                }
                else {
                    return window.Promise;
                }
            }
            else {
                return _Internal.PromiseImpl.Init();
            }
        }
        _Internal.OfficePromise = determinePromise();
    })(_Internal = OfficeExtension._Internal || (OfficeExtension._Internal = {}));
    var OfficePromise = _Internal.OfficePromise;
    OfficeExtension.Promise = OfficePromise;
})(OfficeExtension || (OfficeExtension = {}));
var OfficeExtension;
(function (OfficeExtension_1) {
    var SessionBase = (function () {
        function SessionBase() {
        }
        SessionBase.prototype._resolveRequestUrlAndHeaderInfo = function () {
            return CoreUtility._createPromiseFromResult(null);
        };
        SessionBase.prototype._createRequestExecutorOrNull = function () {
            return null;
        };
        Object.defineProperty(SessionBase.prototype, "eventRegistration", {
            get: function () {
                return null;
            },
            enumerable: true,
            configurable: true
        });
        return SessionBase;
    }());
    OfficeExtension_1.SessionBase = SessionBase;
    var HttpUtility = (function () {
        function HttpUtility() {
        }
        HttpUtility.setCustomSendRequestFunc = function (func) {
            HttpUtility.s_customSendRequestFunc = func;
        };
        HttpUtility.xhrSendRequestFunc = function (request) {
            return CoreUtility.createPromise(function (resolve, reject) {
                var xhr = new XMLHttpRequest();
                xhr.open(request.method, request.url);
                xhr.onload = function () {
                    var resp = {
                        statusCode: xhr.status,
                        headers: CoreUtility._parseHttpResponseHeaders(xhr.getAllResponseHeaders()),
                        body: xhr.responseText
                    };
                    resolve(resp);
                };
                xhr.onerror = function () {
                    reject(new _Internal.RuntimeError({
                        code: CoreErrorCodes.connectionFailure,
                        message: CoreUtility._getResourceString(CoreResourceStrings.connectionFailureWithStatus, xhr.statusText)
                    }));
                };
                if (request.headers) {
                    for (var key in request.headers) {
                        xhr.setRequestHeader(key, request.headers[key]);
                    }
                }
                xhr.send(CoreUtility._getRequestBodyText(request));
            });
        };
        HttpUtility.sendRequest = function (request) {
            HttpUtility.validateAndNormalizeRequest(request);
            var func = HttpUtility.s_customSendRequestFunc;
            if (!func) {
                func = HttpUtility.xhrSendRequestFunc;
            }
            return func(request);
        };
        HttpUtility.setCustomSendLocalDocumentRequestFunc = function (func) {
            HttpUtility.s_customSendLocalDocumentRequestFunc = func;
        };
        HttpUtility.sendLocalDocumentRequest = function (request) {
            HttpUtility.validateAndNormalizeRequest(request);
            var func;
            func = HttpUtility.s_customSendLocalDocumentRequestFunc || HttpUtility.officeJsSendLocalDocumentRequestFunc;
            return func(request);
        };
        HttpUtility.officeJsSendLocalDocumentRequestFunc = function (request) {
            request = CoreUtility._validateLocalDocumentRequest(request);
            var requestSafeArray = CoreUtility._buildRequestMessageSafeArray(request);
            return CoreUtility.createPromise(function (resolve, reject) {
                OSF.DDA.RichApi.executeRichApiRequestAsync(requestSafeArray, function (asyncResult) {
                    var response;
                    if (asyncResult.status == 'succeeded') {
                        response = {
                            statusCode: RichApiMessageUtility.getResponseStatusCode(asyncResult),
                            headers: RichApiMessageUtility.getResponseHeaders(asyncResult),
                            body: RichApiMessageUtility.getResponseBody(asyncResult)
                        };
                    }
                    else {
                        response = RichApiMessageUtility.buildHttpResponseFromOfficeJsError(asyncResult.error.code, asyncResult.error.message);
                    }
                    CoreUtility.log('Response:');
                    CoreUtility.log(JSON.stringify(response));
                    resolve(response);
                });
            });
        };
        HttpUtility.validateAndNormalizeRequest = function (request) {
            if (CoreUtility.isNullOrUndefined(request)) {
                throw _Internal.RuntimeError._createInvalidArgError({
                    argumentName: 'request'
                });
            }
            if (CoreUtility.isNullOrEmptyString(request.method)) {
                request.method = 'GET';
            }
            request.method = request.method.toUpperCase();
        };
        HttpUtility.logRequest = function (request) {
            if (CoreUtility._logEnabled) {
                CoreUtility.log('---HTTP Request---');
                CoreUtility.log(request.method + ' ' + request.url);
                if (request.headers) {
                    for (var key in request.headers) {
                        CoreUtility.log(key + ': ' + request.headers[key]);
                    }
                }
                if (HttpUtility._logBodyEnabled) {
                    CoreUtility.log(CoreUtility._getRequestBodyText(request));
                }
            }
        };
        HttpUtility.logResponse = function (response) {
            if (CoreUtility._logEnabled) {
                CoreUtility.log('---HTTP Response---');
                CoreUtility.log('' + response.statusCode);
                if (response.headers) {
                    for (var key in response.headers) {
                        CoreUtility.log(key + ': ' + response.headers[key]);
                    }
                }
                if (HttpUtility._logBodyEnabled) {
                    CoreUtility.log(response.body);
                }
            }
        };
        HttpUtility._logBodyEnabled = false;
        return HttpUtility;
    }());
    OfficeExtension_1.HttpUtility = HttpUtility;
    var HostBridge = (function () {
        function HostBridge(m_bridge) {
            var _this = this;
            this.m_bridge = m_bridge;
            this.m_promiseResolver = {};
            this.m_handlers = [];
            this.m_bridge.onMessageFromHost = function (messageText) {
                var message = JSON.parse(messageText);
                if (message.type == 3) {
                    var genericMessageBody = message.message;
                    if (genericMessageBody && genericMessageBody.entries) {
                        for (var i = 0; i < genericMessageBody.entries.length; i++) {
                            var entryObjectOrArray = genericMessageBody.entries[i];
                            if (Array.isArray(entryObjectOrArray)) {
                                var entry = {
                                    messageCategory: entryObjectOrArray[0],
                                    messageType: entryObjectOrArray[1],
                                    targetId: entryObjectOrArray[2],
                                    message: entryObjectOrArray[3],
                                    id: entryObjectOrArray[4]
                                };
                                genericMessageBody.entries[i] = entry;
                            }
                        }
                    }
                }
                _this.dispatchMessage(message);
            };
        }
        HostBridge.init = function (bridge) {
            if (typeof bridge !== 'object' || !bridge) {
                return;
            }
            var instance = new HostBridge(bridge);
            HostBridge.s_instance = instance;
            HttpUtility.setCustomSendLocalDocumentRequestFunc(function (request) {
                request = CoreUtility._validateLocalDocumentRequest(request);
                var requestFlags = 0;
                if (!CoreUtility.isReadonlyRestRequest(request.method)) {
                    requestFlags = 1;
                }
                var index = request.url.indexOf('?');
                if (index >= 0) {
                    var query = request.url.substr(index + 1);
                    var flagsAndCustomData = CoreUtility._parseRequestFlagsAndCustomDataFromQueryStringIfAny(query);
                    if (flagsAndCustomData.flags >= 0) {
                        requestFlags = flagsAndCustomData.flags;
                    }
                }
                var bridgeMessage = {
                    id: HostBridge.nextId(),
                    type: 1,
                    flags: requestFlags,
                    message: request
                };
                return instance.sendMessageToHostAndExpectResponse(bridgeMessage).then(function (bridgeResponse) {
                    var responseInfo = bridgeResponse.message;
                    return responseInfo;
                });
            });
            for (var i = 0; i < HostBridge.s_onInitedHandlers.length; i++) {
                HostBridge.s_onInitedHandlers[i](instance);
            }
        };
        Object.defineProperty(HostBridge, "instance", {
            get: function () {
                return HostBridge.s_instance;
            },
            enumerable: true,
            configurable: true
        });
        HostBridge.prototype.sendMessageToHost = function (message) {
            this.m_bridge.sendMessageToHost(JSON.stringify(message));
        };
        HostBridge.prototype.sendMessageToHostAndExpectResponse = function (message) {
            var _this = this;
            var ret = CoreUtility.createPromise(function (resolve, reject) {
                _this.m_promiseResolver[message.id] = resolve;
            });
            this.m_bridge.sendMessageToHost(JSON.stringify(message));
            return ret;
        };
        HostBridge.prototype.addHostMessageHandler = function (handler) {
            this.m_handlers.push(handler);
        };
        HostBridge.prototype.removeHostMessageHandler = function (handler) {
            var index = this.m_handlers.indexOf(handler);
            if (index >= 0) {
                this.m_handlers.splice(index, 1);
            }
        };
        HostBridge.onInited = function (handler) {
            HostBridge.s_onInitedHandlers.push(handler);
            if (HostBridge.s_instance) {
                handler(HostBridge.s_instance);
            }
        };
        HostBridge.prototype.dispatchMessage = function (message) {
            if (typeof message.id === 'number') {
                var resolve = this.m_promiseResolver[message.id];
                if (resolve) {
                    resolve(message);
                    delete this.m_promiseResolver[message.id];
                    return;
                }
            }
            for (var i = 0; i < this.m_handlers.length; i++) {
                this.m_handlers[i](message);
            }
        };
        HostBridge.nextId = function () {
            return HostBridge.s_nextId++;
        };
        HostBridge.s_onInitedHandlers = [];
        HostBridge.s_nextId = 1;
        return HostBridge;
    }());
    OfficeExtension_1.HostBridge = HostBridge;
    if (typeof _richApiNativeBridge === 'object' && _richApiNativeBridge) {
        HostBridge.init(_richApiNativeBridge);
    }
    var _Internal;
    (function (_Internal) {
        var RuntimeError = (function (_super) {
            __extends(RuntimeError, _super);
            function RuntimeError(error) {
                var _this = _super.call(this, typeof error === 'string' ? error : error.message) || this;
                Object.setPrototypeOf(_this, RuntimeError.prototype);
                _this.name = 'RichApi.Error';
                if (typeof error === 'string') {
                    _this.message = error;
                }
                else {
                    _this.code = error.code;
                    _this.message = error.message;
                    _this.traceMessages = error.traceMessages || [];
                    _this.innerError = error.innerError || null;
                    _this.debugInfo = _this._createDebugInfo(error.debugInfo || {});
                }
                return _this;
            }
            RuntimeError.prototype.toString = function () {
                return this.code + ': ' + this.message;
            };
            RuntimeError.prototype._createDebugInfo = function (partialDebugInfo) {
                var debugInfo = {
                    code: this.code,
                    message: this.message
                };
                debugInfo.toString = function () {
                    return JSON.stringify(this);
                };
                for (var key in partialDebugInfo) {
                    debugInfo[key] = partialDebugInfo[key];
                }
                if (this.innerError) {
                    if (this.innerError instanceof _Internal.RuntimeError) {
                        debugInfo.innerError = this.innerError.debugInfo;
                    }
                    else {
                        debugInfo.innerError = this.innerError;
                    }
                }
                return debugInfo;
            };
            RuntimeError._createInvalidArgError = function (error) {
                return new _Internal.RuntimeError({
                    code: CoreErrorCodes.invalidArgument,
                    message: CoreUtility.isNullOrEmptyString(error.argumentName)
                        ? CoreUtility._getResourceString(CoreResourceStrings.invalidArgumentGeneric)
                        : CoreUtility._getResourceString(CoreResourceStrings.invalidArgument, error.argumentName),
                    debugInfo: error.errorLocation ? { errorLocation: error.errorLocation } : {},
                    innerError: error.innerError
                });
            };
            return RuntimeError;
        }(Error));
        _Internal.RuntimeError = RuntimeError;
    })(_Internal = OfficeExtension_1._Internal || (OfficeExtension_1._Internal = {}));
    OfficeExtension_1.Error = _Internal.RuntimeError;
    var CoreErrorCodes = (function () {
        function CoreErrorCodes() {
        }
        CoreErrorCodes.apiNotFound = 'ApiNotFound';
        CoreErrorCodes.accessDenied = 'AccessDenied';
        CoreErrorCodes.generalException = 'GeneralException';
        CoreErrorCodes.activityLimitReached = 'ActivityLimitReached';
        CoreErrorCodes.invalidArgument = 'InvalidArgument';
        CoreErrorCodes.connectionFailure = 'ConnectionFailure';
        CoreErrorCodes.timeout = 'Timeout';
        CoreErrorCodes.invalidOrTimedOutSession = 'InvalidOrTimedOutSession';
        CoreErrorCodes.invalidObjectPath = 'InvalidObjectPath';
        CoreErrorCodes.invalidRequestContext = 'InvalidRequestContext';
        CoreErrorCodes.valueNotLoaded = 'ValueNotLoaded';
        return CoreErrorCodes;
    }());
    OfficeExtension_1.CoreErrorCodes = CoreErrorCodes;
    var CoreResourceStrings = (function () {
        function CoreResourceStrings() {
        }
        CoreResourceStrings.apiNotFoundDetails = 'ApiNotFoundDetails';
        CoreResourceStrings.connectionFailureWithStatus = 'ConnectionFailureWithStatus';
        CoreResourceStrings.connectionFailureWithDetails = 'ConnectionFailureWithDetails';
        CoreResourceStrings.invalidArgument = 'InvalidArgument';
        CoreResourceStrings.invalidArgumentGeneric = 'InvalidArgumentGeneric';
        CoreResourceStrings.timeout = 'Timeout';
        CoreResourceStrings.invalidOrTimedOutSessionMessage = 'InvalidOrTimedOutSessionMessage';
        CoreResourceStrings.invalidObjectPath = 'InvalidObjectPath';
        CoreResourceStrings.invalidRequestContext = 'InvalidRequestContext';
        CoreResourceStrings.valueNotLoaded = 'ValueNotLoaded';
        return CoreResourceStrings;
    }());
    OfficeExtension_1.CoreResourceStrings = CoreResourceStrings;
    var CoreConstants = (function () {
        function CoreConstants() {
        }
        CoreConstants.flags = 'flags';
        CoreConstants.sourceLibHeader = 'SdkVersion';
        CoreConstants.processQuery = 'ProcessQuery';
        CoreConstants.localDocument = 'http://document.localhost/';
        CoreConstants.localDocumentApiPrefix = 'http://document.localhost/_api/';
        CoreConstants.customData = 'customdata';
        return CoreConstants;
    }());
    OfficeExtension_1.CoreConstants = CoreConstants;
    var RichApiMessageUtility = (function () {
        function RichApiMessageUtility() {
        }
        RichApiMessageUtility.buildMessageArrayForIRequestExecutor = function (customData, requestFlags, requestMessage, sourceLibHeaderValue) {
            var requestMessageText = JSON.stringify(requestMessage.Body);
            CoreUtility.log('Request:');
            CoreUtility.log(requestMessageText);
            var headers = {};
            CoreUtility._copyHeaders(requestMessage.Headers, headers);
            headers[CoreConstants.sourceLibHeader] = sourceLibHeaderValue;
            var messageSafearray = RichApiMessageUtility.buildRequestMessageSafeArray(customData, requestFlags, 'POST', CoreConstants.processQuery, headers, requestMessageText);
            return messageSafearray;
        };
        RichApiMessageUtility.buildResponseOnSuccess = function (responseBody, responseHeaders) {
            var response = { ErrorCode: '', ErrorMessage: '', Headers: null, Body: null };
            response.Body = JSON.parse(responseBody);
            response.Headers = responseHeaders;
            return response;
        };
        RichApiMessageUtility.buildResponseOnError = function (errorCode, message) {
            var response = { ErrorCode: '', ErrorMessage: '', Headers: null, Body: null };
            response.ErrorCode = CoreErrorCodes.generalException;
            response.ErrorMessage = message;
            if (errorCode == RichApiMessageUtility.OfficeJsErrorCode_ooeNoCapability) {
                response.ErrorCode = CoreErrorCodes.accessDenied;
            }
            else if (errorCode == RichApiMessageUtility.OfficeJsErrorCode_ooeActivityLimitReached) {
                response.ErrorCode = CoreErrorCodes.activityLimitReached;
            }
            else if (errorCode == RichApiMessageUtility.OfficeJsErrorCode_ooeInvalidOrTimedOutSession) {
                response.ErrorCode = CoreErrorCodes.invalidOrTimedOutSession;
                response.ErrorMessage = CoreUtility._getResourceString(CoreResourceStrings.invalidOrTimedOutSessionMessage);
            }
            return response;
        };
        RichApiMessageUtility.buildHttpResponseFromOfficeJsError = function (errorCode, message) {
            var statusCode = 500;
            var errorBody = {};
            errorBody['error'] = {};
            errorBody['error']['code'] = CoreErrorCodes.generalException;
            errorBody['error']['message'] = message;
            if (errorCode === RichApiMessageUtility.OfficeJsErrorCode_ooeNoCapability) {
                statusCode = 403;
                errorBody['error']['code'] = CoreErrorCodes.accessDenied;
            }
            else if (errorCode === RichApiMessageUtility.OfficeJsErrorCode_ooeActivityLimitReached) {
                statusCode = 429;
                errorBody['error']['code'] = CoreErrorCodes.activityLimitReached;
            }
            return { statusCode: statusCode, headers: {}, body: JSON.stringify(errorBody) };
        };
        RichApiMessageUtility.buildRequestMessageSafeArray = function (customData, requestFlags, method, path, headers, body) {
            var headerArray = [];
            if (headers) {
                for (var headerName in headers) {
                    headerArray.push(headerName);
                    headerArray.push(headers[headerName]);
                }
            }
            var appPermission = 0;
            var solutionId = '';
            var instanceId = '';
            var marketplaceType = '';
            return [
                customData,
                method,
                path,
                headerArray,
                body,
                appPermission,
                requestFlags,
                solutionId,
                instanceId,
                marketplaceType
            ];
        };
        RichApiMessageUtility.getResponseBody = function (result) {
            return RichApiMessageUtility.getResponseBodyFromSafeArray(result.value.data);
        };
        RichApiMessageUtility.getResponseHeaders = function (result) {
            return RichApiMessageUtility.getResponseHeadersFromSafeArray(result.value.data);
        };
        RichApiMessageUtility.getResponseBodyFromSafeArray = function (data) {
            var ret = data[2];
            if (typeof ret === 'string') {
                return ret;
            }
            var arr = ret;
            return arr.join('');
        };
        RichApiMessageUtility.getResponseHeadersFromSafeArray = function (data) {
            var arrayHeader = data[1];
            if (!arrayHeader) {
                return null;
            }
            var headers = {};
            for (var i = 0; i < arrayHeader.length - 1; i += 2) {
                headers[arrayHeader[i]] = arrayHeader[i + 1];
            }
            return headers;
        };
        RichApiMessageUtility.getResponseStatusCode = function (result) {
            return RichApiMessageUtility.getResponseStatusCodeFromSafeArray(result.value.data);
        };
        RichApiMessageUtility.getResponseStatusCodeFromSafeArray = function (data) {
            return data[0];
        };
        RichApiMessageUtility.OfficeJsErrorCode_ooeInvalidOrTimedOutSession = 5012;
        RichApiMessageUtility.OfficeJsErrorCode_ooeActivityLimitReached = 5102;
        RichApiMessageUtility.OfficeJsErrorCode_ooeNoCapability = 7000;
        return RichApiMessageUtility;
    }());
    OfficeExtension_1.RichApiMessageUtility = RichApiMessageUtility;
    (function (_Internal) {
        function getPromiseType() {
            if (typeof Promise !== 'undefined') {
                return Promise;
            }
            if (typeof Office !== 'undefined') {
                if (Office.Promise) {
                    return Office.Promise;
                }
            }
            if (typeof OfficeExtension !== 'undefined') {
                if (OfficeExtension.Promise) {
                    return OfficeExtension.Promise;
                }
            }
            throw new _Internal.Error('No Promise implementation found');
        }
        _Internal.getPromiseType = getPromiseType;
    })(_Internal = OfficeExtension_1._Internal || (OfficeExtension_1._Internal = {}));
    var CoreUtility = (function () {
        function CoreUtility() {
        }
        CoreUtility.log = function (message) {
            if (CoreUtility._logEnabled && typeof console !== 'undefined' && console.log) {
                console.log(message);
            }
        };
        CoreUtility.checkArgumentNull = function (value, name) {
            if (CoreUtility.isNullOrUndefined(value)) {
                throw _Internal.RuntimeError._createInvalidArgError({ argumentName: name });
            }
        };
        CoreUtility.isNullOrUndefined = function (value) {
            if (value === null) {
                return true;
            }
            if (typeof value === 'undefined') {
                return true;
            }
            return false;
        };
        CoreUtility.isUndefined = function (value) {
            if (typeof value === 'undefined') {
                return true;
            }
            return false;
        };
        CoreUtility.isNullOrEmptyString = function (value) {
            if (value === null) {
                return true;
            }
            if (typeof value === 'undefined') {
                return true;
            }
            if (value.length == 0) {
                return true;
            }
            return false;
        };
        CoreUtility.isPlainJsonObject = function (value) {
            if (CoreUtility.isNullOrUndefined(value)) {
                return false;
            }
            if (typeof value !== 'object') {
                return false;
            }
            if (Object.prototype.toString.apply(value) !== '[object Object]') {
                return false;
            }
            if (value.constructor &&
                !Object.prototype.hasOwnProperty.call(value, 'constructor') &&
                !Object.prototype.hasOwnProperty.call(value.constructor.prototype, 'hasOwnProperty')) {
                return false;
            }
            for (var key in value) {
                if (!Object.prototype.hasOwnProperty.call(value, key)) {
                    return false;
                }
            }
            return true;
        };
        CoreUtility.trim = function (str) {
            return str.replace(new RegExp('^\\s+|\\s+$', 'g'), '');
        };
        CoreUtility.caseInsensitiveCompareString = function (str1, str2) {
            if (CoreUtility.isNullOrUndefined(str1)) {
                return CoreUtility.isNullOrUndefined(str2);
            }
            else {
                if (CoreUtility.isNullOrUndefined(str2)) {
                    return false;
                }
                else {
                    return str1.toUpperCase() == str2.toUpperCase();
                }
            }
        };
        CoreUtility.isReadonlyRestRequest = function (method) {
            return CoreUtility.caseInsensitiveCompareString(method, 'GET');
        };
        CoreUtility._getResourceString = function (resourceId, arg) {
            var ret;
            if (typeof window !== 'undefined' && window.Strings && window.Strings.OfficeOM) {
                var stringName = 'L_' + resourceId;
                var stringValue = window.Strings.OfficeOM[stringName];
                if (stringValue) {
                    ret = stringValue;
                }
            }
            if (!ret) {
                ret = CoreUtility.s_resourceStringValues[resourceId];
            }
            if (!ret) {
                ret = resourceId;
            }
            if (!CoreUtility.isNullOrUndefined(arg)) {
                if (Array.isArray(arg)) {
                    var arrArg = arg;
                    ret = CoreUtility._formatString(ret, arrArg);
                }
                else {
                    ret = ret.replace('{0}', arg);
                }
            }
            return ret;
        };
        CoreUtility._formatString = function (format, arrArg) {
            return format.replace(/\{\d\}/g, function (v) {
                var position = parseInt(v.substr(1, v.length - 2));
                if (position < arrArg.length) {
                    return arrArg[position];
                }
                else {
                    throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'format' });
                }
            });
        };
        Object.defineProperty(CoreUtility, "Promise", {
            get: function () {
                return _Internal.getPromiseType();
            },
            enumerable: true,
            configurable: true
        });
        CoreUtility.createPromise = function (executor) {
            var ret = new CoreUtility.Promise(executor);
            return ret;
        };
        CoreUtility._createPromiseFromResult = function (value) {
            return CoreUtility.createPromise(function (resolve, reject) {
                resolve(value);
            });
        };
        CoreUtility._createPromiseFromException = function (reason) {
            return CoreUtility.createPromise(function (resolve, reject) {
                reject(reason);
            });
        };
        CoreUtility._createTimeoutPromise = function (timeout) {
            return CoreUtility.createPromise(function (resolve, reject) {
                setTimeout(function () {
                    resolve(null);
                }, timeout);
            });
        };
        CoreUtility._createInvalidArgError = function (error) {
            return _Internal.RuntimeError._createInvalidArgError(error);
        };
        CoreUtility._isLocalDocumentUrl = function (url) {
            return CoreUtility._getLocalDocumentUrlPrefixLength(url) > 0;
        };
        CoreUtility._getLocalDocumentUrlPrefixLength = function (url) {
            var localDocumentPrefixes = [
                'http://document.localhost',
                'https://document.localhost',
                '//document.localhost'
            ];
            var urlLower = url.toLowerCase().trim();
            for (var i = 0; i < localDocumentPrefixes.length; i++) {
                if (urlLower === localDocumentPrefixes[i]) {
                    return localDocumentPrefixes[i].length;
                }
                else if (urlLower.substr(0, localDocumentPrefixes[i].length + 1) === localDocumentPrefixes[i] + '/') {
                    return localDocumentPrefixes[i].length + 1;
                }
            }
            return 0;
        };
        CoreUtility._validateLocalDocumentRequest = function (request) {
            var index = CoreUtility._getLocalDocumentUrlPrefixLength(request.url);
            if (index <= 0) {
                throw _Internal.RuntimeError._createInvalidArgError({
                    argumentName: 'request'
                });
            }
            var path = request.url.substr(index);
            var pathLower = path.toLowerCase();
            if (pathLower === '_api') {
                path = '';
            }
            else if (pathLower.substr(0, '_api/'.length) === '_api/') {
                path = path.substr('_api/'.length);
            }
            return {
                method: request.method,
                url: path,
                headers: request.headers,
                body: request.body
            };
        };
        CoreUtility._parseRequestFlagsAndCustomDataFromQueryStringIfAny = function (queryString) {
            var ret = { flags: -1, customData: '' };
            var parts = queryString.split('&');
            for (var i = 0; i < parts.length; i++) {
                var keyvalue = parts[i].split('=');
                if (keyvalue[0].toLowerCase() === CoreConstants.flags) {
                    var flags = parseInt(keyvalue[1]);
                    flags = flags & 4095;
                    ret.flags = flags;
                }
                else if (keyvalue[0].toLowerCase() === CoreConstants.customData) {
                    ret.customData = decodeURIComponent(keyvalue[1]);
                }
            }
            return ret;
        };
        CoreUtility._getRequestBodyText = function (request) {
            var body = '';
            if (typeof request.body === 'string') {
                body = request.body;
            }
            else if (request.body && typeof request.body === 'object') {
                body = JSON.stringify(request.body);
            }
            return body;
        };
        CoreUtility._parseResponseBody = function (response) {
            if (typeof response.body === 'string') {
                var bodyText = CoreUtility.trim(response.body);
                return JSON.parse(bodyText);
            }
            else {
                return response.body;
            }
        };
        CoreUtility._buildRequestMessageSafeArray = function (request) {
            var requestFlags = 0;
            if (!CoreUtility.isReadonlyRestRequest(request.method)) {
                requestFlags = 1;
            }
            var customData = '';
            if (request.url.substr(0, CoreConstants.processQuery.length).toLowerCase() ===
                CoreConstants.processQuery.toLowerCase()) {
                var index = request.url.indexOf('?');
                if (index > 0) {
                    var queryString = request.url.substr(index + 1);
                    var flagsAndCustomData = CoreUtility._parseRequestFlagsAndCustomDataFromQueryStringIfAny(queryString);
                    if (flagsAndCustomData.flags >= 0) {
                        requestFlags = flagsAndCustomData.flags;
                    }
                    customData = flagsAndCustomData.customData;
                }
            }
            return RichApiMessageUtility.buildRequestMessageSafeArray(customData, requestFlags, request.method, request.url, request.headers, CoreUtility._getRequestBodyText(request));
        };
        CoreUtility._parseHttpResponseHeaders = function (allResponseHeaders) {
            var responseHeaders = {};
            if (!CoreUtility.isNullOrEmptyString(allResponseHeaders)) {
                var regex = new RegExp('\r?\n');
                var entries = allResponseHeaders.split(regex);
                for (var i = 0; i < entries.length; i++) {
                    var entry = entries[i];
                    if (entry != null) {
                        var index = entry.indexOf(':');
                        if (index > 0) {
                            var key = entry.substr(0, index);
                            var value = entry.substr(index + 1);
                            key = CoreUtility.trim(key);
                            value = CoreUtility.trim(value);
                            responseHeaders[key.toUpperCase()] = value;
                        }
                    }
                }
            }
            return responseHeaders;
        };
        CoreUtility._parseErrorResponse = function (responseInfo) {
            var errorObj = null;
            if (CoreUtility.isPlainJsonObject(responseInfo.body)) {
                errorObj = responseInfo.body;
            }
            else if (!CoreUtility.isNullOrEmptyString(responseInfo.body)) {
                var errorResponseBody = CoreUtility.trim(responseInfo.body);
                try {
                    errorObj = JSON.parse(errorResponseBody);
                }
                catch (e) {
                    CoreUtility.log('Error when parse ' + errorResponseBody);
                }
            }
            var errorMessage;
            var errorCode;
            if (!CoreUtility.isNullOrUndefined(errorObj) && typeof errorObj === 'object' && errorObj.error) {
                errorCode = errorObj.error.code;
                errorMessage = CoreUtility._getResourceString(CoreResourceStrings.connectionFailureWithDetails, [
                    responseInfo.statusCode.toString(),
                    errorObj.error.code,
                    errorObj.error.message
                ]);
            }
            else {
                errorMessage = CoreUtility._getResourceString(CoreResourceStrings.connectionFailureWithStatus, responseInfo.statusCode.toString());
            }
            if (CoreUtility.isNullOrEmptyString(errorCode)) {
                errorCode = CoreErrorCodes.connectionFailure;
            }
            return { errorCode: errorCode, errorMessage: errorMessage };
        };
        CoreUtility._copyHeaders = function (src, dest) {
            if (src && dest) {
                for (var key in src) {
                    dest[key] = src[key];
                }
            }
        };
        CoreUtility.addResourceStringValues = function (values) {
            for (var key in values) {
                CoreUtility.s_resourceStringValues[key] = values[key];
            }
        };
        CoreUtility._logEnabled = false;
        CoreUtility.s_resourceStringValues = {
            ApiNotFoundDetails: 'The method or property {0} is part of the {1} requirement set, which is not available in your version of {2}.',
            ConnectionFailureWithStatus: 'The request failed with status code of {0}.',
            ConnectionFailureWithDetails: 'The request failed with status code of {0}, error code {1} and the following error message: {2}',
            InvalidArgument: "The argument '{0}' doesn't work for this situation, is missing, or isn't in the right format.",
            InvalidObjectPath: 'The object path \'{0}\' isn\'t working for what you\'re trying to do. If you\'re using the object across multiple "context.sync" calls and outside the sequential execution of a ".run" batch, please use the "context.trackedObjects.add()" and "context.trackedObjects.remove()" methods to manage the object\'s lifetime.',
            InvalidRequestContext: 'Cannot use the object across different request contexts.',
            Timeout: 'The operation has timed out.',
            ValueNotLoaded: 'The value of the result object has not been loaded yet. Before reading the value property, call "context.sync()" on the associated request context.'
        };
        return CoreUtility;
    }());
    OfficeExtension_1.CoreUtility = CoreUtility;
    var TestUtility = (function () {
        function TestUtility() {
        }
        TestUtility.setMock = function (value) {
            TestUtility.s_isMock = value;
        };
        TestUtility.isMock = function () {
            return TestUtility.s_isMock;
        };
        return TestUtility;
    }());
    OfficeExtension_1.TestUtility = TestUtility;
    OfficeExtension_1._internalConfig = {
        showDisposeInfoInDebugInfo: false,
        showInternalApiInDebugInfo: false,
        enableEarlyDispose: true,
        alwaysPolyfillClientObjectUpdateMethod: false,
        alwaysPolyfillClientObjectRetrieveMethod: false,
        enableConcurrentFlag: true,
        enableUndoableFlag: true
    };
    OfficeExtension_1.config = {
        extendedErrorLogging: false
    };
    var CommonActionFactory = (function () {
        function CommonActionFactory() {
        }
        CommonActionFactory.createSetPropertyAction = function (context, parent, propertyName, value, flags) {
            CommonUtility.validateObjectPath(parent);
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 4,
                Name: propertyName,
                ObjectPathId: parent._objectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            };
            var args = [value];
            var referencedArgumentObjectPaths = CommonUtility.setMethodArguments(context, actionInfo.ArgumentInfo, args);
            CommonUtility.validateReferencedObjectPaths(referencedArgumentObjectPaths);
            var action = new Action(actionInfo, 0, flags);
            action.referencedObjectPath = parent._objectPath;
            action.referencedArgumentObjectPaths = referencedArgumentObjectPaths;
            return parent._addAction(action);
        };
        CommonActionFactory.createQueryAction = function (context, parent, queryOption, resultHandler) {
            CommonUtility.validateObjectPath(parent);
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 2,
                Name: '',
                ObjectPathId: parent._objectPath.objectPathInfo.Id,
                QueryInfo: queryOption
            };
            var action = new Action(actionInfo, 1, 4);
            action.referencedObjectPath = parent._objectPath;
            return parent._addAction(action, resultHandler);
        };
        CommonActionFactory.createQueryAsJsonAction = function (context, parent, queryOption, resultHandler) {
            CommonUtility.validateObjectPath(parent);
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 7,
                Name: '',
                ObjectPathId: parent._objectPath.objectPathInfo.Id,
                QueryInfo: queryOption
            };
            var action = new Action(actionInfo, 1, 4);
            action.referencedObjectPath = parent._objectPath;
            return parent._addAction(action, resultHandler);
        };
        CommonActionFactory.createUpdateAction = function (context, parent, objectState) {
            CommonUtility.validateObjectPath(parent);
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 9,
                Name: '',
                ObjectPathId: parent._objectPath.objectPathInfo.Id,
                ObjectState: objectState
            };
            var action = new Action(actionInfo, 0, 0);
            action.referencedObjectPath = parent._objectPath;
            return parent._addAction(action);
        };
        return CommonActionFactory;
    }());
    OfficeExtension_1.CommonActionFactory = CommonActionFactory;
    var ClientObjectBase = (function () {
        function ClientObjectBase(contextBase, objectPath) {
            this.m_contextBase = contextBase;
            this.m_objectPath = objectPath;
        }
        Object.defineProperty(ClientObjectBase.prototype, "_objectPath", {
            get: function () {
                return this.m_objectPath;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientObjectBase.prototype, "_context", {
            get: function () {
                return this.m_contextBase;
            },
            enumerable: true,
            configurable: true
        });
        ClientObjectBase.prototype._addAction = function (action, resultHandler) {
            var _this = this;
            if (resultHandler === void 0) { resultHandler = null; }
            return CoreUtility.createPromise(function (resolve, reject) {
                _this._context._addServiceApiAction(action, resultHandler, resolve, reject);
            });
        };
        ClientObjectBase.prototype._retrieve = function (option, resultHandler) {
            var shouldPolyfill = OfficeExtension_1._internalConfig.alwaysPolyfillClientObjectRetrieveMethod;
            if (!shouldPolyfill) {
                shouldPolyfill = !CommonUtility.isSetSupported('RichApiRuntime', '1.1');
            }
            var queryOption = ClientRequestContextBase._parseQueryOption(option);
            if (shouldPolyfill) {
                return CommonActionFactory.createQueryAction(this._context, this, queryOption, resultHandler);
            }
            return CommonActionFactory.createQueryAsJsonAction(this._context, this, queryOption, resultHandler);
        };
        ClientObjectBase.prototype._recursivelyUpdate = function (properties) {
            var shouldPolyfill = OfficeExtension_1._internalConfig.alwaysPolyfillClientObjectUpdateMethod;
            if (!shouldPolyfill) {
                shouldPolyfill = !CommonUtility.isSetSupported('RichApiRuntime', '1.2');
            }
            try {
                var scalarPropNames = this[CommonConstants.scalarPropertyNames];
                if (!scalarPropNames) {
                    scalarPropNames = [];
                }
                var scalarPropUpdatable = this[CommonConstants.scalarPropertyUpdateable];
                if (!scalarPropUpdatable) {
                    scalarPropUpdatable = [];
                    for (var i = 0; i < scalarPropNames.length; i++) {
                        scalarPropUpdatable.push(false);
                    }
                }
                var navigationPropNames = this[CommonConstants.navigationPropertyNames];
                if (!navigationPropNames) {
                    navigationPropNames = [];
                }
                var scalarProps = {};
                var navigationProps = {};
                var scalarPropCount = 0;
                for (var propName in properties) {
                    var index = scalarPropNames.indexOf(propName);
                    if (index >= 0) {
                        if (!scalarPropUpdatable[index]) {
                            throw new _Internal.RuntimeError({
                                code: CoreErrorCodes.invalidArgument,
                                message: CoreUtility._getResourceString(CommonResourceStrings.attemptingToSetReadOnlyProperty, propName),
                                debugInfo: {
                                    errorLocation: propName
                                }
                            });
                        }
                        scalarProps[propName] = properties[propName];
                        ++scalarPropCount;
                    }
                    else if (navigationPropNames.indexOf(propName) >= 0) {
                        navigationProps[propName] = properties[propName];
                    }
                    else {
                        throw new _Internal.RuntimeError({
                            code: CoreErrorCodes.invalidArgument,
                            message: CoreUtility._getResourceString(CommonResourceStrings.propertyDoesNotExist, propName),
                            debugInfo: {
                                errorLocation: propName
                            }
                        });
                    }
                }
                if (scalarPropCount > 0) {
                    if (shouldPolyfill) {
                        for (var i = 0; i < scalarPropNames.length; i++) {
                            var propName = scalarPropNames[i];
                            var propValue = scalarProps[propName];
                            if (!CommonUtility.isUndefined(propValue)) {
                                CommonActionFactory.createSetPropertyAction(this._context, this, propName, propValue);
                            }
                        }
                    }
                    else {
                        CommonActionFactory.createUpdateAction(this._context, this, scalarProps);
                    }
                }
                for (var propName in navigationProps) {
                    var navigationPropProxy = this[propName];
                    var navigationPropValue = navigationProps[propName];
                    navigationPropProxy._recursivelyUpdate(navigationPropValue);
                }
            }
            catch (innerError) {
                throw new _Internal.RuntimeError({
                    code: CoreErrorCodes.invalidArgument,
                    message: CoreUtility._getResourceString(CoreResourceStrings.invalidArgument, 'properties'),
                    debugInfo: {
                        errorLocation: this._className + '.update'
                    },
                    innerError: innerError
                });
            }
        };
        return ClientObjectBase;
    }());
    OfficeExtension_1.ClientObjectBase = ClientObjectBase;
    var Action = (function () {
        function Action(actionInfo, operationType, flags) {
            this.m_actionInfo = actionInfo;
            this.m_operationType = operationType;
            this.m_flags = flags;
        }
        Object.defineProperty(Action.prototype, "actionInfo", {
            get: function () {
                return this.m_actionInfo;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Action.prototype, "operationType", {
            get: function () {
                return this.m_operationType;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Action.prototype, "flags", {
            get: function () {
                return this.m_flags;
            },
            enumerable: true,
            configurable: true
        });
        return Action;
    }());
    OfficeExtension_1.Action = Action;
    var ObjectPath = (function () {
        function ObjectPath(objectPathInfo, parentObjectPath, isCollection, isInvalidAfterRequest, operationType, flags) {
            this.m_objectPathInfo = objectPathInfo;
            this.m_parentObjectPath = parentObjectPath;
            this.m_isCollection = isCollection;
            this.m_isInvalidAfterRequest = isInvalidAfterRequest;
            this.m_isValid = true;
            this.m_operationType = operationType;
            this.m_flags = flags;
        }
        Object.defineProperty(ObjectPath.prototype, "id", {
            get: function () {
                var argumentInfo = this.m_objectPathInfo.ArgumentInfo;
                if (!argumentInfo) {
                    return undefined;
                }
                var argument = argumentInfo.Arguments;
                if (!argument) {
                    return undefined;
                }
                return argument[0];
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "parent", {
            get: function () {
                var parent = this.m_parentObjectPath;
                if (!parent) {
                    return undefined;
                }
                return parent;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "parentId", {
            get: function () {
                return this.parent ? this.parent.id : undefined;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "objectPathInfo", {
            get: function () {
                return this.m_objectPathInfo;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "operationType", {
            get: function () {
                return this.m_operationType;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "flags", {
            get: function () {
                return this.m_flags;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "isCollection", {
            get: function () {
                return this.m_isCollection;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "isInvalidAfterRequest", {
            get: function () {
                return this.m_isInvalidAfterRequest;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "parentObjectPath", {
            get: function () {
                return this.m_parentObjectPath;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "argumentObjectPaths", {
            get: function () {
                return this.m_argumentObjectPaths;
            },
            set: function (value) {
                this.m_argumentObjectPaths = value;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "isValid", {
            get: function () {
                return this.m_isValid;
            },
            set: function (value) {
                this.m_isValid = value;
                if (!value &&
                    this.m_objectPathInfo.ObjectPathType === 6 &&
                    this.m_savedObjectPathInfo) {
                    ObjectPath.copyObjectPathInfo(this.m_savedObjectPathInfo.pathInfo, this.m_objectPathInfo);
                    this.m_parentObjectPath = this.m_savedObjectPathInfo.parent;
                    this.m_isValid = true;
                    this.m_savedObjectPathInfo = null;
                }
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "originalObjectPathInfo", {
            get: function () {
                return this.m_originalObjectPathInfo;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ObjectPath.prototype, "getByIdMethodName", {
            get: function () {
                return this.m_getByIdMethodName;
            },
            set: function (value) {
                this.m_getByIdMethodName = value;
            },
            enumerable: true,
            configurable: true
        });
        ObjectPath.prototype._updateAsNullObject = function () {
            this.resetForUpdateUsingObjectData();
            this.m_objectPathInfo.ObjectPathType = 7;
            this.m_objectPathInfo.Name = '';
            this.m_parentObjectPath = null;
        };
        ObjectPath.prototype.saveOriginalObjectPathInfo = function () {
            if (OfficeExtension_1.config.extendedErrorLogging && !this.m_originalObjectPathInfo) {
                this.m_originalObjectPathInfo = {};
                ObjectPath.copyObjectPathInfo(this.m_objectPathInfo, this.m_originalObjectPathInfo);
            }
        };
        ObjectPath.prototype.updateUsingObjectData = function (value, clientObject) {
            var referenceId = value[CommonConstants.referenceId];
            if (!CoreUtility.isNullOrEmptyString(referenceId)) {
                if (!this.m_savedObjectPathInfo &&
                    !this.isInvalidAfterRequest &&
                    ObjectPath.isRestorableObjectPath(this.m_objectPathInfo.ObjectPathType)) {
                    var pathInfo = {};
                    ObjectPath.copyObjectPathInfo(this.m_objectPathInfo, pathInfo);
                    this.m_savedObjectPathInfo = {
                        pathInfo: pathInfo,
                        parent: this.m_parentObjectPath
                    };
                }
                this.saveOriginalObjectPathInfo();
                this.resetForUpdateUsingObjectData();
                this.m_objectPathInfo.ObjectPathType = 6;
                this.m_objectPathInfo.Name = referenceId;
                delete this.m_objectPathInfo.ParentObjectPathId;
                this.m_parentObjectPath = null;
                return;
            }
            if (clientObject) {
                var collectionPropertyPath = clientObject[CommonConstants.collectionPropertyPath];
                if (!CoreUtility.isNullOrEmptyString(collectionPropertyPath) && clientObject.context) {
                    var id = CommonUtility.tryGetObjectIdFromLoadOrRetrieveResult(value);
                    if (!CoreUtility.isNullOrUndefined(id)) {
                        var propNames = collectionPropertyPath.split('.');
                        var parent_1 = clientObject.context[propNames[0]];
                        for (var i = 1; i < propNames.length; i++) {
                            parent_1 = parent_1[propNames[i]];
                        }
                        this.saveOriginalObjectPathInfo();
                        this.resetForUpdateUsingObjectData();
                        this.m_parentObjectPath = parent_1._objectPath;
                        this.m_objectPathInfo.ParentObjectPathId = this.m_parentObjectPath.objectPathInfo.Id;
                        this.m_objectPathInfo.ObjectPathType = 5;
                        this.m_objectPathInfo.Name = '';
                        this.m_objectPathInfo.ArgumentInfo.Arguments = [id];
                        return;
                    }
                }
            }
            var parentIsCollection = this.parentObjectPath && this.parentObjectPath.isCollection;
            var getByIdMethodName = this.getByIdMethodName;
            if (parentIsCollection || !CoreUtility.isNullOrEmptyString(getByIdMethodName)) {
                var id = CommonUtility.tryGetObjectIdFromLoadOrRetrieveResult(value);
                if (!CoreUtility.isNullOrUndefined(id)) {
                    this.saveOriginalObjectPathInfo();
                    this.resetForUpdateUsingObjectData();
                    if (!CoreUtility.isNullOrEmptyString(getByIdMethodName)) {
                        this.m_objectPathInfo.ObjectPathType = 3;
                        this.m_objectPathInfo.Name = getByIdMethodName;
                    }
                    else {
                        this.m_objectPathInfo.ObjectPathType = 5;
                        this.m_objectPathInfo.Name = '';
                    }
                    this.m_objectPathInfo.ArgumentInfo.Arguments = [id];
                    return;
                }
            }
        };
        ObjectPath.prototype.resetForUpdateUsingObjectData = function () {
            this.m_isInvalidAfterRequest = false;
            this.m_isValid = true;
            this.m_operationType = 1;
            this.m_flags = 4;
            this.m_objectPathInfo.ArgumentInfo = {};
            this.m_argumentObjectPaths = null;
            this.m_getByIdMethodName = null;
        };
        ObjectPath.isRestorableObjectPath = function (objectPathType) {
            return (objectPathType === 1 ||
                objectPathType === 5 ||
                objectPathType === 3 ||
                objectPathType === 4);
        };
        ObjectPath.copyObjectPathInfo = function (src, dest) {
            dest.Id = src.Id;
            dest.ArgumentInfo = src.ArgumentInfo;
            dest.Name = src.Name;
            dest.ObjectPathType = src.ObjectPathType;
            dest.ParentObjectPathId = src.ParentObjectPathId;
        };
        return ObjectPath;
    }());
    OfficeExtension_1.ObjectPath = ObjectPath;
    var ClientRequestContextBase = (function () {
        function ClientRequestContextBase() {
            this.m_nextId = 0;
        }
        ClientRequestContextBase.prototype._nextId = function () {
            return ++this.m_nextId;
        };
        ClientRequestContextBase.prototype._addServiceApiAction = function (action, resultHandler, resolve, reject) {
            if (!this.m_serviceApiQueue) {
                this.m_serviceApiQueue = new ServiceApiQueue(this);
            }
            this.m_serviceApiQueue.add(action, resultHandler, resolve, reject);
        };
        ClientRequestContextBase._parseQueryOption = function (option) {
            var queryOption = {};
            if (typeof option === 'string') {
                var select = option;
                queryOption.Select = CommonUtility._parseSelectExpand(select);
            }
            else if (Array.isArray(option)) {
                queryOption.Select = option;
            }
            else if (typeof option === 'object') {
                var loadOption = option;
                if (ClientRequestContextBase.isLoadOption(loadOption)) {
                    if (typeof loadOption.select === 'string') {
                        queryOption.Select = CommonUtility._parseSelectExpand(loadOption.select);
                    }
                    else if (Array.isArray(loadOption.select)) {
                        queryOption.Select = loadOption.select;
                    }
                    else if (!CommonUtility.isNullOrUndefined(loadOption.select)) {
                        throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'option.select' });
                    }
                    if (typeof loadOption.expand === 'string') {
                        queryOption.Expand = CommonUtility._parseSelectExpand(loadOption.expand);
                    }
                    else if (Array.isArray(loadOption.expand)) {
                        queryOption.Expand = loadOption.expand;
                    }
                    else if (!CommonUtility.isNullOrUndefined(loadOption.expand)) {
                        throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'option.expand' });
                    }
                    if (typeof loadOption.top === 'number') {
                        queryOption.Top = loadOption.top;
                    }
                    else if (!CommonUtility.isNullOrUndefined(loadOption.top)) {
                        throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'option.top' });
                    }
                    if (typeof loadOption.skip === 'number') {
                        queryOption.Skip = loadOption.skip;
                    }
                    else if (!CommonUtility.isNullOrUndefined(loadOption.skip)) {
                        throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'option.skip' });
                    }
                }
                else {
                    queryOption = ClientRequestContextBase.parseStrictLoadOption(option);
                }
            }
            else if (!CommonUtility.isNullOrUndefined(option)) {
                throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'option' });
            }
            return queryOption;
        };
        ClientRequestContextBase.isLoadOption = function (loadOption) {
            if (!CommonUtility.isUndefined(loadOption.select) &&
                (typeof loadOption.select === 'string' || Array.isArray(loadOption.select)))
                return true;
            if (!CommonUtility.isUndefined(loadOption.expand) &&
                (typeof loadOption.expand === 'string' || Array.isArray(loadOption.expand)))
                return true;
            if (!CommonUtility.isUndefined(loadOption.top) && typeof loadOption.top === 'number')
                return true;
            if (!CommonUtility.isUndefined(loadOption.skip) && typeof loadOption.skip === 'number')
                return true;
            for (var i in loadOption) {
                return false;
            }
            return true;
        };
        ClientRequestContextBase.parseStrictLoadOption = function (option) {
            var ret = { Select: [] };
            ClientRequestContextBase.parseStrictLoadOptionHelper(ret, '', 'option', option);
            return ret;
        };
        ClientRequestContextBase.combineQueryPath = function (pathPrefix, key, separator) {
            if (pathPrefix.length === 0) {
                return key;
            }
            else {
                return pathPrefix + separator + key;
            }
        };
        ClientRequestContextBase.parseStrictLoadOptionHelper = function (queryInfo, pathPrefix, argPrefix, option) {
            for (var key in option) {
                var value = option[key];
                if (key === '$all') {
                    if (typeof value !== 'boolean') {
                        throw _Internal.RuntimeError._createInvalidArgError({
                            argumentName: ClientRequestContextBase.combineQueryPath(argPrefix, key, '.')
                        });
                    }
                    if (value) {
                        queryInfo.Select.push(ClientRequestContextBase.combineQueryPath(pathPrefix, '*', '/'));
                    }
                }
                else if (key === '$top') {
                    if (typeof value !== 'number' || pathPrefix.length > 0) {
                        throw _Internal.RuntimeError._createInvalidArgError({
                            argumentName: ClientRequestContextBase.combineQueryPath(argPrefix, key, '.')
                        });
                    }
                    queryInfo.Top = value;
                }
                else if (key === '$skip') {
                    if (typeof value !== 'number' || pathPrefix.length > 0) {
                        throw _Internal.RuntimeError._createInvalidArgError({
                            argumentName: ClientRequestContextBase.combineQueryPath(argPrefix, key, '.')
                        });
                    }
                    queryInfo.Skip = value;
                }
                else {
                    if (typeof value === 'boolean') {
                        if (value) {
                            queryInfo.Select.push(ClientRequestContextBase.combineQueryPath(pathPrefix, key, '/'));
                        }
                    }
                    else if (typeof value === 'object') {
                        ClientRequestContextBase.parseStrictLoadOptionHelper(queryInfo, ClientRequestContextBase.combineQueryPath(pathPrefix, key, '/'), ClientRequestContextBase.combineQueryPath(argPrefix, key, '.'), value);
                    }
                    else {
                        throw _Internal.RuntimeError._createInvalidArgError({
                            argumentName: ClientRequestContextBase.combineQueryPath(argPrefix, key, '.')
                        });
                    }
                }
            }
        };
        return ClientRequestContextBase;
    }());
    OfficeExtension_1.ClientRequestContextBase = ClientRequestContextBase;
    var InstantiateActionUpdateObjectPathHandler = (function () {
        function InstantiateActionUpdateObjectPathHandler(m_objectPath) {
            this.m_objectPath = m_objectPath;
        }
        InstantiateActionUpdateObjectPathHandler.prototype._handleResult = function (value) {
            if (CoreUtility.isNullOrUndefined(value)) {
                this.m_objectPath._updateAsNullObject();
            }
            else {
                this.m_objectPath.updateUsingObjectData(value, null);
            }
        };
        return InstantiateActionUpdateObjectPathHandler;
    }());
    var ClientRequestBase = (function () {
        function ClientRequestBase(context) {
            this.m_contextBase = context;
            this.m_actions = [];
            this.m_actionResultHandler = {};
            this.m_referencedObjectPaths = {};
            this.m_instantiatedObjectPaths = {};
            this.m_preSyncPromises = [];
        }
        ClientRequestBase.prototype.addAction = function (action) {
            this.m_actions.push(action);
            if (action.actionInfo.ActionType == 1) {
                this.m_instantiatedObjectPaths[action.actionInfo.ObjectPathId] = action;
            }
        };
        Object.defineProperty(ClientRequestBase.prototype, "hasActions", {
            get: function () {
                return this.m_actions.length > 0;
            },
            enumerable: true,
            configurable: true
        });
        ClientRequestBase.prototype._getLastAction = function () {
            return this.m_actions[this.m_actions.length - 1];
        };
        ClientRequestBase.prototype.ensureInstantiateObjectPath = function (objectPath) {
            if (objectPath) {
                if (this.m_instantiatedObjectPaths[objectPath.objectPathInfo.Id]) {
                    return;
                }
                this.ensureInstantiateObjectPath(objectPath.parentObjectPath);
                this.ensureInstantiateObjectPaths(objectPath.argumentObjectPaths);
                if (!this.m_instantiatedObjectPaths[objectPath.objectPathInfo.Id]) {
                    var actionInfo = {
                        Id: this.m_contextBase._nextId(),
                        ActionType: 1,
                        Name: '',
                        ObjectPathId: objectPath.objectPathInfo.Id
                    };
                    var instantiateAction = new Action(actionInfo, 1, 4);
                    instantiateAction.referencedObjectPath = objectPath;
                    this.addReferencedObjectPath(objectPath);
                    this.addAction(instantiateAction);
                    var resultHandler = new InstantiateActionUpdateObjectPathHandler(objectPath);
                    this.addActionResultHandler(instantiateAction, resultHandler);
                }
            }
        };
        ClientRequestBase.prototype.ensureInstantiateObjectPaths = function (objectPaths) {
            if (objectPaths) {
                for (var i = 0; i < objectPaths.length; i++) {
                    this.ensureInstantiateObjectPath(objectPaths[i]);
                }
            }
        };
        ClientRequestBase.prototype.addReferencedObjectPath = function (objectPath) {
            if (!objectPath || this.m_referencedObjectPaths[objectPath.objectPathInfo.Id]) {
                return;
            }
            if (!objectPath.isValid) {
                throw new _Internal.RuntimeError({
                    code: CoreErrorCodes.invalidObjectPath,
                    message: CoreUtility._getResourceString(CoreResourceStrings.invalidObjectPath, CommonUtility.getObjectPathExpression(objectPath)),
                    debugInfo: {
                        errorLocation: CommonUtility.getObjectPathExpression(objectPath)
                    }
                });
            }
            while (objectPath) {
                this.m_referencedObjectPaths[objectPath.objectPathInfo.Id] = objectPath;
                if (objectPath.objectPathInfo.ObjectPathType == 3) {
                    this.addReferencedObjectPaths(objectPath.argumentObjectPaths);
                }
                objectPath = objectPath.parentObjectPath;
            }
        };
        ClientRequestBase.prototype.addReferencedObjectPaths = function (objectPaths) {
            if (objectPaths) {
                for (var i = 0; i < objectPaths.length; i++) {
                    this.addReferencedObjectPath(objectPaths[i]);
                }
            }
        };
        ClientRequestBase.prototype.addActionResultHandler = function (action, resultHandler) {
            this.m_actionResultHandler[action.actionInfo.Id] = resultHandler;
        };
        ClientRequestBase.prototype.aggregrateRequestFlags = function (requestFlags, operationType, flags) {
            if (operationType === 0) {
                requestFlags = requestFlags | 1;
                if ((flags & 2) === 0) {
                    requestFlags = requestFlags & ~16;
                }
                if ((flags & 8) === 0) {
                    requestFlags = requestFlags & ~256;
                }
                requestFlags = requestFlags & ~4;
            }
            if (flags & 1) {
                requestFlags = requestFlags | 2;
            }
            if ((flags & 4) === 0) {
                requestFlags = requestFlags & ~4;
            }
            return requestFlags;
        };
        ClientRequestBase.prototype.finallyNormalizeFlags = function (requestFlags) {
            if ((requestFlags & 1) === 0) {
                requestFlags = requestFlags & ~16;
                requestFlags = requestFlags & ~256;
            }
            if (!OfficeExtension_1._internalConfig.enableConcurrentFlag) {
                requestFlags = requestFlags & ~4;
            }
            if (!OfficeExtension_1._internalConfig.enableUndoableFlag) {
                requestFlags = requestFlags & ~16;
            }
            if (!CommonUtility.isSetSupported('RichApiRuntimeFlag', '1.1')) {
                requestFlags = requestFlags & ~4;
                requestFlags = requestFlags & ~16;
            }
            if (!CommonUtility.isSetSupported('RichApiRuntimeFlag', '1.2')) {
                requestFlags = requestFlags & ~256;
            }
            if (typeof this.m_flagsForTesting === 'number') {
                requestFlags = this.m_flagsForTesting;
            }
            return requestFlags;
        };
        ClientRequestBase.prototype.buildRequestMessageBodyAndRequestFlags = function () {
            if (OfficeExtension_1._internalConfig.enableEarlyDispose) {
                ClientRequestBase._calculateLastUsedObjectPathIds(this.m_actions);
            }
            var requestFlags = 4 |
                16 |
                256;
            var objectPaths = {};
            for (var i in this.m_referencedObjectPaths) {
                requestFlags = this.aggregrateRequestFlags(requestFlags, this.m_referencedObjectPaths[i].operationType, this.m_referencedObjectPaths[i].flags);
                objectPaths[i] = this.m_referencedObjectPaths[i].objectPathInfo;
            }
            var actions = [];
            var hasKeepReference = false;
            for (var index = 0; index < this.m_actions.length; index++) {
                var action = this.m_actions[index];
                if (action.actionInfo.ActionType === 3 &&
                    action.actionInfo.Name === CommonConstants.keepReference) {
                    hasKeepReference = true;
                }
                requestFlags = this.aggregrateRequestFlags(requestFlags, action.operationType, action.flags);
                actions.push(action.actionInfo);
            }
            requestFlags = this.finallyNormalizeFlags(requestFlags);
            var body = {
                AutoKeepReference: this.m_contextBase._autoCleanup && hasKeepReference,
                Actions: actions,
                ObjectPaths: objectPaths
            };
            return {
                body: body,
                flags: requestFlags
            };
        };
        ClientRequestBase.prototype.processResponse = function (actionResults) {
            if (actionResults) {
                for (var i = 0; i < actionResults.length; i++) {
                    var actionResult = actionResults[i];
                    var handler = this.m_actionResultHandler[actionResult.ActionId];
                    if (handler) {
                        handler._handleResult(actionResult.Value);
                    }
                }
            }
        };
        ClientRequestBase.prototype.invalidatePendingInvalidObjectPaths = function () {
            for (var i in this.m_referencedObjectPaths) {
                if (this.m_referencedObjectPaths[i].isInvalidAfterRequest) {
                    this.m_referencedObjectPaths[i].isValid = false;
                }
            }
        };
        ClientRequestBase.prototype._addPreSyncPromise = function (value) {
            this.m_preSyncPromises.push(value);
        };
        Object.defineProperty(ClientRequestBase.prototype, "_preSyncPromises", {
            get: function () {
                return this.m_preSyncPromises;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestBase.prototype, "_actions", {
            get: function () {
                return this.m_actions;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestBase.prototype, "_objectPaths", {
            get: function () {
                return this.m_referencedObjectPaths;
            },
            enumerable: true,
            configurable: true
        });
        ClientRequestBase.prototype._removeKeepReferenceAction = function (objectPathId) {
            for (var i = this.m_actions.length - 1; i >= 0; i--) {
                var actionInfo = this.m_actions[i].actionInfo;
                if (actionInfo.ObjectPathId === objectPathId &&
                    actionInfo.ActionType === 3 &&
                    actionInfo.Name === CommonConstants.keepReference) {
                    this.m_actions.splice(i, 1);
                    break;
                }
            }
        };
        ClientRequestBase._updateLastUsedActionIdOfObjectPathId = function (lastUsedActionIdOfObjectPathId, objectPath, actionId) {
            while (objectPath) {
                if (lastUsedActionIdOfObjectPathId[objectPath.objectPathInfo.Id]) {
                    return;
                }
                lastUsedActionIdOfObjectPathId[objectPath.objectPathInfo.Id] = actionId;
                var argumentObjectPaths = objectPath.argumentObjectPaths;
                if (argumentObjectPaths) {
                    var argumentObjectPathsLength = argumentObjectPaths.length;
                    for (var i = 0; i < argumentObjectPathsLength; i++) {
                        ClientRequestBase._updateLastUsedActionIdOfObjectPathId(lastUsedActionIdOfObjectPathId, argumentObjectPaths[i], actionId);
                    }
                }
                objectPath = objectPath.parentObjectPath;
            }
        };
        ClientRequestBase._calculateLastUsedObjectPathIds = function (actions) {
            var lastUsedActionIdOfObjectPathId = {};
            var actionsLength = actions.length;
            for (var index = actionsLength - 1; index >= 0; --index) {
                var action = actions[index];
                var actionId = action.actionInfo.Id;
                if (action.referencedObjectPath) {
                    ClientRequestBase._updateLastUsedActionIdOfObjectPathId(lastUsedActionIdOfObjectPathId, action.referencedObjectPath, actionId);
                }
                var referencedObjectPaths = action.referencedArgumentObjectPaths;
                if (referencedObjectPaths) {
                    var referencedObjectPathsLength = referencedObjectPaths.length;
                    for (var refIndex = 0; refIndex < referencedObjectPathsLength; refIndex++) {
                        ClientRequestBase._updateLastUsedActionIdOfObjectPathId(lastUsedActionIdOfObjectPathId, referencedObjectPaths[refIndex], actionId);
                    }
                }
            }
            var lastUsedObjectPathIdsOfAction = {};
            for (var key in lastUsedActionIdOfObjectPathId) {
                var actionId = lastUsedActionIdOfObjectPathId[key];
                var objectPathIds = lastUsedObjectPathIdsOfAction[actionId];
                if (!objectPathIds) {
                    objectPathIds = [];
                    lastUsedObjectPathIdsOfAction[actionId] = objectPathIds;
                }
                objectPathIds.push(parseInt(key));
            }
            for (var index = 0; index < actionsLength; index++) {
                var action = actions[index];
                var lastUsedObjectPathIds = lastUsedObjectPathIdsOfAction[action.actionInfo.Id];
                if (lastUsedObjectPathIds && lastUsedObjectPathIds.length > 0) {
                    action.actionInfo.L = lastUsedObjectPathIds;
                }
                else if (action.actionInfo.L) {
                    delete action.actionInfo.L;
                }
            }
        };
        return ClientRequestBase;
    }());
    OfficeExtension_1.ClientRequestBase = ClientRequestBase;
    var ClientResult = (function () {
        function ClientResult(m_type) {
            this.m_type = m_type;
        }
        Object.defineProperty(ClientResult.prototype, "value", {
            get: function () {
                if (!this.m_isLoaded) {
                    throw new _Internal.RuntimeError({
                        code: CoreErrorCodes.valueNotLoaded,
                        message: CoreUtility._getResourceString(CoreResourceStrings.valueNotLoaded),
                        debugInfo: {
                            errorLocation: 'clientResult.value'
                        }
                    });
                }
                return this.m_value;
            },
            enumerable: true,
            configurable: true
        });
        ClientResult.prototype._handleResult = function (value) {
            this.m_isLoaded = true;
            if (typeof value === 'object' && value && value._IsNull) {
                return;
            }
            if (this.m_type === 1) {
                this.m_value = CommonUtility.adjustToDateTime(value);
            }
            else {
                this.m_value = value;
            }
        };
        return ClientResult;
    }());
    OfficeExtension_1.ClientResult = ClientResult;
    var ServiceApiQueue = (function () {
        function ServiceApiQueue(m_context) {
            this.m_context = m_context;
            this.m_actions = [];
        }
        ServiceApiQueue.prototype.add = function (action, resultHandler, resolve, reject) {
            var _this = this;
            this.m_actions.push({ action: action, resultHandler: resultHandler, resolve: resolve, reject: reject });
            if (this.m_actions.length === 1) {
                setTimeout(function () { return _this.processActions(); }, 0);
            }
        };
        ServiceApiQueue.prototype.processActions = function () {
            var _this = this;
            if (this.m_actions.length === 0) {
                return;
            }
            var actions = this.m_actions;
            this.m_actions = [];
            var request = new ClientRequestBase(this.m_context);
            for (var i = 0; i < actions.length; i++) {
                var action = actions[i];
                request.ensureInstantiateObjectPath(action.action.referencedObjectPath);
                request.ensureInstantiateObjectPaths(action.action.referencedArgumentObjectPaths);
                request.addAction(action.action);
                request.addReferencedObjectPath(action.action.referencedObjectPath);
                request.addReferencedObjectPaths(action.action.referencedArgumentObjectPaths);
            }
            var _a = request.buildRequestMessageBodyAndRequestFlags(), body = _a.body, flags = _a.flags;
            var requestMessage = {
                Url: CoreConstants.localDocumentApiPrefix,
                Headers: null,
                Body: body
            };
            CoreUtility.log('Request:');
            CoreUtility.log(JSON.stringify(body));
            var executor = new HttpRequestExecutor();
            executor
                .executeAsync(this.m_context._customData, flags, requestMessage)
                .then(function (response) {
                _this.processResponse(request, actions, response);
            })
                .catch(function (ex) {
                for (var i = 0; i < actions.length; i++) {
                    var action = actions[i];
                    action.reject(ex);
                }
            });
        };
        ServiceApiQueue.prototype.processResponse = function (request, actions, response) {
            var error = this.getErrorFromResponse(response);
            var actionResults = null;
            if (response.Body.Results) {
                actionResults = response.Body.Results;
            }
            else if (response.Body.ProcessedResults && response.Body.ProcessedResults.Results) {
                actionResults = response.Body.ProcessedResults.Results;
            }
            if (!actionResults) {
                actionResults = [];
            }
            this.processActionResults(request, actions, actionResults, error);
        };
        ServiceApiQueue.prototype.getErrorFromResponse = function (response) {
            if (!CoreUtility.isNullOrEmptyString(response.ErrorCode)) {
                return new _Internal.RuntimeError({
                    code: response.ErrorCode,
                    message: response.ErrorMessage
                });
            }
            if (response.Body && response.Body.Error) {
                return new _Internal.RuntimeError({
                    code: response.Body.Error.Code,
                    message: response.Body.Error.Message
                });
            }
            return null;
        };
        ServiceApiQueue.prototype.processActionResults = function (request, actions, actionResults, err) {
            request.processResponse(actionResults);
            for (var i = 0; i < actions.length; i++) {
                var action = actions[i];
                var actionId = action.action.actionInfo.Id;
                var hasResult = false;
                for (var j = 0; j < actionResults.length; j++) {
                    if (actionId == actionResults[j].ActionId) {
                        var resultValue = actionResults[j].Value;
                        if (action.resultHandler) {
                            action.resultHandler._handleResult(resultValue);
                            resultValue = action.resultHandler.value;
                        }
                        if (action.resolve) {
                            action.resolve(resultValue);
                        }
                        hasResult = true;
                        break;
                    }
                }
                if (!hasResult && action.reject) {
                    if (err) {
                        action.reject(err);
                    }
                    else {
                        action.reject('No response for the action.');
                    }
                }
            }
        };
        return ServiceApiQueue;
    }());
    var HttpRequestExecutor = (function () {
        function HttpRequestExecutor() {
        }
        HttpRequestExecutor.prototype.getRequestUrl = function (baseUrl, requestFlags) {
            if (baseUrl.charAt(baseUrl.length - 1) != '/') {
                baseUrl = baseUrl + '/';
            }
            baseUrl = baseUrl + CoreConstants.processQuery;
            baseUrl = baseUrl + '?' + CoreConstants.flags + '=' + requestFlags.toString();
            return baseUrl;
        };
        HttpRequestExecutor.prototype.executeAsync = function (customData, requestFlags, requestMessage) {
            var url = this.getRequestUrl(requestMessage.Url, requestFlags);
            var requestInfo = {
                method: 'POST',
                url: url,
                headers: {},
                body: requestMessage.Body
            };
            requestInfo.headers[CoreConstants.sourceLibHeader] = HttpRequestExecutor.SourceLibHeaderValue;
            requestInfo.headers['CONTENT-TYPE'] = 'application/json';
            if (requestMessage.Headers) {
                for (var key in requestMessage.Headers) {
                    requestInfo.headers[key] = requestMessage.Headers[key];
                }
            }
            var sendRequestFunc = CoreUtility._isLocalDocumentUrl(requestInfo.url)
                ? HttpUtility.sendLocalDocumentRequest
                : HttpUtility.sendRequest;
            return sendRequestFunc(requestInfo).then(function (responseInfo) {
                var response;
                if (responseInfo.statusCode === 200) {
                    response = {
                        ErrorCode: null,
                        ErrorMessage: null,
                        Headers: responseInfo.headers,
                        Body: CoreUtility._parseResponseBody(responseInfo)
                    };
                }
                else {
                    CoreUtility.log('Error Response:' + responseInfo.body);
                    var error = CoreUtility._parseErrorResponse(responseInfo);
                    response = {
                        ErrorCode: error.errorCode,
                        ErrorMessage: error.errorMessage,
                        Headers: responseInfo.headers,
                        Body: null
                    };
                }
                return response;
            });
        };
        HttpRequestExecutor.SourceLibHeaderValue = 'officejs-rest';
        return HttpRequestExecutor;
    }());
    OfficeExtension_1.HttpRequestExecutor = HttpRequestExecutor;
    var CommonConstants = (function (_super) {
        __extends(CommonConstants, _super);
        function CommonConstants() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        CommonConstants.collectionPropertyPath = '_collectionPropertyPath';
        CommonConstants.id = 'Id';
        CommonConstants.idLowerCase = 'id';
        CommonConstants.idPrivate = '_Id';
        CommonConstants.keepReference = '_KeepReference';
        CommonConstants.objectPathIdPrivate = '_ObjectPathId';
        CommonConstants.referenceId = '_ReferenceId';
        CommonConstants.items = '_Items';
        CommonConstants.itemsLowerCase = 'items';
        CommonConstants.scalarPropertyNames = '_scalarPropertyNames';
        CommonConstants.scalarPropertyOriginalNames = '_scalarPropertyOriginalNames';
        CommonConstants.navigationPropertyNames = '_navigationPropertyNames';
        CommonConstants.scalarPropertyUpdateable = '_scalarPropertyUpdateable';
        return CommonConstants;
    }(CoreConstants));
    OfficeExtension_1.CommonConstants = CommonConstants;
    var CommonUtility = (function (_super) {
        __extends(CommonUtility, _super);
        function CommonUtility() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        CommonUtility.validateObjectPath = function (clientObject) {
            var objectPath = clientObject._objectPath;
            while (objectPath) {
                if (!objectPath.isValid) {
                    throw new _Internal.RuntimeError({
                        code: CoreErrorCodes.invalidObjectPath,
                        message: CoreUtility._getResourceString(CoreResourceStrings.invalidObjectPath, CommonUtility.getObjectPathExpression(objectPath)),
                        debugInfo: {
                            errorLocation: CommonUtility.getObjectPathExpression(objectPath)
                        }
                    });
                }
                objectPath = objectPath.parentObjectPath;
            }
        };
        CommonUtility.validateReferencedObjectPaths = function (objectPaths) {
            if (objectPaths) {
                for (var i = 0; i < objectPaths.length; i++) {
                    var objectPath = objectPaths[i];
                    while (objectPath) {
                        if (!objectPath.isValid) {
                            throw new _Internal.RuntimeError({
                                code: CoreErrorCodes.invalidObjectPath,
                                message: CoreUtility._getResourceString(CoreResourceStrings.invalidObjectPath, CommonUtility.getObjectPathExpression(objectPath))
                            });
                        }
                        objectPath = objectPath.parentObjectPath;
                    }
                }
            }
        };
        CommonUtility._toCamelLowerCase = function (name) {
            if (CoreUtility.isNullOrEmptyString(name)) {
                return name;
            }
            var index = 0;
            while (index < name.length && name.charCodeAt(index) >= 65 && name.charCodeAt(index) <= 90) {
                index++;
            }
            if (index < name.length) {
                return name.substr(0, index).toLowerCase() + name.substr(index);
            }
            else {
                return name.toLowerCase();
            }
        };
        CommonUtility.adjustToDateTime = function (value) {
            if (CoreUtility.isNullOrUndefined(value)) {
                return null;
            }
            if (typeof value === 'string') {
                return new Date(value);
            }
            if (Array.isArray(value)) {
                var arr = value;
                for (var i = 0; i < arr.length; i++) {
                    arr[i] = CommonUtility.adjustToDateTime(arr[i]);
                }
                return arr;
            }
            throw CoreUtility._createInvalidArgError({ argumentName: 'date' });
        };
        CommonUtility.tryGetObjectIdFromLoadOrRetrieveResult = function (value) {
            var id = value[CommonConstants.id];
            if (CoreUtility.isNullOrUndefined(id)) {
                id = value[CommonConstants.idLowerCase];
            }
            if (CoreUtility.isNullOrUndefined(id)) {
                id = value[CommonConstants.idPrivate];
            }
            return id;
        };
        CommonUtility.getObjectPathExpression = function (objectPath) {
            var ret = '';
            while (objectPath) {
                switch (objectPath.objectPathInfo.ObjectPathType) {
                    case 1:
                        ret = ret;
                        break;
                    case 2:
                        ret = 'new()' + (ret.length > 0 ? '.' : '') + ret;
                        break;
                    case 3:
                        ret = CommonUtility.normalizeName(objectPath.objectPathInfo.Name) + '()' + (ret.length > 0 ? '.' : '') + ret;
                        break;
                    case 4:
                        ret = CommonUtility.normalizeName(objectPath.objectPathInfo.Name) + (ret.length > 0 ? '.' : '') + ret;
                        break;
                    case 5:
                        ret = 'getItem()' + (ret.length > 0 ? '.' : '') + ret;
                        break;
                    case 6:
                        ret = '_reference()' + (ret.length > 0 ? '.' : '') + ret;
                        break;
                }
                objectPath = objectPath.parentObjectPath;
            }
            return ret;
        };
        CommonUtility.setMethodArguments = function (context, argumentInfo, args) {
            if (CoreUtility.isNullOrUndefined(args)) {
                return null;
            }
            var referencedObjectPaths = new Array();
            var referencedObjectPathIds = new Array();
            var hasOne = CommonUtility.collectObjectPathInfos(context, args, referencedObjectPaths, referencedObjectPathIds);
            argumentInfo.Arguments = args;
            if (hasOne) {
                argumentInfo.ReferencedObjectPathIds = referencedObjectPathIds;
            }
            return referencedObjectPaths;
        };
        CommonUtility.validateContext = function (context, obj) {
            if (context && obj && obj._context !== context) {
                throw new _Internal.RuntimeError({
                    code: CoreErrorCodes.invalidRequestContext,
                    message: CoreUtility._getResourceString(CoreResourceStrings.invalidRequestContext)
                });
            }
        };
        CommonUtility.isSetSupported = function (apiSetName, apiSetVersion) {
            if (typeof window !== 'undefined' &&
                window.Office &&
                window.Office.context &&
                window.Office.context.requirements) {
                return window.Office.context.requirements.isSetSupported(apiSetName, apiSetVersion);
            }
            return true;
        };
        CommonUtility.throwIfApiNotSupported = function (apiFullName, apiSetName, apiSetVersion, hostName) {
            if (!CommonUtility._doApiNotSupportedCheck) {
                return;
            }
            if (!CommonUtility.isSetSupported(apiSetName, apiSetVersion)) {
                var message = CoreUtility._getResourceString(CoreResourceStrings.apiNotFoundDetails, [
                    apiFullName,
                    apiSetName + ' ' + apiSetVersion,
                    hostName
                ]);
                throw new _Internal.RuntimeError({
                    code: CoreErrorCodes.apiNotFound,
                    message: message,
                    debugInfo: { errorLocation: apiFullName }
                });
            }
        };
        CommonUtility._parseSelectExpand = function (select) {
            var args = [];
            if (!CoreUtility.isNullOrEmptyString(select)) {
                var propertyNames = select.split(',');
                for (var i = 0; i < propertyNames.length; i++) {
                    var propertyName = propertyNames[i];
                    propertyName = sanitizeForAnyItemsSlash(propertyName.trim());
                    if (propertyName.length > 0) {
                        args.push(propertyName);
                    }
                }
            }
            return args;
            function sanitizeForAnyItemsSlash(propertyName) {
                var propertyNameLower = propertyName.toLowerCase();
                if (propertyNameLower === 'items' || propertyNameLower === 'items/') {
                    return '*';
                }
                var itemsSlashLength = 6;
                var isItemsSlashOrItemsDot = propertyNameLower.substr(0, itemsSlashLength) === 'items/' ||
                    propertyNameLower.substr(0, itemsSlashLength) === 'items.';
                if (isItemsSlashOrItemsDot) {
                    propertyName = propertyName.substr(itemsSlashLength);
                }
                return propertyName.replace(new RegExp('[/.]items[/.]', 'gi'), '/');
            }
        };
        CommonUtility.changePropertyNameToCamelLowerCase = function (value) {
            var charCodeUnderscore = 95;
            if (Array.isArray(value)) {
                var ret = [];
                for (var i = 0; i < value.length; i++) {
                    ret.push(this.changePropertyNameToCamelLowerCase(value[i]));
                }
                return ret;
            }
            else if (typeof value === 'object' && value !== null) {
                var ret = {};
                for (var key in value) {
                    var propValue = value[key];
                    if (key === CommonConstants.items) {
                        ret = {};
                        ret[CommonConstants.itemsLowerCase] = this.changePropertyNameToCamelLowerCase(propValue);
                        break;
                    }
                    else {
                        var propName = CommonUtility._toCamelLowerCase(key);
                        ret[propName] = this.changePropertyNameToCamelLowerCase(propValue);
                    }
                }
                return ret;
            }
            else {
                return value;
            }
        };
        CommonUtility.purifyJson = function (value) {
            var charCodeUnderscore = 95;
            if (Array.isArray(value)) {
                var ret = [];
                for (var i = 0; i < value.length; i++) {
                    ret.push(this.purifyJson(value[i]));
                }
                return ret;
            }
            else if (typeof value === 'object' && value !== null) {
                var ret = {};
                for (var key in value) {
                    if (key.charCodeAt(0) !== charCodeUnderscore) {
                        var propValue = value[key];
                        if (typeof propValue === 'object' && propValue !== null && Array.isArray(propValue['items'])) {
                            propValue = propValue['items'];
                        }
                        ret[key] = this.purifyJson(propValue);
                    }
                }
                return ret;
            }
            else {
                return value;
            }
        };
        CommonUtility.collectObjectPathInfos = function (context, args, referencedObjectPaths, referencedObjectPathIds) {
            var hasOne = false;
            for (var i = 0; i < args.length; i++) {
                if (args[i] instanceof ClientObjectBase) {
                    var clientObject = args[i];
                    CommonUtility.validateContext(context, clientObject);
                    args[i] = clientObject._objectPath.objectPathInfo.Id;
                    referencedObjectPathIds.push(clientObject._objectPath.objectPathInfo.Id);
                    referencedObjectPaths.push(clientObject._objectPath);
                    hasOne = true;
                }
                else if (Array.isArray(args[i])) {
                    var childArrayObjectPathIds = new Array();
                    var childArrayHasOne = CommonUtility.collectObjectPathInfos(context, args[i], referencedObjectPaths, childArrayObjectPathIds);
                    if (childArrayHasOne) {
                        referencedObjectPathIds.push(childArrayObjectPathIds);
                        hasOne = true;
                    }
                    else {
                        referencedObjectPathIds.push(0);
                    }
                }
                else if (CoreUtility.isPlainJsonObject(args[i])) {
                    referencedObjectPathIds.push(0);
                    CommonUtility.replaceClientObjectPropertiesWithObjectPathIds(args[i], referencedObjectPaths);
                }
                else {
                    referencedObjectPathIds.push(0);
                }
            }
            return hasOne;
        };
        CommonUtility.replaceClientObjectPropertiesWithObjectPathIds = function (value, referencedObjectPaths) {
            var _a, _b;
            for (var key in value) {
                var propValue = value[key];
                if (propValue instanceof ClientObjectBase) {
                    referencedObjectPaths.push(propValue._objectPath);
                    value[key] = (_a = {}, _a[CommonConstants.objectPathIdPrivate] = propValue._objectPath.objectPathInfo.Id, _a);
                }
                else if (Array.isArray(propValue)) {
                    for (var i = 0; i < propValue.length; i++) {
                        if (propValue[i] instanceof ClientObjectBase) {
                            var elem = propValue[i];
                            referencedObjectPaths.push(elem._objectPath);
                            propValue[i] = (_b = {}, _b[CommonConstants.objectPathIdPrivate] = elem._objectPath.objectPathInfo.Id, _b);
                        }
                        else if (CoreUtility.isPlainJsonObject(propValue[i])) {
                            CommonUtility.replaceClientObjectPropertiesWithObjectPathIds(propValue[i], referencedObjectPaths);
                        }
                    }
                }
                else if (CoreUtility.isPlainJsonObject(propValue)) {
                    CommonUtility.replaceClientObjectPropertiesWithObjectPathIds(propValue, referencedObjectPaths);
                }
                else {
                }
            }
        };
        CommonUtility.normalizeName = function (name) {
            return name.substr(0, 1).toLowerCase() + name.substr(1);
        };
        CommonUtility._doApiNotSupportedCheck = false;
        return CommonUtility;
    }(CoreUtility));
    OfficeExtension_1.CommonUtility = CommonUtility;
    var CommonResourceStrings = (function (_super) {
        __extends(CommonResourceStrings, _super);
        function CommonResourceStrings() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        CommonResourceStrings.propertyDoesNotExist = 'PropertyDoesNotExist';
        CommonResourceStrings.attemptingToSetReadOnlyProperty = 'AttemptingToSetReadOnlyProperty';
        return CommonResourceStrings;
    }(CoreResourceStrings));
    OfficeExtension_1.CommonResourceStrings = CommonResourceStrings;
    var ClientRetrieveResult = (function (_super) {
        __extends(ClientRetrieveResult, _super);
        function ClientRetrieveResult(m_shouldPolyfill) {
            var _this = _super.call(this) || this;
            _this.m_shouldPolyfill = m_shouldPolyfill;
            return _this;
        }
        ClientRetrieveResult.prototype._handleResult = function (value) {
            _super.prototype._handleResult.call(this, value);
            if (this.m_shouldPolyfill) {
                this.m_value = CommonUtility.changePropertyNameToCamelLowerCase(this.m_value);
            }
            this.m_value = this.removeItemNodes(this.m_value);
        };
        ClientRetrieveResult.prototype.removeItemNodes = function (value) {
            if (typeof value === 'object' && value !== null && value[CommonConstants.itemsLowerCase]) {
                value = value[CommonConstants.itemsLowerCase];
            }
            return CommonUtility.purifyJson(value);
        };
        return ClientRetrieveResult;
    }(ClientResult));
    OfficeExtension_1.ClientRetrieveResult = ClientRetrieveResult;
    var TraceActionResultHandler = (function () {
        function TraceActionResultHandler(callback) {
            this.callback = callback;
        }
        TraceActionResultHandler.prototype._handleResult = function (value) {
            if (this.callback) {
                this.callback();
            }
        };
        return TraceActionResultHandler;
    }());
    var ClientResultCallback = (function (_super) {
        __extends(ClientResultCallback, _super);
        function ClientResultCallback(callback) {
            var _this = _super.call(this) || this;
            _this.callback = callback;
            return _this;
        }
        ClientResultCallback.prototype._handleResult = function (value) {
            _super.prototype._handleResult.call(this, value);
            this.callback();
        };
        return ClientResultCallback;
    }(ClientResult));
    OfficeExtension_1.ClientResultCallback = ClientResultCallback;
    var OperationalApiHelper = (function () {
        function OperationalApiHelper() {
        }
        OperationalApiHelper.invokeMethod = function (obj, methodName, operationType, args, flags, resultProcessType) {
            if (operationType === void 0) { operationType = 0; }
            if (args === void 0) { args = []; }
            if (flags === void 0) { flags = 0; }
            if (resultProcessType === void 0) { resultProcessType = 0; }
            return CoreUtility.createPromise(function (resolve, reject) {
                var result = new ClientResult();
                var actionInfo = {
                    Id: obj._context._nextId(),
                    ActionType: 3,
                    Name: methodName,
                    ObjectPathId: obj._objectPath.objectPathInfo.Id,
                    ArgumentInfo: {}
                };
                var referencedArgumentObjectPaths = CommonUtility.setMethodArguments(obj._context, actionInfo.ArgumentInfo, args);
                var action = new Action(actionInfo, operationType, flags);
                action.referencedObjectPath = obj._objectPath;
                action.referencedArgumentObjectPaths = referencedArgumentObjectPaths;
                obj._context._addServiceApiAction(action, result, resolve, reject);
            });
        };
        OperationalApiHelper.invokeMethodWithClientResultCallback = function (callback, obj, methodName) {
            var operationType = 0;
            var args = [];
            var flags = 0;
            return CoreUtility.createPromise(function (resolve, reject) {
                var result = new ClientResultCallback(callback);
                var actionInfo = {
                    Id: obj._context._nextId(),
                    ActionType: 3,
                    Name: methodName,
                    ObjectPathId: obj._objectPath.objectPathInfo.Id,
                    ArgumentInfo: {}
                };
                var referencedArgumentObjectPaths = CommonUtility.setMethodArguments(obj._context, actionInfo.ArgumentInfo, args);
                var action = new Action(actionInfo, operationType, flags);
                action.referencedObjectPath = obj._objectPath;
                action.referencedArgumentObjectPaths = referencedArgumentObjectPaths;
                obj._context._addServiceApiAction(action, result, resolve, reject);
            });
        };
        OperationalApiHelper.invokeRetrieve = function (obj, select) {
            var shouldPolyfill = OfficeExtension_1._internalConfig.alwaysPolyfillClientObjectRetrieveMethod;
            if (!shouldPolyfill) {
                shouldPolyfill = !CommonUtility.isSetSupported('RichApiRuntime', '1.1');
            }
            var option;
            if (typeof select[0] === 'object' && select[0].hasOwnProperty('$all')) {
                if (!select[0]['$all']) {
                    throw OfficeExtension_1.Error._createInvalidArgError({});
                }
                option = select[0];
            }
            else {
                option = OperationalApiHelper._parseSelectOption(select);
            }
            return obj._retrieve(option, new ClientRetrieveResult(shouldPolyfill));
        };
        OperationalApiHelper._parseSelectOption = function (select) {
            if (!select || !select[0]) {
                throw OfficeExtension_1.Error._createInvalidArgError({});
            }
            var parsedSelect = select[0] && typeof select[0] !== 'string' ? select[0] : select;
            return Array.isArray(parsedSelect) ? parsedSelect : OperationalApiHelper.parseRecursiveSelect(parsedSelect);
        };
        OperationalApiHelper.parseRecursiveSelect = function (select) {
            var deconstruct = function (selectObj) {
                return Object.keys(selectObj).reduce(function (scalars, name) {
                    var value = selectObj[name];
                    if (typeof value === 'object') {
                        return scalars.concat(deconstruct(value).map(function (postfix) { return name + "/" + postfix; }));
                    }
                    if (value) {
                        return scalars.concat(name);
                    }
                    return scalars;
                }, []);
            };
            return deconstruct(select);
        };
        OperationalApiHelper.invokeRecursiveUpdate = function (obj, properties) {
            return CoreUtility.createPromise(function (resolve, reject) {
                obj._recursivelyUpdate(properties);
                var actionInfo = {
                    Id: obj._context._nextId(),
                    ActionType: 5,
                    Name: 'Trace',
                    ObjectPathId: 0
                };
                var action = new Action(actionInfo, 1, 4);
                obj._context._addServiceApiAction(action, null, resolve, reject);
            });
        };
        OperationalApiHelper.createRootServiceObject = function (type, context) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 1,
                Name: ''
            };
            var objectPath = new ObjectPath(objectPathInfo, null, false, false, 1, 4);
            return new type(context, objectPath);
        };
        OperationalApiHelper.createTopLevelServiceObject = function (type, context, typeName, isCollection, flags) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 2,
                Name: typeName
            };
            var objectPath = new ObjectPath(objectPathInfo, null, isCollection, false, 1, flags | 4);
            return new type(context, objectPath);
        };
        OperationalApiHelper.createPropertyObject = function (type, parent, propertyName, isCollection, flags) {
            var objectPathInfo = {
                Id: parent._context._nextId(),
                ObjectPathType: 4,
                Name: propertyName,
                ParentObjectPathId: parent._objectPath.objectPathInfo.Id
            };
            var objectPath = new ObjectPath(objectPathInfo, parent._objectPath, isCollection, false, 1, flags | 4);
            return new type(parent._context, objectPath);
        };
        OperationalApiHelper.createIndexerObject = function (type, parent, args) {
            var objectPathInfo = {
                Id: parent._context._nextId(),
                ObjectPathType: 5,
                Name: '',
                ParentObjectPathId: parent._objectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            };
            objectPathInfo.ArgumentInfo.Arguments = args;
            var objectPath = new ObjectPath(objectPathInfo, parent._objectPath, false, false, 1, 4);
            return new type(parent._context, objectPath);
        };
        OperationalApiHelper.createMethodObject = function (type, parent, methodName, operationType, args, isCollection, isInvalidAfterRequest, getByIdMethodName, flags) {
            var id = parent._context._nextId();
            var objectPathInfo = {
                Id: id,
                ObjectPathType: 3,
                Name: methodName,
                ParentObjectPathId: parent._objectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            };
            var argumentObjectPaths = CommonUtility.setMethodArguments(parent._context, objectPathInfo.ArgumentInfo, args);
            var objectPath = new ObjectPath(objectPathInfo, parent._objectPath, isCollection, isInvalidAfterRequest, operationType, flags);
            objectPath.argumentObjectPaths = argumentObjectPaths;
            objectPath.getByIdMethodName = getByIdMethodName;
            var o = new type(parent._context, objectPath);
            return o;
        };
        OperationalApiHelper.createAndInstantiateMethodObject = function (type, parent, methodName, operationType, args, isCollection, isInvalidAfterRequest, getByIdMethodName, flags) {
            return CoreUtility.createPromise(function (resolve, reject) {
                var objectPathInfo = {
                    Id: parent._context._nextId(),
                    ObjectPathType: 3,
                    Name: methodName,
                    ParentObjectPathId: parent._objectPath.objectPathInfo.Id,
                    ArgumentInfo: {}
                };
                var argumentObjectPaths = CommonUtility.setMethodArguments(parent._context, objectPathInfo.ArgumentInfo, args);
                var objectPath = new ObjectPath(objectPathInfo, parent._objectPath, isCollection, isInvalidAfterRequest, operationType, flags);
                objectPath.argumentObjectPaths = argumentObjectPaths;
                objectPath.getByIdMethodName = getByIdMethodName;
                var result = new ClientResult();
                var actionInfo = {
                    Id: parent._context._nextId(),
                    ActionType: 1,
                    Name: '',
                    ObjectPathId: objectPath.objectPathInfo.Id,
                    QueryInfo: {}
                };
                var action = new Action(actionInfo, 1, 4);
                action.referencedObjectPath = objectPath;
                parent._context._addServiceApiAction(action, result, function () { return resolve(new type(parent._context, objectPath)); }, reject);
            });
        };
        OperationalApiHelper.createTraceAction = function (context, callback) {
            return CoreUtility.createPromise(function (resolve, reject) {
                var actionInfo = {
                    Id: context._nextId(),
                    ActionType: 5,
                    Name: 'Trace',
                    ObjectPathId: 0
                };
                var action = new Action(actionInfo, 1, 4);
                var result = new TraceActionResultHandler(callback);
                context._addServiceApiAction(action, result, resolve, reject);
            });
        };
        OperationalApiHelper.localDocumentContext = new ClientRequestContextBase();
        return OperationalApiHelper;
    }());
    OfficeExtension_1.OperationalApiHelper = OperationalApiHelper;
    var GenericEventRegistryOperational = (function () {
        function GenericEventRegistryOperational(eventId, targetId, eventArgumentTransform) {
            this.eventId = eventId;
            this.targetId = targetId;
            this.eventArgumentTransform = eventArgumentTransform;
            this.registeredCallbacks = [];
        }
        GenericEventRegistryOperational.prototype.add = function (callback) {
            if (this.hasZero()) {
                GenericEventRegistration.getGenericEventRegistration().register(this.eventId, this.targetId, this.registerCallback);
            }
            this.registeredCallbacks.push(callback);
        };
        GenericEventRegistryOperational.prototype.remove = function (callback) {
            var index = this.registeredCallbacks.lastIndexOf(callback);
            if (index !== -1) {
                this.registeredCallbacks.splice(index, 1);
            }
        };
        GenericEventRegistryOperational.prototype.removeAll = function () {
            this.registeredCallbacks = [];
            GenericEventRegistration.getGenericEventRegistration().unregister(this.eventId, this.targetId, this.registerCallback);
        };
        GenericEventRegistryOperational.prototype.hasZero = function () {
            return this.registeredCallbacks.length === 0;
        };
        Object.defineProperty(GenericEventRegistryOperational.prototype, "registerCallback", {
            get: function () {
                var i = this;
                if (!this.outsideCallback) {
                    this.outsideCallback = function (argument) {
                        i.call(argument);
                    };
                }
                return this.outsideCallback;
            },
            enumerable: true,
            configurable: true
        });
        GenericEventRegistryOperational.prototype.call = function (rawEventArguments) {
            var _this = this;
            this.eventArgumentTransform(rawEventArguments).then(function (eventArguments) {
                var promises = _this.registeredCallbacks.map(function (callback) { return GenericEventRegistryOperational.callCallback(callback, eventArguments); });
                CoreUtility.Promise.all(promises);
            });
        };
        GenericEventRegistryOperational.callCallback = function (callback, eventArguments) {
            return CoreUtility._createPromiseFromResult(null)
                .then(GenericEventRegistryOperational.wrapCallbackInFunction(callback, eventArguments))
                .catch(function (e) {
                CoreUtility.log('Error when invoke handler: ' + JSON.stringify(e));
            });
        };
        GenericEventRegistryOperational.wrapCallbackInFunction = function (callback, args) {
            return function () { return callback(args); };
        };
        return GenericEventRegistryOperational;
    }());
    OfficeExtension_1.GenericEventRegistryOperational = GenericEventRegistryOperational;
    var GlobalEventRegistryOperational = (function () {
        function GlobalEventRegistryOperational() {
            this.eventToTargetToHandlerMap = {};
        }
        Object.defineProperty(GlobalEventRegistryOperational, "globalEventRegistry", {
            get: function () {
                if (!GlobalEventRegistryOperational.singleton) {
                    GlobalEventRegistryOperational.singleton = new GlobalEventRegistryOperational();
                }
                return GlobalEventRegistryOperational.singleton;
            },
            enumerable: true,
            configurable: true
        });
        GlobalEventRegistryOperational.getGlobalEventRegistry = function (eventId, targetId, eventArgumentTransform) {
            var global = GlobalEventRegistryOperational.globalEventRegistry;
            var mapGlobal = global.eventToTargetToHandlerMap;
            if (!mapGlobal.hasOwnProperty(eventId)) {
                mapGlobal[eventId] = {};
            }
            var mapEvent = mapGlobal[eventId];
            if (!mapEvent.hasOwnProperty(targetId)) {
                mapEvent[targetId] = new GenericEventRegistryOperational(eventId, targetId, eventArgumentTransform);
            }
            var target = mapEvent[targetId];
            return target;
        };
        GlobalEventRegistryOperational.singleton = undefined;
        return GlobalEventRegistryOperational;
    }());
    OfficeExtension_1.GlobalEventRegistryOperational = GlobalEventRegistryOperational;
    var GenericEventHandlerOperational = (function () {
        function GenericEventHandlerOperational(genericEventInfo) {
            this.genericEventInfo = genericEventInfo;
        }
        GenericEventHandlerOperational.prototype.add = function (callback) {
            var _this = this;
            var addCallback = function () {
                var eventId = _this.genericEventInfo.eventType;
                var targetId = _this.genericEventInfo.getTargetIdFunc();
                var event = GlobalEventRegistryOperational.getGlobalEventRegistry(eventId, targetId, _this.genericEventInfo.eventArgsTransformFunc);
                event.add(callback);
            };
            this.register();
            this.createTrace(addCallback);
        };
        GenericEventHandlerOperational.prototype.remove = function (callback) {
            var _this = this;
            var removeCallback = function () {
                var eventId = _this.genericEventInfo.eventType;
                var targetId = _this.genericEventInfo.getTargetIdFunc();
                var event = GlobalEventRegistryOperational.getGlobalEventRegistry(eventId, targetId, _this.genericEventInfo.eventArgsTransformFunc);
                event.remove(callback);
            };
            this.register();
            this.createTrace(removeCallback);
        };
        GenericEventHandlerOperational.prototype.removeAll = function () {
            var _this = this;
            var removeAllCallback = function () {
                var eventId = _this.genericEventInfo.eventType;
                var targetId = _this.genericEventInfo.getTargetIdFunc();
                var event = GlobalEventRegistryOperational.getGlobalEventRegistry(eventId, targetId, _this.genericEventInfo.eventArgsTransformFunc);
                event.removeAll();
            };
            this.unregister();
            this.createTrace(removeAllCallback);
        };
        GenericEventHandlerOperational.prototype.createTrace = function (callback) {
            OperationalApiHelper.createTraceAction(this.genericEventInfo.object._context, callback);
        };
        GenericEventHandlerOperational.prototype.register = function () {
            var operationType = 0;
            var args = [];
            var flags = 0;
            OperationalApiHelper.invokeMethod(this.genericEventInfo.object, this.genericEventInfo.register, operationType, args, flags);
            if (!GenericEventRegistration.getGenericEventRegistration().isReady) {
                GenericEventRegistration.getGenericEventRegistration().ready();
            }
        };
        GenericEventHandlerOperational.prototype.unregister = function () {
            OperationalApiHelper.invokeMethod(this.genericEventInfo.object, this.genericEventInfo.unregister);
        };
        return GenericEventHandlerOperational;
    }());
    OfficeExtension_1.GenericEventHandlerOperational = GenericEventHandlerOperational;
    var EventHelper = (function () {
        function EventHelper() {
        }
        EventHelper.invokeOn = function (eventHandler, callback, options) {
            eventHandler.add(callback);
            return CoreUtility._createPromiseFromResult({});
        };
        EventHelper.invokeOff = function (genericEventHandlersOpObj, eventHandler, eventName, callback) {
            if (!eventName && !callback) {
                var allGenericEventHandlersOp = Object.keys(genericEventHandlersOpObj).map(function (eventName) { return genericEventHandlersOpObj[eventName]; });
                return EventHelper.invokeAllOff(allGenericEventHandlersOp);
            }
            if (!eventName) {
                return CoreUtility._createPromiseFromException(eventName + " must be supplied if handler is supplied.");
            }
            if (callback) {
                eventHandler.remove(callback);
            }
            else {
                eventHandler.removeAll();
            }
            return CoreUtility.createPromise(function (resolve, reject) { return resolve(); });
        };
        EventHelper.invokeAllOff = function (allGenericEventHandlersOperational) {
            allGenericEventHandlersOperational.forEach(function (genericEventHandlerOperational) {
                genericEventHandlerOperational.removeAll();
            });
            return CoreUtility.createPromise(function (resolve, reject) { return resolve(); });
        };
        return EventHelper;
    }());
    OfficeExtension_1.EventHelper = EventHelper;
    var ErrorCodes = (function (_super) {
        __extends(ErrorCodes, _super);
        function ErrorCodes() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        ErrorCodes.propertyNotLoaded = 'PropertyNotLoaded';
        ErrorCodes.runMustReturnPromise = 'RunMustReturnPromise';
        ErrorCodes.cannotRegisterEvent = 'CannotRegisterEvent';
        ErrorCodes.invalidOrTimedOutSession = 'InvalidOrTimedOutSession';
        ErrorCodes.cannotUpdateReadOnlyProperty = 'CannotUpdateReadOnlyProperty';
        return ErrorCodes;
    }(CoreErrorCodes));
    OfficeExtension_1.ErrorCodes = ErrorCodes;
    var TraceMarkerActionResultHandler = (function () {
        function TraceMarkerActionResultHandler(callback) {
            this.m_callback = callback;
        }
        TraceMarkerActionResultHandler.prototype._handleResult = function (value) {
            if (this.m_callback) {
                this.m_callback();
            }
        };
        return TraceMarkerActionResultHandler;
    }());
    var ActionFactory = (function (_super) {
        __extends(ActionFactory, _super);
        function ActionFactory() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        ActionFactory.createMethodAction = function (context, parent, methodName, operationType, args, flags) {
            Utility.validateObjectPath(parent);
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 3,
                Name: methodName,
                ObjectPathId: parent._objectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            };
            var referencedArgumentObjectPaths = Utility.setMethodArguments(context, actionInfo.ArgumentInfo, args);
            Utility.validateReferencedObjectPaths(referencedArgumentObjectPaths);
            var action = new Action(actionInfo, operationType, Utility._fixupApiFlags(flags));
            action.referencedObjectPath = parent._objectPath;
            action.referencedArgumentObjectPaths = referencedArgumentObjectPaths;
            parent._addAction(action);
            return action;
        };
        ActionFactory.createRecursiveQueryAction = function (context, parent, query) {
            Utility.validateObjectPath(parent);
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 6,
                Name: '',
                ObjectPathId: parent._objectPath.objectPathInfo.Id,
                RecursiveQueryInfo: query
            };
            var action = new Action(actionInfo, 1, 4);
            action.referencedObjectPath = parent._objectPath;
            parent._addAction(action);
            return action;
        };
        ActionFactory.createEnsureUnchangedAction = function (context, parent, objectState) {
            Utility.validateObjectPath(parent);
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 8,
                Name: '',
                ObjectPathId: parent._objectPath.objectPathInfo.Id,
                ObjectState: objectState
            };
            var action = new Action(actionInfo, 1, 4);
            action.referencedObjectPath = parent._objectPath;
            parent._addAction(action);
            return action;
        };
        ActionFactory.createInstantiateAction = function (context, obj) {
            Utility.validateObjectPath(obj);
            context._pendingRequest.ensureInstantiateObjectPath(obj._objectPath.parentObjectPath);
            context._pendingRequest.ensureInstantiateObjectPaths(obj._objectPath.argumentObjectPaths);
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 1,
                Name: '',
                ObjectPathId: obj._objectPath.objectPathInfo.Id
            };
            var action = new Action(actionInfo, 1, 4);
            action.referencedObjectPath = obj._objectPath;
            obj._addAction(action, new InstantiateActionResultHandler(obj), true);
            return action;
        };
        ActionFactory.createTraceAction = function (context, message, addTraceMessage) {
            var actionInfo = {
                Id: context._nextId(),
                ActionType: 5,
                Name: 'Trace',
                ObjectPathId: 0
            };
            var ret = new Action(actionInfo, 1, 4);
            context._pendingRequest.addAction(ret);
            if (addTraceMessage) {
                context._pendingRequest.addTrace(actionInfo.Id, message);
            }
            return ret;
        };
        ActionFactory.createTraceMarkerForCallback = function (context, callback) {
            var action = ActionFactory.createTraceAction(context, null, false);
            context._pendingRequest.addActionResultHandler(action, new TraceMarkerActionResultHandler(callback));
        };
        return ActionFactory;
    }(CommonActionFactory));
    OfficeExtension_1.ActionFactory = ActionFactory;
    var ClientObject = (function (_super) {
        __extends(ClientObject, _super);
        function ClientObject(context, objectPath) {
            var _this = _super.call(this, context, objectPath) || this;
            Utility.checkArgumentNull(context, 'context');
            _this.m_context = context;
            if (_this._objectPath) {
                if (!context._processingResult && context._pendingRequest) {
                    ActionFactory.createInstantiateAction(context, _this);
                    if (context._autoCleanup && _this._KeepReference) {
                        context.trackedObjects._autoAdd(_this);
                    }
                }
            }
            return _this;
        }
        Object.defineProperty(ClientObject.prototype, "context", {
            get: function () {
                return this.m_context;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientObject.prototype, "isNull", {
            get: function () {
                if (typeof (this.m_isNull) === 'undefined' && TestUtility.isMock()) {
                    return false;
                }
                Utility.throwIfNotLoaded('isNull', this._isNull, null, this._isNull);
                return this._isNull;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientObject.prototype, "isNullObject", {
            get: function () {
                if (typeof (this.m_isNull) === 'undefined' && TestUtility.isMock()) {
                    return false;
                }
                Utility.throwIfNotLoaded('isNullObject', this._isNull, null, this._isNull);
                return this._isNull;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientObject.prototype, "_isNull", {
            get: function () {
                return this.m_isNull;
            },
            set: function (value) {
                this.m_isNull = value;
                if (value && this._objectPath) {
                    this._objectPath._updateAsNullObject();
                }
            },
            enumerable: true,
            configurable: true
        });
        ClientObject.prototype._addAction = function (action, resultHandler, isInstantiationEnsured) {
            if (resultHandler === void 0) { resultHandler = null; }
            if (!isInstantiationEnsured) {
                this.context._pendingRequest.ensureInstantiateObjectPath(this._objectPath);
                this.context._pendingRequest.ensureInstantiateObjectPaths(action.referencedArgumentObjectPaths);
            }
            this.context._pendingRequest.addAction(action);
            this.context._pendingRequest.addReferencedObjectPath(this._objectPath);
            this.context._pendingRequest.addReferencedObjectPaths(action.referencedArgumentObjectPaths);
            this.context._pendingRequest.addActionResultHandler(action, resultHandler);
            return CoreUtility._createPromiseFromResult(null);
        };
        ClientObject.prototype._handleResult = function (value) {
            this._isNull = Utility.isNullOrUndefined(value);
            this.context.trackedObjects._autoTrackIfNecessaryWhenHandleObjectResultValue(this, value);
        };
        ClientObject.prototype._handleIdResult = function (value) {
            this._isNull = Utility.isNullOrUndefined(value);
            Utility.fixObjectPathIfNecessary(this, value);
            this.context.trackedObjects._autoTrackIfNecessaryWhenHandleObjectResultValue(this, value);
        };
        ClientObject.prototype._handleRetrieveResult = function (value, result) {
            this._handleIdResult(value);
        };
        ClientObject.prototype._recursivelySet = function (input, options, scalarWriteablePropertyNames, objectPropertyNames, notAllowedToBeSetPropertyNames) {
            var isClientObject = input instanceof ClientObject;
            var originalInput = input;
            if (isClientObject) {
                if (Object.getPrototypeOf(this) === Object.getPrototypeOf(input)) {
                    input = JSON.parse(JSON.stringify(input));
                }
                else {
                    throw _Internal.RuntimeError._createInvalidArgError({
                        argumentName: 'properties',
                        errorLocation: this._className + '.set'
                    });
                }
            }
            try {
                var prop;
                for (var i = 0; i < scalarWriteablePropertyNames.length; i++) {
                    prop = scalarWriteablePropertyNames[i];
                    if (input.hasOwnProperty(prop)) {
                        if (typeof input[prop] !== 'undefined') {
                            this[prop] = input[prop];
                        }
                    }
                }
                for (var i = 0; i < objectPropertyNames.length; i++) {
                    prop = objectPropertyNames[i];
                    if (input.hasOwnProperty(prop)) {
                        if (typeof input[prop] !== 'undefined') {
                            var dataToPassToSet = isClientObject ? originalInput[prop] : input[prop];
                            this[prop].set(dataToPassToSet, options);
                        }
                    }
                }
                var throwOnReadOnly = !isClientObject;
                if (options && !Utility.isNullOrUndefined(throwOnReadOnly)) {
                    throwOnReadOnly = options.throwOnReadOnly;
                }
                for (var i = 0; i < notAllowedToBeSetPropertyNames.length; i++) {
                    prop = notAllowedToBeSetPropertyNames[i];
                    if (input.hasOwnProperty(prop)) {
                        if (typeof input[prop] !== 'undefined' && throwOnReadOnly) {
                            throw new _Internal.RuntimeError({
                                code: CoreErrorCodes.invalidArgument,
                                message: CoreUtility._getResourceString(ResourceStrings.cannotApplyPropertyThroughSetMethod, prop),
                                debugInfo: {
                                    errorLocation: prop
                                }
                            });
                        }
                    }
                }
                for (prop in input) {
                    if (scalarWriteablePropertyNames.indexOf(prop) < 0 && objectPropertyNames.indexOf(prop) < 0) {
                        var propertyDescriptor = Object.getOwnPropertyDescriptor(Object.getPrototypeOf(this), prop);
                        if (!propertyDescriptor) {
                            throw new _Internal.RuntimeError({
                                code: CoreErrorCodes.invalidArgument,
                                message: CoreUtility._getResourceString(CommonResourceStrings.propertyDoesNotExist, prop),
                                debugInfo: {
                                    errorLocation: prop
                                }
                            });
                        }
                        if (throwOnReadOnly && !propertyDescriptor.set) {
                            throw new _Internal.RuntimeError({
                                code: CoreErrorCodes.invalidArgument,
                                message: CoreUtility._getResourceString(CommonResourceStrings.attemptingToSetReadOnlyProperty, prop),
                                debugInfo: {
                                    errorLocation: prop
                                }
                            });
                        }
                    }
                }
            }
            catch (innerError) {
                throw new _Internal.RuntimeError({
                    code: CoreErrorCodes.invalidArgument,
                    message: CoreUtility._getResourceString(CoreResourceStrings.invalidArgument, 'properties'),
                    debugInfo: {
                        errorLocation: this._className + '.set'
                    },
                    innerError: innerError
                });
            }
        };
        return ClientObject;
    }(ClientObjectBase));
    OfficeExtension_1.ClientObject = ClientObject;
    var HostBridgeRequestExecutor = (function () {
        function HostBridgeRequestExecutor(session) {
            this.m_session = session;
        }
        HostBridgeRequestExecutor.prototype.executeAsync = function (customData, requestFlags, requestMessage) {
            var httpRequestInfo = {
                url: CoreConstants.processQuery,
                method: 'POST',
                headers: requestMessage.Headers,
                body: requestMessage.Body
            };
            var message = {
                id: HostBridge.nextId(),
                type: 1,
                flags: requestFlags,
                message: httpRequestInfo
            };
            CoreUtility.log(JSON.stringify(message));
            return this.m_session.sendMessageToHost(message).then(function (nativeBridgeResponse) {
                CoreUtility.log('Received response: ' + JSON.stringify(nativeBridgeResponse));
                var responseInfo = nativeBridgeResponse.message;
                var response;
                if (responseInfo.statusCode === 200) {
                    response = {
                        ErrorCode: null,
                        ErrorMessage: null,
                        Headers: responseInfo.headers,
                        Body: CoreUtility._parseResponseBody(responseInfo)
                    };
                }
                else {
                    CoreUtility.log('Error Response:' + responseInfo.body);
                    var error = CoreUtility._parseErrorResponse(responseInfo);
                    response = {
                        ErrorCode: error.errorCode,
                        ErrorMessage: error.errorMessage,
                        Headers: responseInfo.headers,
                        Body: null
                    };
                }
                return response;
            });
        };
        return HostBridgeRequestExecutor;
    }());
    var HostBridgeSession = (function (_super) {
        __extends(HostBridgeSession, _super);
        function HostBridgeSession(m_bridge) {
            var _this = _super.call(this) || this;
            _this.m_bridge = m_bridge;
            _this.m_bridge.addHostMessageHandler(function (message) {
                if (message.type === 3) {
                    GenericEventRegistration.getGenericEventRegistration()._handleRichApiMessage(message.message);
                }
            });
            return _this;
        }
        HostBridgeSession.getInstanceIfHostBridgeInited = function () {
            if (HostBridge.instance) {
                if (CoreUtility.isNullOrUndefined(HostBridgeSession.s_instance) ||
                    HostBridgeSession.s_instance.m_bridge !== HostBridge.instance) {
                    HostBridgeSession.s_instance = new HostBridgeSession(HostBridge.instance);
                }
                return HostBridgeSession.s_instance;
            }
            return null;
        };
        HostBridgeSession.prototype._resolveRequestUrlAndHeaderInfo = function () {
            return CoreUtility._createPromiseFromResult(null);
        };
        HostBridgeSession.prototype._createRequestExecutorOrNull = function () {
            CoreUtility.log('NativeBridgeSession::CreateRequestExecutor');
            return new HostBridgeRequestExecutor(this);
        };
        Object.defineProperty(HostBridgeSession.prototype, "eventRegistration", {
            get: function () {
                return GenericEventRegistration.getGenericEventRegistration();
            },
            enumerable: true,
            configurable: true
        });
        HostBridgeSession.prototype.sendMessageToHost = function (message) {
            return this.m_bridge.sendMessageToHostAndExpectResponse(message);
        };
        return HostBridgeSession;
    }(SessionBase));
    OfficeExtension_1.HostBridgeSession = HostBridgeSession;
    var ClientRequestContext = (function (_super) {
        __extends(ClientRequestContext, _super);
        function ClientRequestContext(url) {
            var _this = _super.call(this) || this;
            _this.m_customRequestHeaders = {};
            _this.m_batchMode = 0;
            _this._onRunFinishedNotifiers = [];
            if (SessionBase._overrideSession) {
                _this.m_requestUrlAndHeaderInfoResolver = SessionBase._overrideSession;
            }
            else {
                if (Utility.isNullOrUndefined(url) || (typeof url === 'string' && url.length === 0)) {
                    url = ClientRequestContext.defaultRequestUrlAndHeaders;
                    if (!url) {
                        url = { url: CoreConstants.localDocument, headers: {} };
                    }
                }
                if (typeof url === 'string') {
                    _this.m_requestUrlAndHeaderInfo = { url: url, headers: {} };
                }
                else if (ClientRequestContext.isRequestUrlAndHeaderInfoResolver(url)) {
                    _this.m_requestUrlAndHeaderInfoResolver = url;
                }
                else if (ClientRequestContext.isRequestUrlAndHeaderInfo(url)) {
                    var requestInfo = url;
                    _this.m_requestUrlAndHeaderInfo = { url: requestInfo.url, headers: {} };
                    CoreUtility._copyHeaders(requestInfo.headers, _this.m_requestUrlAndHeaderInfo.headers);
                }
                else {
                    throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'url' });
                }
            }
            if (!_this.m_requestUrlAndHeaderInfoResolver &&
                _this.m_requestUrlAndHeaderInfo &&
                CoreUtility._isLocalDocumentUrl(_this.m_requestUrlAndHeaderInfo.url) &&
                HostBridgeSession.getInstanceIfHostBridgeInited()) {
                _this.m_requestUrlAndHeaderInfo = null;
                _this.m_requestUrlAndHeaderInfoResolver = HostBridgeSession.getInstanceIfHostBridgeInited();
            }
            if (_this.m_requestUrlAndHeaderInfoResolver instanceof SessionBase) {
                _this.m_session = _this.m_requestUrlAndHeaderInfoResolver;
            }
            _this._processingResult = false;
            _this._customData = Constants.iterativeExecutor;
            _this.sync = _this.sync.bind(_this);
            return _this;
        }
        Object.defineProperty(ClientRequestContext.prototype, "session", {
            get: function () {
                return this.m_session;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestContext.prototype, "eventRegistration", {
            get: function () {
                if (this.m_session) {
                    return this.m_session.eventRegistration;
                }
                return _Internal.officeJsEventRegistration;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestContext.prototype, "_url", {
            get: function () {
                if (this.m_requestUrlAndHeaderInfo) {
                    return this.m_requestUrlAndHeaderInfo.url;
                }
                return null;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestContext.prototype, "_pendingRequest", {
            get: function () {
                if (this.m_pendingRequest == null) {
                    this.m_pendingRequest = new ClientRequest(this);
                }
                return this.m_pendingRequest;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestContext.prototype, "debugInfo", {
            get: function () {
                var prettyPrinter = new RequestPrettyPrinter(this._rootObjectPropertyName, this._pendingRequest._objectPaths, this._pendingRequest._actions, OfficeExtension_1._internalConfig.showDisposeInfoInDebugInfo);
                var statements = prettyPrinter.process();
                return { pendingStatements: statements };
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestContext.prototype, "trackedObjects", {
            get: function () {
                if (!this.m_trackedObjects) {
                    this.m_trackedObjects = new TrackedObjects(this);
                }
                return this.m_trackedObjects;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestContext.prototype, "requestHeaders", {
            get: function () {
                return this.m_customRequestHeaders;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequestContext.prototype, "batchMode", {
            get: function () {
                return this.m_batchMode;
            },
            enumerable: true,
            configurable: true
        });
        ClientRequestContext.prototype.ensureInProgressBatchIfBatchMode = function () {
            if (this.m_batchMode === 1 && !this.m_explicitBatchInProgress) {
                throw Utility.createRuntimeError(CoreErrorCodes.generalException, CoreUtility._getResourceString(ResourceStrings.notInsideBatch), null);
            }
        };
        ClientRequestContext.prototype.load = function (clientObj, option) {
            Utility.validateContext(this, clientObj);
            var queryOption = ClientRequestContext._parseQueryOption(option);
            CommonActionFactory.createQueryAction(this, clientObj, queryOption, clientObj);
        };
        ClientRequestContext.prototype.loadRecursive = function (clientObj, options, maxDepth) {
            if (!Utility.isPlainJsonObject(options)) {
                throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'options' });
            }
            var quries = {};
            for (var key in options) {
                quries[key] = ClientRequestContext._parseQueryOption(options[key]);
            }
            var action = ActionFactory.createRecursiveQueryAction(this, clientObj, { Queries: quries, MaxDepth: maxDepth });
            this._pendingRequest.addActionResultHandler(action, clientObj);
        };
        ClientRequestContext.prototype.trace = function (message) {
            ActionFactory.createTraceAction(this, message, true);
        };
        ClientRequestContext.prototype._processOfficeJsErrorResponse = function (officeJsErrorCode, response) { };
        ClientRequestContext.prototype.ensureRequestUrlAndHeaderInfo = function () {
            var _this = this;
            return Utility._createPromiseFromResult(null).then(function () {
                if (!_this.m_requestUrlAndHeaderInfo) {
                    return _this.m_requestUrlAndHeaderInfoResolver._resolveRequestUrlAndHeaderInfo().then(function (value) {
                        _this.m_requestUrlAndHeaderInfo = value;
                        if (!_this.m_requestUrlAndHeaderInfo) {
                            _this.m_requestUrlAndHeaderInfo = { url: CoreConstants.localDocument, headers: {} };
                        }
                        if (Utility.isNullOrEmptyString(_this.m_requestUrlAndHeaderInfo.url)) {
                            _this.m_requestUrlAndHeaderInfo.url = CoreConstants.localDocument;
                        }
                        if (!_this.m_requestUrlAndHeaderInfo.headers) {
                            _this.m_requestUrlAndHeaderInfo.headers = {};
                        }
                        if (typeof _this.m_requestUrlAndHeaderInfoResolver._createRequestExecutorOrNull === 'function') {
                            var executor = _this.m_requestUrlAndHeaderInfoResolver._createRequestExecutorOrNull();
                            if (executor) {
                                _this._requestExecutor = executor;
                            }
                        }
                    });
                }
            });
        };
        ClientRequestContext.prototype.syncPrivateMain = function () {
            var _this = this;
            return this.ensureRequestUrlAndHeaderInfo().then(function () {
                var req = _this._pendingRequest;
                _this.m_pendingRequest = null;
                return _this.processPreSyncPromises(req).then(function () { return _this.syncPrivate(req); });
            });
        };
        ClientRequestContext.prototype.syncPrivate = function (req) {
            var _this = this;
            if (TestUtility.isMock()) {
                return CoreUtility._createPromiseFromResult(null);
            }
            if (!req.hasActions) {
                return this.processPendingEventHandlers(req);
            }
            var _a = req.buildRequestMessageBodyAndRequestFlags(), msgBody = _a.body, requestFlags = _a.flags;
            if (this._requestFlagModifier) {
                requestFlags |= this._requestFlagModifier;
            }
            if (!this._requestExecutor) {
                if (CoreUtility._isLocalDocumentUrl(this.m_requestUrlAndHeaderInfo.url)) {
                    this._requestExecutor = new OfficeJsRequestExecutor(this);
                }
                else {
                    this._requestExecutor = new HttpRequestExecutor();
                }
            }
            var requestExecutor = this._requestExecutor;
            var headers = {};
            CoreUtility._copyHeaders(this.m_requestUrlAndHeaderInfo.headers, headers);
            CoreUtility._copyHeaders(this.m_customRequestHeaders, headers);
            delete this.m_customRequestHeaders[Constants.officeScriptEventId];
            var requestExecutorRequestMessage = {
                Url: this.m_requestUrlAndHeaderInfo.url,
                Headers: headers,
                Body: msgBody
            };
            req.invalidatePendingInvalidObjectPaths();
            var errorFromResponse = null;
            var errorFromProcessEventHandlers = null;
            this._lastSyncStart = typeof performance === 'undefined' ? 0 : performance.now();
            this._lastRequestFlags = requestFlags;
            return requestExecutor
                .executeAsync(this._customData, requestFlags, requestExecutorRequestMessage)
                .then(function (response) {
                _this._lastSyncEnd = typeof performance === 'undefined' ? 0 : performance.now();
                errorFromResponse = _this.processRequestExecutorResponseMessage(req, response);
                return _this.processPendingEventHandlers(req).catch(function (ex) {
                    CoreUtility.log('Error in processPendingEventHandlers');
                    CoreUtility.log(JSON.stringify(ex));
                    errorFromProcessEventHandlers = ex;
                });
            })
                .then(function () {
                if (errorFromResponse) {
                    CoreUtility.log('Throw error from response: ' + JSON.stringify(errorFromResponse));
                    throw errorFromResponse;
                }
                if (errorFromProcessEventHandlers) {
                    CoreUtility.log('Throw error from ProcessEventHandler: ' + JSON.stringify(errorFromProcessEventHandlers));
                    var transformedError = null;
                    if (errorFromProcessEventHandlers instanceof _Internal.RuntimeError) {
                        transformedError = errorFromProcessEventHandlers;
                        transformedError.traceMessages = req._responseTraceMessages;
                    }
                    else {
                        var message = null;
                        if (typeof errorFromProcessEventHandlers === 'string') {
                            message = errorFromProcessEventHandlers;
                        }
                        else {
                            message = errorFromProcessEventHandlers.message;
                        }
                        if (Utility.isNullOrEmptyString(message)) {
                            message = CoreUtility._getResourceString(ResourceStrings.cannotRegisterEvent);
                        }
                        transformedError = new _Internal.RuntimeError({
                            code: ErrorCodes.cannotRegisterEvent,
                            message: message,
                            traceMessages: req._responseTraceMessages
                        });
                    }
                    throw transformedError;
                }
            });
        };
        ClientRequestContext.prototype.processRequestExecutorResponseMessage = function (req, response) {
            if (response.Body && response.Body.TraceIds) {
                req._setResponseTraceIds(response.Body.TraceIds);
            }
            var traceMessages = req._responseTraceMessages;
            var errorStatementInfo = null;
            if (response.Body) {
                if (response.Body.Error && response.Body.Error.ActionIndex >= 0) {
                    var prettyPrinter = new RequestPrettyPrinter(this._rootObjectPropertyName, req._objectPaths, req._actions, false, true);
                    var debugInfoStatementInfo = prettyPrinter.processForDebugStatementInfo(response.Body.Error.ActionIndex);
                    errorStatementInfo = {
                        statement: debugInfoStatementInfo.statement,
                        surroundingStatements: debugInfoStatementInfo.surroundingStatements,
                        fullStatements: ['Please enable config.extendedErrorLogging to see full statements.']
                    };
                    if (OfficeExtension_1.config.extendedErrorLogging) {
                        prettyPrinter = new RequestPrettyPrinter(this._rootObjectPropertyName, req._objectPaths, req._actions, false, false);
                        errorStatementInfo.fullStatements = prettyPrinter.process();
                    }
                }
                var actionResults = null;
                if (response.Body.Results) {
                    actionResults = response.Body.Results;
                }
                else if (response.Body.ProcessedResults && response.Body.ProcessedResults.Results) {
                    actionResults = response.Body.ProcessedResults.Results;
                }
                if (actionResults) {
                    this._processingResult = true;
                    try {
                        req.processResponse(actionResults);
                    }
                    finally {
                        this._processingResult = false;
                    }
                }
            }
            if (!Utility.isNullOrEmptyString(response.ErrorCode)) {
                return new _Internal.RuntimeError({
                    code: response.ErrorCode,
                    message: response.ErrorMessage,
                    traceMessages: traceMessages
                });
            }
            else if (response.Body && response.Body.Error) {
                var debugInfo = {
                    errorLocation: response.Body.Error.Location
                };
                if (errorStatementInfo) {
                    debugInfo.statement = errorStatementInfo.statement;
                    debugInfo.surroundingStatements = errorStatementInfo.surroundingStatements;
                    debugInfo.fullStatements = errorStatementInfo.fullStatements;
                }
                return new _Internal.RuntimeError({
                    code: response.Body.Error.Code,
                    message: response.Body.Error.Message,
                    traceMessages: traceMessages,
                    debugInfo: debugInfo
                });
            }
            return null;
        };
        ClientRequestContext.prototype.processPendingEventHandlers = function (req) {
            var ret = Utility._createPromiseFromResult(null);
            for (var i = 0; i < req._pendingProcessEventHandlers.length; i++) {
                var eventHandlers = req._pendingProcessEventHandlers[i];
                ret = ret.then(this.createProcessOneEventHandlersFunc(eventHandlers, req));
            }
            return ret;
        };
        ClientRequestContext.prototype.createProcessOneEventHandlersFunc = function (eventHandlers, req) {
            return function () { return eventHandlers._processRegistration(req); };
        };
        ClientRequestContext.prototype.processPreSyncPromises = function (req) {
            var ret = Utility._createPromiseFromResult(null);
            for (var i = 0; i < req._preSyncPromises.length; i++) {
                var p = req._preSyncPromises[i];
                ret = ret.then(this.createProcessOneProSyncFunc(p));
            }
            return ret;
        };
        ClientRequestContext.prototype.createProcessOneProSyncFunc = function (p) {
            return function () { return p; };
        };
        ClientRequestContext.prototype.sync = function (passThroughValue) {
            if (TestUtility.isMock()) {
                return CoreUtility._createPromiseFromResult(passThroughValue);
            }
            return this.syncPrivateMain().then(function () { return passThroughValue; });
        };
        ClientRequestContext.prototype.batch = function (batchBody) {
            var _this = this;
            if (this.m_batchMode !== 1) {
                return CoreUtility._createPromiseFromException(Utility.createRuntimeError(CoreErrorCodes.generalException, null, null));
            }
            if (this.m_explicitBatchInProgress) {
                return CoreUtility._createPromiseFromException(Utility.createRuntimeError(CoreErrorCodes.generalException, CoreUtility._getResourceString(ResourceStrings.pendingBatchInProgress), null));
            }
            if (Utility.isNullOrUndefined(batchBody)) {
                return Utility._createPromiseFromResult(null);
            }
            this.m_explicitBatchInProgress = true;
            var previousRequest = this.m_pendingRequest;
            this.m_pendingRequest = new ClientRequest(this);
            var batchBodyResult;
            try {
                batchBodyResult = batchBody(this._rootObject, this);
            }
            catch (ex) {
                this.m_explicitBatchInProgress = false;
                this.m_pendingRequest = previousRequest;
                return CoreUtility._createPromiseFromException(ex);
            }
            var request;
            var batchBodyResultPromise;
            if (typeof batchBodyResult === 'object' && batchBodyResult && typeof batchBodyResult.then === 'function') {
                batchBodyResultPromise = Utility._createPromiseFromResult(null)
                    .then(function () {
                    return batchBodyResult;
                })
                    .then(function (result) {
                    _this.m_explicitBatchInProgress = false;
                    request = _this.m_pendingRequest;
                    _this.m_pendingRequest = previousRequest;
                    return result;
                })
                    .catch(function (ex) {
                    _this.m_explicitBatchInProgress = false;
                    request = _this.m_pendingRequest;
                    _this.m_pendingRequest = previousRequest;
                    return CoreUtility._createPromiseFromException(ex);
                });
            }
            else {
                this.m_explicitBatchInProgress = false;
                request = this.m_pendingRequest;
                this.m_pendingRequest = previousRequest;
                batchBodyResultPromise = Utility._createPromiseFromResult(batchBodyResult);
            }
            return batchBodyResultPromise.then(function (result) {
                return _this.ensureRequestUrlAndHeaderInfo()
                    .then(function () {
                    return _this.syncPrivate(request);
                })
                    .then(function () {
                    return result;
                });
            });
        };
        ClientRequestContext._run = function (ctxInitializer, runBody, numCleanupAttempts, retryDelay, onCleanupSuccess, onCleanupFailure) {
            if (numCleanupAttempts === void 0) { numCleanupAttempts = 3; }
            if (retryDelay === void 0) { retryDelay = 5000; }
            return ClientRequestContext._runCommon('run', null, ctxInitializer, 0, runBody, numCleanupAttempts, retryDelay, null, onCleanupSuccess, onCleanupFailure);
        };
        ClientRequestContext.isValidRequestInfo = function (value) {
            return (typeof value === 'string' ||
                ClientRequestContext.isRequestUrlAndHeaderInfo(value) ||
                ClientRequestContext.isRequestUrlAndHeaderInfoResolver(value));
        };
        ClientRequestContext.isRequestUrlAndHeaderInfo = function (value) {
            return (typeof value === 'object' &&
                value !== null &&
                Object.getPrototypeOf(value) === Object.getPrototypeOf({}) &&
                !Utility.isNullOrUndefined(value.url));
        };
        ClientRequestContext.isRequestUrlAndHeaderInfoResolver = function (value) {
            return typeof value === 'object' && value !== null && typeof value._resolveRequestUrlAndHeaderInfo === 'function';
        };
        ClientRequestContext._runBatch = function (functionName, receivedRunArgs, ctxInitializer, onBeforeRun, numCleanupAttempts, retryDelay, onCleanupSuccess, onCleanupFailure) {
            if (numCleanupAttempts === void 0) { numCleanupAttempts = 3; }
            if (retryDelay === void 0) { retryDelay = 5000; }
            return ClientRequestContext._runBatchCommon(0, functionName, receivedRunArgs, ctxInitializer, numCleanupAttempts, retryDelay, onBeforeRun, onCleanupSuccess, onCleanupFailure);
        };
        ClientRequestContext._runExplicitBatch = function (functionName, receivedRunArgs, ctxInitializer, onBeforeRun, numCleanupAttempts, retryDelay, onCleanupSuccess, onCleanupFailure) {
            if (numCleanupAttempts === void 0) { numCleanupAttempts = 3; }
            if (retryDelay === void 0) { retryDelay = 5000; }
            return ClientRequestContext._runBatchCommon(1, functionName, receivedRunArgs, ctxInitializer, numCleanupAttempts, retryDelay, onBeforeRun, onCleanupSuccess, onCleanupFailure);
        };
        ClientRequestContext._runBatchCommon = function (batchMode, functionName, receivedRunArgs, ctxInitializer, numCleanupAttempts, retryDelay, onBeforeRun, onCleanupSuccess, onCleanupFailure) {
            if (numCleanupAttempts === void 0) { numCleanupAttempts = 3; }
            if (retryDelay === void 0) { retryDelay = 5000; }
            var ctxRetriever;
            var batch;
            var requestInfo = null;
            var previousObjects = null;
            var argOffset = 0;
            var options = null;
            if (receivedRunArgs.length > 0) {
                if (ClientRequestContext.isValidRequestInfo(receivedRunArgs[0])) {
                    requestInfo = receivedRunArgs[0];
                    argOffset = 1;
                }
                else if (Utility.isPlainJsonObject(receivedRunArgs[0])) {
                    options = receivedRunArgs[0];
                    requestInfo = options.session;
                    if (requestInfo != null && !ClientRequestContext.isValidRequestInfo(requestInfo)) {
                        return ClientRequestContext.createErrorPromise(functionName);
                    }
                    previousObjects = options.previousObjects;
                    argOffset = 1;
                }
            }
            if (receivedRunArgs.length == argOffset + 1) {
                batch = receivedRunArgs[argOffset + 0];
            }
            else if (options == null && receivedRunArgs.length == argOffset + 2) {
                previousObjects = receivedRunArgs[argOffset + 0];
                batch = receivedRunArgs[argOffset + 1];
            }
            else {
                return ClientRequestContext.createErrorPromise(functionName);
            }
            if (previousObjects != null) {
                if (previousObjects instanceof ClientObject) {
                    ctxRetriever = function () { return previousObjects.context; };
                }
                else if (previousObjects instanceof ClientRequestContext) {
                    ctxRetriever = function () { return previousObjects; };
                }
                else if (Array.isArray(previousObjects)) {
                    var array = previousObjects;
                    if (array.length == 0) {
                        return ClientRequestContext.createErrorPromise(functionName);
                    }
                    for (var i = 0; i < array.length; i++) {
                        if (!(array[i] instanceof ClientObject)) {
                            return ClientRequestContext.createErrorPromise(functionName);
                        }
                        if (array[i].context != array[0].context) {
                            return ClientRequestContext.createErrorPromise(functionName, ResourceStrings.invalidRequestContext);
                        }
                    }
                    ctxRetriever = function () { return array[0].context; };
                }
                else {
                    return ClientRequestContext.createErrorPromise(functionName);
                }
            }
            else {
                ctxRetriever = ctxInitializer;
            }
            var onBeforeRunWithOptions = null;
            if (onBeforeRun) {
                onBeforeRunWithOptions = function (context) { return onBeforeRun(options || {}, context); };
            }
            return ClientRequestContext._runCommon(functionName, requestInfo, ctxRetriever, batchMode, batch, numCleanupAttempts, retryDelay, onBeforeRunWithOptions, onCleanupSuccess, onCleanupFailure);
        };
        ClientRequestContext.createErrorPromise = function (functionName, code) {
            if (code === void 0) { code = CoreResourceStrings.invalidArgument; }
            return CoreUtility._createPromiseFromException(Utility.createRuntimeError(code, CoreUtility._getResourceString(code), functionName));
        };
        ClientRequestContext._runCommon = function (functionName, requestInfo, ctxRetriever, batchMode, runBody, numCleanupAttempts, retryDelay, onBeforeRun, onCleanupSuccess, onCleanupFailure) {
            if (SessionBase._overrideSession) {
                requestInfo = SessionBase._overrideSession;
            }
            var starterPromise = CoreUtility.createPromise(function (resolve, reject) {
                resolve();
            });
            var ctx;
            var succeeded = false;
            var resultOrError;
            var previousBatchMode;
            return starterPromise
                .then(function () {
                ctx = ctxRetriever(requestInfo);
                if (ctx._autoCleanup) {
                    return new OfficeExtension_1.Promise(function (resolve, reject) {
                        ctx._onRunFinishedNotifiers.push(function () {
                            ctx._autoCleanup = true;
                            resolve();
                        });
                    });
                }
                else {
                    ctx._autoCleanup = true;
                }
            })
                .then(function () {
                if (typeof runBody !== 'function') {
                    return ClientRequestContext.createErrorPromise(functionName);
                }
                previousBatchMode = ctx.m_batchMode;
                ctx.m_batchMode = batchMode;
                if (onBeforeRun) {
                    onBeforeRun(ctx);
                }
                var runBodyResult;
                if (batchMode == 1) {
                    runBodyResult = runBody(ctx.batch.bind(ctx));
                }
                else {
                    runBodyResult = runBody(ctx);
                }
                if (Utility.isNullOrUndefined(runBodyResult) || typeof runBodyResult.then !== 'function') {
                    Utility.throwError(ResourceStrings.runMustReturnPromise);
                }
                return runBodyResult;
            })
                .then(function (runBodyResult) {
                if (batchMode === 1) {
                    return runBodyResult;
                }
                else {
                    return ctx.sync(runBodyResult);
                }
            })
                .then(function (result) {
                succeeded = true;
                resultOrError = result;
            })
                .catch(function (error) {
                resultOrError = error;
            })
                .then(function () {
                var itemsToRemove = ctx.trackedObjects._retrieveAndClearAutoCleanupList();
                ctx._autoCleanup = false;
                ctx.m_batchMode = previousBatchMode;
                for (var key in itemsToRemove) {
                    itemsToRemove[key]._objectPath.isValid = false;
                }
                var cleanupCounter = 0;
                if (Utility._synchronousCleanup || ClientRequestContext.isRequestUrlAndHeaderInfoResolver(requestInfo)) {
                    return attemptCleanup();
                }
                else {
                    attemptCleanup();
                }
                function attemptCleanup() {
                    cleanupCounter++;
                    var savedPendingRequest = ctx.m_pendingRequest;
                    var savedBatchMode = ctx.m_batchMode;
                    var request = new ClientRequest(ctx);
                    ctx.m_pendingRequest = request;
                    ctx.m_batchMode = 0;
                    try {
                        for (var key in itemsToRemove) {
                            ctx.trackedObjects.remove(itemsToRemove[key]);
                        }
                    }
                    finally {
                        ctx.m_batchMode = savedBatchMode;
                        ctx.m_pendingRequest = savedPendingRequest;
                    }
                    return ctx
                        .syncPrivate(request)
                        .then(function () {
                        if (onCleanupSuccess) {
                            onCleanupSuccess(cleanupCounter);
                        }
                    })
                        .catch(function () {
                        if (onCleanupFailure) {
                            onCleanupFailure(cleanupCounter);
                        }
                        if (cleanupCounter < numCleanupAttempts) {
                            setTimeout(function () {
                                attemptCleanup();
                            }, retryDelay);
                        }
                    });
                }
            })
                .then(function () {
                if (ctx._onRunFinishedNotifiers && ctx._onRunFinishedNotifiers.length > 0) {
                    var func = ctx._onRunFinishedNotifiers.shift();
                    func();
                }
                if (succeeded) {
                    return resultOrError;
                }
                else {
                    throw resultOrError;
                }
            });
        };
        return ClientRequestContext;
    }(ClientRequestContextBase));
    OfficeExtension_1.ClientRequestContext = ClientRequestContext;
    var RetrieveResultImpl = (function () {
        function RetrieveResultImpl(m_proxy, m_shouldPolyfill) {
            this.m_proxy = m_proxy;
            this.m_shouldPolyfill = m_shouldPolyfill;
            var scalarPropertyNames = m_proxy[Constants.scalarPropertyNames];
            var navigationPropertyNames = m_proxy[Constants.navigationPropertyNames];
            var typeName = m_proxy[Constants.className];
            var isCollection = m_proxy[Constants.isCollection];
            if (scalarPropertyNames) {
                for (var i = 0; i < scalarPropertyNames.length; i++) {
                    Utility.definePropertyThrowUnloadedException(this, typeName, scalarPropertyNames[i]);
                }
            }
            if (navigationPropertyNames) {
                for (var i = 0; i < navigationPropertyNames.length; i++) {
                    Utility.definePropertyThrowUnloadedException(this, typeName, navigationPropertyNames[i]);
                }
            }
            if (isCollection) {
                Utility.definePropertyThrowUnloadedException(this, typeName, Constants.itemsLowerCase);
            }
        }
        Object.defineProperty(RetrieveResultImpl.prototype, "$proxy", {
            get: function () {
                return this.m_proxy;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(RetrieveResultImpl.prototype, "$isNullObject", {
            get: function () {
                if (!this.m_isLoaded) {
                    throw new _Internal.RuntimeError({
                        code: ErrorCodes.valueNotLoaded,
                        message: CoreUtility._getResourceString(ResourceStrings.valueNotLoaded),
                        debugInfo: {
                            errorLocation: 'retrieveResult.$isNullObject'
                        }
                    });
                }
                return this.m_isNullObject;
            },
            enumerable: true,
            configurable: true
        });
        RetrieveResultImpl.prototype.toJSON = function () {
            if (!this.m_isLoaded) {
                return undefined;
            }
            if (this.m_isNullObject) {
                return null;
            }
            if (Utility.isUndefined(this.m_json)) {
                this.m_json = Utility.purifyJson(this.m_value);
            }
            return this.m_json;
        };
        RetrieveResultImpl.prototype.toString = function () {
            return JSON.stringify(this.toJSON());
        };
        RetrieveResultImpl.prototype._handleResult = function (value) {
            this.m_isLoaded = true;
            if (value === null || (typeof value === 'object' && value && value._IsNull)) {
                this.m_isNullObject = true;
                value = null;
            }
            else {
                this.m_isNullObject = false;
            }
            if (this.m_shouldPolyfill) {
                value = Utility.changePropertyNameToCamelLowerCase(value);
            }
            this.m_value = value;
            this.m_proxy._handleRetrieveResult(value, this);
        };
        return RetrieveResultImpl;
    }());
    var Constants = (function (_super) {
        __extends(Constants, _super);
        function Constants() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Constants.getItemAt = 'GetItemAt';
        Constants.index = '_Index';
        Constants.iterativeExecutor = 'IterativeExecutor';
        Constants.isTracked = '_IsTracked';
        Constants.eventMessageCategory = 65536;
        Constants.eventWorkbookId = 'Workbook';
        Constants.eventSourceRemote = 'Remote';
        Constants.proxy = '$proxy';
        Constants.className = '_className';
        Constants.isCollection = '_isCollection';
        Constants.collectionPropertyPath = '_collectionPropertyPath';
        Constants.objectPathInfoDoNotKeepReferenceFieldName = 'D';
        Constants.officeScriptEventId = 'X-OfficeScriptEventId';
        return Constants;
    }(CommonConstants));
    OfficeExtension_1.Constants = Constants;
    var ClientRequest = (function (_super) {
        __extends(ClientRequest, _super);
        function ClientRequest(context) {
            var _this = _super.call(this, context) || this;
            _this.m_context = context;
            _this.m_pendingProcessEventHandlers = [];
            _this.m_pendingEventHandlerActions = {};
            _this.m_traceInfos = {};
            _this.m_responseTraceIds = {};
            _this.m_responseTraceMessages = [];
            return _this;
        }
        Object.defineProperty(ClientRequest.prototype, "traceInfos", {
            get: function () {
                return this.m_traceInfos;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequest.prototype, "_responseTraceMessages", {
            get: function () {
                return this.m_responseTraceMessages;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ClientRequest.prototype, "_responseTraceIds", {
            get: function () {
                return this.m_responseTraceIds;
            },
            enumerable: true,
            configurable: true
        });
        ClientRequest.prototype._setResponseTraceIds = function (value) {
            if (value) {
                for (var i = 0; i < value.length; i++) {
                    var traceId = value[i];
                    this.m_responseTraceIds[traceId] = traceId;
                    var message = this.m_traceInfos[traceId];
                    if (!CoreUtility.isNullOrUndefined(message)) {
                        this.m_responseTraceMessages.push(message);
                    }
                }
            }
        };
        ClientRequest.prototype.addTrace = function (actionId, message) {
            this.m_traceInfos[actionId] = message;
        };
        ClientRequest.prototype._addPendingEventHandlerAction = function (eventHandlers, action) {
            if (!this.m_pendingEventHandlerActions[eventHandlers._id]) {
                this.m_pendingEventHandlerActions[eventHandlers._id] = [];
                this.m_pendingProcessEventHandlers.push(eventHandlers);
            }
            this.m_pendingEventHandlerActions[eventHandlers._id].push(action);
        };
        Object.defineProperty(ClientRequest.prototype, "_pendingProcessEventHandlers", {
            get: function () {
                return this.m_pendingProcessEventHandlers;
            },
            enumerable: true,
            configurable: true
        });
        ClientRequest.prototype._getPendingEventHandlerActions = function (eventHandlers) {
            return this.m_pendingEventHandlerActions[eventHandlers._id];
        };
        return ClientRequest;
    }(ClientRequestBase));
    OfficeExtension_1.ClientRequest = ClientRequest;
    var EventHandlers = (function () {
        function EventHandlers(context, parentObject, name, eventInfo) {
            var _this = this;
            this.m_id = context._nextId();
            this.m_context = context;
            this.m_name = name;
            this.m_handlers = [];
            this.m_registered = false;
            this.m_eventInfo = eventInfo;
            this.m_callback = function (args) {
                _this.m_eventInfo.eventArgsTransformFunc(args).then(function (newArgs) { return _this.fireEvent(newArgs); });
            };
        }
        Object.defineProperty(EventHandlers.prototype, "_registered", {
            get: function () {
                return this.m_registered;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(EventHandlers.prototype, "_id", {
            get: function () {
                return this.m_id;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(EventHandlers.prototype, "_handlers", {
            get: function () {
                return this.m_handlers;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(EventHandlers.prototype, "_context", {
            get: function () {
                return this.m_context;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(EventHandlers.prototype, "_callback", {
            get: function () {
                return this.m_callback;
            },
            enumerable: true,
            configurable: true
        });
        EventHandlers.prototype.add = function (handler) {
            var action = ActionFactory.createTraceAction(this.m_context, null, false);
            this.m_context._pendingRequest._addPendingEventHandlerAction(this, {
                id: action.actionInfo.Id,
                handler: handler,
                operation: 0
            });
            return new EventHandlerResult(this.m_context, this, handler);
        };
        EventHandlers.prototype.remove = function (handler) {
            var action = ActionFactory.createTraceAction(this.m_context, null, false);
            this.m_context._pendingRequest._addPendingEventHandlerAction(this, {
                id: action.actionInfo.Id,
                handler: handler,
                operation: 1
            });
        };
        EventHandlers.prototype.removeAll = function () {
            var action = ActionFactory.createTraceAction(this.m_context, null, false);
            this.m_context._pendingRequest._addPendingEventHandlerAction(this, {
                id: action.actionInfo.Id,
                handler: null,
                operation: 2
            });
        };
        EventHandlers.prototype._processRegistration = function (req) {
            var _this = this;
            var ret = CoreUtility._createPromiseFromResult(null);
            var actions = req._getPendingEventHandlerActions(this);
            if (!actions) {
                return ret;
            }
            var handlersResult = [];
            for (var i = 0; i < this.m_handlers.length; i++) {
                handlersResult.push(this.m_handlers[i]);
            }
            var hasChange = false;
            for (var i = 0; i < actions.length; i++) {
                if (req._responseTraceIds[actions[i].id]) {
                    hasChange = true;
                    switch (actions[i].operation) {
                        case 0:
                            handlersResult.push(actions[i].handler);
                            break;
                        case 1:
                            for (var index = handlersResult.length - 1; index >= 0; index--) {
                                if (handlersResult[index] === actions[i].handler) {
                                    handlersResult.splice(index, 1);
                                    break;
                                }
                            }
                            break;
                        case 2:
                            handlersResult = [];
                            break;
                    }
                }
            }
            if (hasChange) {
                if (!this.m_registered && handlersResult.length > 0) {
                    ret = ret.then(function () { return _this.m_eventInfo.registerFunc(_this.m_callback); }).then(function () { return (_this.m_registered = true); });
                }
                else if (this.m_registered && handlersResult.length == 0) {
                    ret = ret
                        .then(function () { return _this.m_eventInfo.unregisterFunc(_this.m_callback); })
                        .catch(function (ex) {
                        CoreUtility.log('Error when unregister event: ' + JSON.stringify(ex));
                    })
                        .then(function () { return (_this.m_registered = false); });
                }
                ret = ret.then(function () { return (_this.m_handlers = handlersResult); });
            }
            return ret;
        };
        EventHandlers.prototype.fireEvent = function (args) {
            var promises = [];
            for (var i = 0; i < this.m_handlers.length; i++) {
                var handler = this.m_handlers[i];
                var p = CoreUtility._createPromiseFromResult(null)
                    .then(this.createFireOneEventHandlerFunc(handler, args))
                    .catch(function (ex) {
                    CoreUtility.log('Error when invoke handler: ' + JSON.stringify(ex));
                });
                promises.push(p);
            }
            CoreUtility.Promise.all(promises);
        };
        EventHandlers.prototype.createFireOneEventHandlerFunc = function (handler, args) {
            return function () { return handler(args); };
        };
        return EventHandlers;
    }());
    OfficeExtension_1.EventHandlers = EventHandlers;
    var EventHandlerResult = (function () {
        function EventHandlerResult(context, handlers, handler) {
            this.m_context = context;
            this.m_allHandlers = handlers;
            this.m_handler = handler;
        }
        Object.defineProperty(EventHandlerResult.prototype, "context", {
            get: function () {
                return this.m_context;
            },
            enumerable: true,
            configurable: true
        });
        EventHandlerResult.prototype.remove = function () {
            if (this.m_allHandlers && this.m_handler) {
                this.m_allHandlers.remove(this.m_handler);
                this.m_allHandlers = null;
                this.m_handler = null;
            }
        };
        return EventHandlerResult;
    }());
    OfficeExtension_1.EventHandlerResult = EventHandlerResult;
    (function (_Internal) {
        var OfficeJsEventRegistration = (function () {
            function OfficeJsEventRegistration() {
            }
            OfficeJsEventRegistration.prototype.register = function (eventId, targetId, handler) {
                switch (eventId) {
                    case 4:
                        return Utility.promisify(function (callback) { return Office.context.document.bindings.getByIdAsync(targetId, callback); }).then(function (officeBinding) {
                            return Utility.promisify(function (callback) {
                                return officeBinding.addHandlerAsync(Office.EventType.BindingDataChanged, handler, callback);
                            });
                        });
                    case 3:
                        return Utility.promisify(function (callback) { return Office.context.document.bindings.getByIdAsync(targetId, callback); }).then(function (officeBinding) {
                            return Utility.promisify(function (callback) {
                                return officeBinding.addHandlerAsync(Office.EventType.BindingSelectionChanged, handler, callback);
                            });
                        });
                    case 2:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.addHandlerAsync(Office.EventType.DocumentSelectionChanged, handler, callback);
                        });
                    case 1:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.settings.addHandlerAsync(Office.EventType.SettingsChanged, handler, callback);
                        });
                    case 5:
                        return Utility.promisify(function (callback) {
                            return OSF.DDA.RichApi.richApiMessageManager.addHandlerAsync('richApiMessage', handler, callback);
                        });
                    case 13:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.addHandlerAsync(Office.EventType.ObjectDeleted, handler, { id: targetId }, callback);
                        });
                    case 14:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.addHandlerAsync(Office.EventType.ObjectSelectionChanged, handler, { id: targetId }, callback);
                        });
                    case 15:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.addHandlerAsync(Office.EventType.ObjectDataChanged, handler, { id: targetId }, callback);
                        });
                    case 16:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.addHandlerAsync(Office.EventType.ContentControlAdded, handler, { id: targetId }, callback);
                        });
                    default:
                        throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'eventId' });
                }
            };
            OfficeJsEventRegistration.prototype.unregister = function (eventId, targetId, handler) {
                switch (eventId) {
                    case 4:
                        return Utility.promisify(function (callback) { return Office.context.document.bindings.getByIdAsync(targetId, callback); }).then(function (officeBinding) {
                            return Utility.promisify(function (callback) {
                                return officeBinding.removeHandlerAsync(Office.EventType.BindingDataChanged, { handler: handler }, callback);
                            });
                        });
                    case 3:
                        return Utility.promisify(function (callback) { return Office.context.document.bindings.getByIdAsync(targetId, callback); }).then(function (officeBinding) {
                            return Utility.promisify(function (callback) {
                                return officeBinding.removeHandlerAsync(Office.EventType.BindingSelectionChanged, { handler: handler }, callback);
                            });
                        });
                    case 2:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.removeHandlerAsync(Office.EventType.DocumentSelectionChanged, { handler: handler }, callback);
                        });
                    case 1:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.settings.removeHandlerAsync(Office.EventType.SettingsChanged, { handler: handler }, callback);
                        });
                    case 5:
                        return Utility.promisify(function (callback) {
                            return OSF.DDA.RichApi.richApiMessageManager.removeHandlerAsync('richApiMessage', { handler: handler }, callback);
                        });
                    case 13:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.removeHandlerAsync(Office.EventType.ObjectDeleted, { id: targetId, handler: handler }, callback);
                        });
                    case 14:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.removeHandlerAsync(Office.EventType.ObjectSelectionChanged, { id: targetId, handler: handler }, callback);
                        });
                    case 15:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.removeHandlerAsync(Office.EventType.ObjectDataChanged, { id: targetId, handler: handler }, callback);
                        });
                    case 16:
                        return Utility.promisify(function (callback) {
                            return Office.context.document.removeHandlerAsync(Office.EventType.ContentControlAdded, { id: targetId, handler: handler }, callback);
                        });
                    default:
                        throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'eventId' });
                }
            };
            return OfficeJsEventRegistration;
        }());
        _Internal.officeJsEventRegistration = new OfficeJsEventRegistration();
    })(_Internal = OfficeExtension_1._Internal || (OfficeExtension_1._Internal = {}));
    var EventRegistration = (function () {
        function EventRegistration(registerEventImpl, unregisterEventImpl) {
            this.m_handlersByEventByTarget = {};
            this.m_registerEventImpl = registerEventImpl;
            this.m_unregisterEventImpl = unregisterEventImpl;
        }
        EventRegistration.getTargetIdOrDefault = function (targetId) {
            if (Utility.isNullOrUndefined(targetId)) {
                return '';
            }
            return targetId;
        };
        EventRegistration.prototype.getHandlers = function (eventId, targetId) {
            targetId = EventRegistration.getTargetIdOrDefault(targetId);
            var handlersById = this.m_handlersByEventByTarget[eventId];
            if (!handlersById) {
                handlersById = {};
                this.m_handlersByEventByTarget[eventId] = handlersById;
            }
            var handlers = handlersById[targetId];
            if (!handlers) {
                handlers = [];
                handlersById[targetId] = handlers;
            }
            return handlers;
        };
        EventRegistration.prototype.callHandlers = function (eventId, targetId, argument) {
            var funcs = this.getHandlers(eventId, targetId);
            for (var i = 0; i < funcs.length; i++) {
                funcs[i](argument);
            }
        };
        EventRegistration.prototype.hasHandlers = function (eventId, targetId) {
            return this.getHandlers(eventId, targetId).length > 0;
        };
        EventRegistration.prototype.register = function (eventId, targetId, handler) {
            if (!handler) {
                throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'handler' });
            }
            var handlers = this.getHandlers(eventId, targetId);
            handlers.push(handler);
            if (handlers.length === 1) {
                return this.m_registerEventImpl(eventId, targetId);
            }
            return Utility._createPromiseFromResult(null);
        };
        EventRegistration.prototype.unregister = function (eventId, targetId, handler) {
            if (!handler) {
                throw _Internal.RuntimeError._createInvalidArgError({ argumentName: 'handler' });
            }
            var handlers = this.getHandlers(eventId, targetId);
            for (var index = handlers.length - 1; index >= 0; index--) {
                if (handlers[index] === handler) {
                    handlers.splice(index, 1);
                    break;
                }
            }
            if (handlers.length === 0) {
                return this.m_unregisterEventImpl(eventId, targetId);
            }
            return Utility._createPromiseFromResult(null);
        };
        return EventRegistration;
    }());
    OfficeExtension_1.EventRegistration = EventRegistration;
    var GenericEventRegistration = (function () {
        function GenericEventRegistration() {
            this.m_eventRegistration = new EventRegistration(this._registerEventImpl.bind(this), this._unregisterEventImpl.bind(this));
            this.m_richApiMessageHandler = this._handleRichApiMessage.bind(this);
        }
        GenericEventRegistration.prototype.ready = function () {
            var _this = this;
            if (!this.m_ready) {
                if (GenericEventRegistration._testReadyImpl) {
                    this.m_ready = GenericEventRegistration._testReadyImpl().then(function () {
                        _this.m_isReady = true;
                    });
                }
                else if (HostBridge.instance) {
                    this.m_ready = Utility._createPromiseFromResult(null).then(function () {
                        _this.m_isReady = true;
                    });
                }
                else {
                    this.m_ready = _Internal.officeJsEventRegistration
                        .register(5, '', this.m_richApiMessageHandler)
                        .then(function () {
                        _this.m_isReady = true;
                    });
                }
            }
            return this.m_ready;
        };
        Object.defineProperty(GenericEventRegistration.prototype, "isReady", {
            get: function () {
                return this.m_isReady;
            },
            enumerable: true,
            configurable: true
        });
        GenericEventRegistration.prototype.register = function (eventId, targetId, handler) {
            var _this = this;
            return this.ready().then(function () { return _this.m_eventRegistration.register(eventId, targetId, handler); });
        };
        GenericEventRegistration.prototype.unregister = function (eventId, targetId, handler) {
            var _this = this;
            return this.ready().then(function () { return _this.m_eventRegistration.unregister(eventId, targetId, handler); });
        };
        GenericEventRegistration.prototype._registerEventImpl = function (eventId, targetId) {
            return Utility._createPromiseFromResult(null);
        };
        GenericEventRegistration.prototype._unregisterEventImpl = function (eventId, targetId) {
            return Utility._createPromiseFromResult(null);
        };
        GenericEventRegistration.prototype._handleRichApiMessage = function (msg) {
            if (msg && msg.entries) {
                for (var entryIndex = 0; entryIndex < msg.entries.length; entryIndex++) {
                    var entry = msg.entries[entryIndex];
                    if (entry.messageCategory == Constants.eventMessageCategory) {
                        if (CoreUtility._logEnabled) {
                            CoreUtility.log(JSON.stringify(entry));
                        }
                        var eventId = entry.messageType;
                        var targetId = entry.targetId;
                        var hasHandlers = this.m_eventRegistration.hasHandlers(eventId, targetId);
                        if (hasHandlers) {
                            var arg = JSON.parse(entry.message);
                            if (entry.isRemoteOverride) {
                                arg.source = Constants.eventSourceRemote;
                            }
                            this.m_eventRegistration.callHandlers(eventId, targetId, arg);
                        }
                    }
                }
            }
        };
        GenericEventRegistration.getGenericEventRegistration = function () {
            if (!GenericEventRegistration.s_genericEventRegistration) {
                GenericEventRegistration.s_genericEventRegistration = new GenericEventRegistration();
            }
            return GenericEventRegistration.s_genericEventRegistration;
        };
        GenericEventRegistration.richApiMessageEventCategory = 65536;
        return GenericEventRegistration;
    }());
    OfficeExtension_1.GenericEventRegistration = GenericEventRegistration;
    function _testSetRichApiMessageReadyImpl(impl) {
        GenericEventRegistration._testReadyImpl = impl;
    }
    OfficeExtension_1._testSetRichApiMessageReadyImpl = _testSetRichApiMessageReadyImpl;
    function _testTriggerRichApiMessageEvent(msg) {
        GenericEventRegistration.getGenericEventRegistration()._handleRichApiMessage(msg);
    }
    OfficeExtension_1._testTriggerRichApiMessageEvent = _testTriggerRichApiMessageEvent;
    var GenericEventHandlers = (function (_super) {
        __extends(GenericEventHandlers, _super);
        function GenericEventHandlers(context, parentObject, name, eventInfo) {
            var _this = _super.call(this, context, parentObject, name, eventInfo) || this;
            _this.m_genericEventInfo = eventInfo;
            return _this;
        }
        GenericEventHandlers.prototype.add = function (handler) {
            var _this = this;
            if (this._handlers.length == 0 && this.m_genericEventInfo.registerFunc) {
                this.m_genericEventInfo.registerFunc();
            }
            if (!GenericEventRegistration.getGenericEventRegistration().isReady) {
                this._context._pendingRequest._addPreSyncPromise(GenericEventRegistration.getGenericEventRegistration().ready());
            }
            ActionFactory.createTraceMarkerForCallback(this._context, function () {
                _this._handlers.push(handler);
                if (_this._handlers.length == 1) {
                    GenericEventRegistration.getGenericEventRegistration().register(_this.m_genericEventInfo.eventType, _this.m_genericEventInfo.getTargetIdFunc(), _this._callback);
                }
            });
            return new EventHandlerResult(this._context, this, handler);
        };
        GenericEventHandlers.prototype.remove = function (handler) {
            var _this = this;
            if (this._handlers.length == 1 && this.m_genericEventInfo.unregisterFunc) {
                this.m_genericEventInfo.unregisterFunc();
            }
            ActionFactory.createTraceMarkerForCallback(this._context, function () {
                var handlers = _this._handlers;
                for (var index = handlers.length - 1; index >= 0; index--) {
                    if (handlers[index] === handler) {
                        handlers.splice(index, 1);
                        break;
                    }
                }
                if (handlers.length == 0) {
                    GenericEventRegistration.getGenericEventRegistration().unregister(_this.m_genericEventInfo.eventType, _this.m_genericEventInfo.getTargetIdFunc(), _this._callback);
                }
            });
        };
        GenericEventHandlers.prototype.removeAll = function () { };
        return GenericEventHandlers;
    }(EventHandlers));
    OfficeExtension_1.GenericEventHandlers = GenericEventHandlers;
    var InstantiateActionResultHandler = (function () {
        function InstantiateActionResultHandler(clientObject) {
            this.m_clientObject = clientObject;
        }
        InstantiateActionResultHandler.prototype._handleResult = function (value) {
            this.m_clientObject._handleIdResult(value);
        };
        return InstantiateActionResultHandler;
    }());
    var ObjectPathFactory = (function () {
        function ObjectPathFactory() {
        }
        ObjectPathFactory.createGlobalObjectObjectPath = function (context) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 1,
                Name: ''
            };
            return new ObjectPath(objectPathInfo, null, false, false, 1, 4);
        };
        ObjectPathFactory.createNewObjectObjectPath = function (context, typeName, isCollection, flags) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 2,
                Name: typeName
            };
            var ret = new ObjectPath(objectPathInfo, null, isCollection, false, 1, Utility._fixupApiFlags(flags));
            return ret;
        };
        ObjectPathFactory.createPropertyObjectPath = function (context, parent, propertyName, isCollection, isInvalidAfterRequest, flags) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 4,
                Name: propertyName,
                ParentObjectPathId: parent._objectPath.objectPathInfo.Id
            };
            var ret = new ObjectPath(objectPathInfo, parent._objectPath, isCollection, isInvalidAfterRequest, 1, Utility._fixupApiFlags(flags));
            return ret;
        };
        ObjectPathFactory.createIndexerObjectPath = function (context, parent, args) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 5,
                Name: '',
                ParentObjectPathId: parent._objectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            };
            objectPathInfo.ArgumentInfo.Arguments = args;
            return new ObjectPath(objectPathInfo, parent._objectPath, false, false, 1, 4);
        };
        ObjectPathFactory.createIndexerObjectPathUsingParentPath = function (context, parentObjectPath, args) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 5,
                Name: '',
                ParentObjectPathId: parentObjectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            };
            objectPathInfo.ArgumentInfo.Arguments = args;
            return new ObjectPath(objectPathInfo, parentObjectPath, false, false, 1, 4);
        };
        ObjectPathFactory.createMethodObjectPath = function (context, parent, methodName, operationType, args, isCollection, isInvalidAfterRequest, getByIdMethodName, flags) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 3,
                Name: methodName,
                ParentObjectPathId: parent._objectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            };
            var argumentObjectPaths = Utility.setMethodArguments(context, objectPathInfo.ArgumentInfo, args);
            var ret = new ObjectPath(objectPathInfo, parent._objectPath, isCollection, isInvalidAfterRequest, operationType, Utility._fixupApiFlags(flags));
            ret.argumentObjectPaths = argumentObjectPaths;
            ret.getByIdMethodName = getByIdMethodName;
            return ret;
        };
        ObjectPathFactory.createReferenceIdObjectPath = function (context, referenceId) {
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 6,
                Name: referenceId,
                ArgumentInfo: {}
            };
            var ret = new ObjectPath(objectPathInfo, null, false, false, 1, 4);
            return ret;
        };
        ObjectPathFactory.createChildItemObjectPathUsingIndexerOrGetItemAt = function (hasIndexerMethod, context, parent, childItem, index) {
            var id = Utility.tryGetObjectIdFromLoadOrRetrieveResult(childItem);
            if (hasIndexerMethod && !Utility.isNullOrUndefined(id)) {
                return ObjectPathFactory.createChildItemObjectPathUsingIndexer(context, parent, childItem);
            }
            else {
                return ObjectPathFactory.createChildItemObjectPathUsingGetItemAt(context, parent, childItem, index);
            }
        };
        ObjectPathFactory.createChildItemObjectPathUsingIndexer = function (context, parent, childItem) {
            var id = Utility.tryGetObjectIdFromLoadOrRetrieveResult(childItem);
            var objectPathInfo = (objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 5,
                Name: '',
                ParentObjectPathId: parent._objectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            });
            objectPathInfo.ArgumentInfo.Arguments = [id];
            return new ObjectPath(objectPathInfo, parent._objectPath, false, false, 1, 4);
        };
        ObjectPathFactory.createChildItemObjectPathUsingGetItemAt = function (context, parent, childItem, index) {
            var indexFromServer = childItem[Constants.index];
            if (indexFromServer) {
                index = indexFromServer;
            }
            var objectPathInfo = {
                Id: context._nextId(),
                ObjectPathType: 3,
                Name: Constants.getItemAt,
                ParentObjectPathId: parent._objectPath.objectPathInfo.Id,
                ArgumentInfo: {}
            };
            objectPathInfo.ArgumentInfo.Arguments = [index];
            return new ObjectPath(objectPathInfo, parent._objectPath, false, false, 1, 4);
        };
        return ObjectPathFactory;
    }());
    OfficeExtension_1.ObjectPathFactory = ObjectPathFactory;
    var OfficeJsRequestExecutor = (function () {
        function OfficeJsRequestExecutor(context) {
            this.m_context = context;
        }
        OfficeJsRequestExecutor.prototype.executeAsync = function (customData, requestFlags, requestMessage) {
            var _this = this;
            var messageSafearray = RichApiMessageUtility.buildMessageArrayForIRequestExecutor(customData, requestFlags, requestMessage, OfficeJsRequestExecutor.SourceLibHeaderValue);
            return new OfficeExtension_1.Promise(function (resolve, reject) {
                OSF.DDA.RichApi.executeRichApiRequestAsync(messageSafearray, function (result) {
                    CoreUtility.log('Response:');
                    CoreUtility.log(JSON.stringify(result));
                    var response;
                    if (result.status == 'succeeded') {
                        response = RichApiMessageUtility.buildResponseOnSuccess(RichApiMessageUtility.getResponseBody(result), RichApiMessageUtility.getResponseHeaders(result));
                    }
                    else {
                        response = RichApiMessageUtility.buildResponseOnError(result.error.code, result.error.message);
                        _this.m_context._processOfficeJsErrorResponse(result.error.code, response);
                    }
                    resolve(response);
                });
            });
        };
        OfficeJsRequestExecutor.SourceLibHeaderValue = 'officejs';
        return OfficeJsRequestExecutor;
    }());
    var TrackedObjects = (function () {
        function TrackedObjects(context) {
            this._autoCleanupList = {};
            this.m_context = context;
        }
        TrackedObjects.prototype.add = function (param) {
            var _this = this;
            if (Array.isArray(param)) {
                param.forEach(function (item) { return _this._addCommon(item, true); });
            }
            else {
                this._addCommon(param, true);
            }
        };
        TrackedObjects.prototype._autoAdd = function (object) {
            this._addCommon(object, false);
            this._autoCleanupList[object._objectPath.objectPathInfo.Id] = object;
        };
        TrackedObjects.prototype._autoTrackIfNecessaryWhenHandleObjectResultValue = function (object, resultValue) {
            var shouldAutoTrack = this.m_context._autoCleanup &&
                !object[Constants.isTracked] &&
                object !== this.m_context._rootObject &&
                resultValue &&
                !Utility.isNullOrEmptyString(resultValue[Constants.referenceId]);
            if (shouldAutoTrack) {
                this._autoCleanupList[object._objectPath.objectPathInfo.Id] = object;
                object[Constants.isTracked] = true;
            }
        };
        TrackedObjects.prototype._addCommon = function (object, isExplicitlyAdded) {
            if (object[Constants.isTracked]) {
                if (isExplicitlyAdded && this.m_context._autoCleanup) {
                    delete this._autoCleanupList[object._objectPath.objectPathInfo.Id];
                }
                return;
            }
            var referenceId = object[Constants.referenceId];
            var donotKeepReference = object._objectPath.objectPathInfo[Constants.objectPathInfoDoNotKeepReferenceFieldName];
            if (donotKeepReference) {
                throw Utility.createRuntimeError(CoreErrorCodes.generalException, CoreUtility._getResourceString(ResourceStrings.objectIsUntracked), null);
            }
            if (Utility.isNullOrEmptyString(referenceId) && object._KeepReference) {
                object._KeepReference();
                ActionFactory.createInstantiateAction(this.m_context, object);
                if (isExplicitlyAdded && this.m_context._autoCleanup) {
                    delete this._autoCleanupList[object._objectPath.objectPathInfo.Id];
                }
                object[Constants.isTracked] = true;
            }
        };
        TrackedObjects.prototype.remove = function (param) {
            var _this = this;
            if (Array.isArray(param)) {
                param.forEach(function (item) { return _this._removeCommon(item); });
            }
            else {
                this._removeCommon(param);
            }
        };
        TrackedObjects.prototype._removeCommon = function (object) {
            object._objectPath.objectPathInfo[Constants.objectPathInfoDoNotKeepReferenceFieldName] = true;
            object.context._pendingRequest._removeKeepReferenceAction(object._objectPath.objectPathInfo.Id);
            var referenceId = object[Constants.referenceId];
            if (!Utility.isNullOrEmptyString(referenceId)) {
                var rootObject = this.m_context._rootObject;
                if (rootObject._RemoveReference) {
                    rootObject._RemoveReference(referenceId);
                }
            }
            delete object[Constants.isTracked];
        };
        TrackedObjects.prototype._retrieveAndClearAutoCleanupList = function () {
            var list = this._autoCleanupList;
            this._autoCleanupList = {};
            return list;
        };
        return TrackedObjects;
    }());
    OfficeExtension_1.TrackedObjects = TrackedObjects;
    var RequestPrettyPrinter = (function () {
        function RequestPrettyPrinter(globalObjName, referencedObjectPaths, actions, showDispose, removePII) {
            if (!globalObjName) {
                globalObjName = 'root';
            }
            this.m_globalObjName = globalObjName;
            this.m_referencedObjectPaths = referencedObjectPaths;
            this.m_actions = actions;
            this.m_statements = [];
            this.m_variableNameForObjectPathMap = {};
            this.m_variableNameToObjectPathMap = {};
            this.m_declaredObjectPathMap = {};
            this.m_showDispose = showDispose;
            this.m_removePII = removePII;
        }
        RequestPrettyPrinter.prototype.process = function () {
            if (this.m_showDispose) {
                ClientRequest._calculateLastUsedObjectPathIds(this.m_actions);
            }
            for (var i = 0; i < this.m_actions.length; i++) {
                this.processOneAction(this.m_actions[i]);
            }
            return this.m_statements;
        };
        RequestPrettyPrinter.prototype.processForDebugStatementInfo = function (actionIndex) {
            if (this.m_showDispose) {
                ClientRequest._calculateLastUsedObjectPathIds(this.m_actions);
            }
            var surroundingCount = 5;
            this.m_statements = [];
            var oneStatement = '';
            var statementIndex = -1;
            for (var i = 0; i < this.m_actions.length; i++) {
                this.processOneAction(this.m_actions[i]);
                if (actionIndex == i) {
                    statementIndex = this.m_statements.length - 1;
                }
                if (statementIndex >= 0 && this.m_statements.length > statementIndex + surroundingCount + 1) {
                    break;
                }
            }
            if (statementIndex < 0) {
                return null;
            }
            var startIndex = statementIndex - surroundingCount;
            if (startIndex < 0) {
                startIndex = 0;
            }
            var endIndex = statementIndex + 1 + surroundingCount;
            if (endIndex > this.m_statements.length) {
                endIndex = this.m_statements.length;
            }
            var surroundingStatements = [];
            if (startIndex != 0) {
                surroundingStatements.push('...');
            }
            for (var i_1 = startIndex; i_1 < statementIndex; i_1++) {
                surroundingStatements.push(this.m_statements[i_1]);
            }
            surroundingStatements.push('// >>>>>');
            surroundingStatements.push(this.m_statements[statementIndex]);
            surroundingStatements.push('// <<<<<');
            for (var i_2 = statementIndex + 1; i_2 < endIndex; i_2++) {
                surroundingStatements.push(this.m_statements[i_2]);
            }
            if (endIndex < this.m_statements.length) {
                surroundingStatements.push('...');
            }
            return {
                statement: this.m_statements[statementIndex],
                surroundingStatements: surroundingStatements
            };
        };
        RequestPrettyPrinter.prototype.processOneAction = function (action) {
            var actionInfo = action.actionInfo;
            switch (actionInfo.ActionType) {
                case 1:
                    this.processInstantiateAction(action);
                    break;
                case 3:
                    this.processMethodAction(action);
                    break;
                case 2:
                    this.processQueryAction(action);
                    break;
                case 7:
                    this.processQueryAsJsonAction(action);
                    break;
                case 6:
                    this.processRecursiveQueryAction(action);
                    break;
                case 4:
                    this.processSetPropertyAction(action);
                    break;
                case 5:
                    this.processTraceAction(action);
                    break;
                case 8:
                    this.processEnsureUnchangedAction(action);
                    break;
                case 9:
                    this.processUpdateAction(action);
                    break;
            }
        };
        RequestPrettyPrinter.prototype.processInstantiateAction = function (action) {
            var objId = action.actionInfo.ObjectPathId;
            var objPath = this.m_referencedObjectPaths[objId];
            var varName = this.getObjVarName(objId);
            if (!this.m_declaredObjectPathMap[objId]) {
                var statement = 'var ' + varName + ' = ' + this.buildObjectPathExpressionWithParent(objPath) + ';';
                statement = this.appendDisposeCommentIfRelevant(statement, action);
                this.m_statements.push(statement);
                this.m_declaredObjectPathMap[objId] = varName;
            }
            else {
                var statement = '// Instantiate {' + varName + '}';
                statement = this.appendDisposeCommentIfRelevant(statement, action);
                this.m_statements.push(statement);
            }
        };
        RequestPrettyPrinter.prototype.processMethodAction = function (action) {
            var methodName = action.actionInfo.Name;
            if (methodName === '_KeepReference') {
                if (!OfficeExtension_1._internalConfig.showInternalApiInDebugInfo) {
                    return;
                }
                methodName = 'track';
            }
            var statement = this.getObjVarName(action.actionInfo.ObjectPathId) +
                '.' +
                Utility._toCamelLowerCase(methodName) +
                '(' +
                this.buildArgumentsExpression(action.actionInfo.ArgumentInfo) +
                ');';
            statement = this.appendDisposeCommentIfRelevant(statement, action);
            this.m_statements.push(statement);
        };
        RequestPrettyPrinter.prototype.processQueryAction = function (action) {
            var queryExp = this.buildQueryExpression(action);
            var statement = this.getObjVarName(action.actionInfo.ObjectPathId) + '.load(' + queryExp + ');';
            statement = this.appendDisposeCommentIfRelevant(statement, action);
            this.m_statements.push(statement);
        };
        RequestPrettyPrinter.prototype.processQueryAsJsonAction = function (action) {
            var queryExp = this.buildQueryExpression(action);
            var statement = this.getObjVarName(action.actionInfo.ObjectPathId) + '.retrieve(' + queryExp + ');';
            statement = this.appendDisposeCommentIfRelevant(statement, action);
            this.m_statements.push(statement);
        };
        RequestPrettyPrinter.prototype.processRecursiveQueryAction = function (action) {
            var queryExp = '';
            if (action.actionInfo.RecursiveQueryInfo) {
                queryExp = JSON.stringify(action.actionInfo.RecursiveQueryInfo);
            }
            var statement = this.getObjVarName(action.actionInfo.ObjectPathId) + '.loadRecursive(' + queryExp + ');';
            statement = this.appendDisposeCommentIfRelevant(statement, action);
            this.m_statements.push(statement);
        };
        RequestPrettyPrinter.prototype.processSetPropertyAction = function (action) {
            var statement = this.getObjVarName(action.actionInfo.ObjectPathId) +
                '.' +
                Utility._toCamelLowerCase(action.actionInfo.Name) +
                ' = ' +
                this.buildArgumentsExpression(action.actionInfo.ArgumentInfo) +
                ';';
            statement = this.appendDisposeCommentIfRelevant(statement, action);
            this.m_statements.push(statement);
        };
        RequestPrettyPrinter.prototype.processTraceAction = function (action) {
            var statement = 'context.trace();';
            statement = this.appendDisposeCommentIfRelevant(statement, action);
            this.m_statements.push(statement);
        };
        RequestPrettyPrinter.prototype.processEnsureUnchangedAction = function (action) {
            var statement = this.getObjVarName(action.actionInfo.ObjectPathId) +
                '.ensureUnchanged(' +
                JSON.stringify(action.actionInfo.ObjectState) +
                ');';
            statement = this.appendDisposeCommentIfRelevant(statement, action);
            this.m_statements.push(statement);
        };
        RequestPrettyPrinter.prototype.processUpdateAction = function (action) {
            var statement = this.getObjVarName(action.actionInfo.ObjectPathId) +
                '.update(' +
                JSON.stringify(action.actionInfo.ObjectState) +
                ');';
            statement = this.appendDisposeCommentIfRelevant(statement, action);
            this.m_statements.push(statement);
        };
        RequestPrettyPrinter.prototype.appendDisposeCommentIfRelevant = function (statement, action) {
            var _this = this;
            if (this.m_showDispose) {
                var lastUsedObjectPathIds = action.actionInfo.L;
                if (lastUsedObjectPathIds && lastUsedObjectPathIds.length > 0) {
                    var objectNamesToDispose = lastUsedObjectPathIds.map(function (item) { return _this.getObjVarName(item); }).join(', ');
                    return statement + ' // And then dispose {' + objectNamesToDispose + '}';
                }
            }
            return statement;
        };
        RequestPrettyPrinter.prototype.buildQueryExpression = function (action) {
            if (action.actionInfo.QueryInfo) {
                var option = {};
                option.select = action.actionInfo.QueryInfo.Select;
                option.expand = action.actionInfo.QueryInfo.Expand;
                option.skip = action.actionInfo.QueryInfo.Skip;
                option.top = action.actionInfo.QueryInfo.Top;
                if (typeof option.top === 'undefined' &&
                    typeof option.skip === 'undefined' &&
                    typeof option.expand === 'undefined') {
                    if (typeof option.select === 'undefined') {
                        return '';
                    }
                    else {
                        return JSON.stringify(option.select);
                    }
                }
                else {
                    return JSON.stringify(option);
                }
            }
            return '';
        };
        RequestPrettyPrinter.prototype.buildObjectPathExpressionWithParent = function (objPath) {
            var hasParent = objPath.objectPathInfo.ObjectPathType == 5 ||
                objPath.objectPathInfo.ObjectPathType == 3 ||
                objPath.objectPathInfo.ObjectPathType == 4;
            if (hasParent && objPath.objectPathInfo.ParentObjectPathId) {
                return (this.getObjVarName(objPath.objectPathInfo.ParentObjectPathId) + '.' + this.buildObjectPathExpression(objPath));
            }
            return this.buildObjectPathExpression(objPath);
        };
        RequestPrettyPrinter.prototype.buildObjectPathExpression = function (objPath) {
            var expr = this.buildObjectPathInfoExpression(objPath.objectPathInfo);
            var originalObjectPathInfo = objPath.originalObjectPathInfo;
            if (originalObjectPathInfo) {
                expr = expr + ' /* originally ' + this.buildObjectPathInfoExpression(originalObjectPathInfo) + ' */';
            }
            return expr;
        };
        RequestPrettyPrinter.prototype.buildObjectPathInfoExpression = function (objectPathInfo) {
            switch (objectPathInfo.ObjectPathType) {
                case 1:
                    return 'context.' + this.m_globalObjName;
                case 5:
                    return 'getItem(' + this.buildArgumentsExpression(objectPathInfo.ArgumentInfo) + ')';
                case 3:
                    return (Utility._toCamelLowerCase(objectPathInfo.Name) +
                        '(' +
                        this.buildArgumentsExpression(objectPathInfo.ArgumentInfo) +
                        ')');
                case 2:
                    return objectPathInfo.Name + '.newObject()';
                case 7:
                    return 'null';
                case 4:
                    return Utility._toCamelLowerCase(objectPathInfo.Name);
                case 6:
                    return ('context.' + this.m_globalObjName + '._getObjectByReferenceId(' + JSON.stringify(objectPathInfo.Name) + ')');
            }
        };
        RequestPrettyPrinter.prototype.buildArgumentsExpression = function (args) {
            var ret = '';
            if (!args.Arguments || args.Arguments.length === 0) {
                return ret;
            }
            if (this.m_removePII) {
                if (typeof args.Arguments[0] === 'undefined') {
                    return ret;
                }
                return '...';
            }
            for (var i = 0; i < args.Arguments.length; i++) {
                if (i > 0) {
                    ret = ret + ', ';
                }
                ret =
                    ret +
                        this.buildArgumentLiteral(args.Arguments[i], args.ReferencedObjectPathIds ? args.ReferencedObjectPathIds[i] : null);
            }
            if (ret === 'undefined') {
                ret = '';
            }
            return ret;
        };
        RequestPrettyPrinter.prototype.buildArgumentLiteral = function (value, objectPathId) {
            if (typeof value == 'number' && value === objectPathId) {
                return this.getObjVarName(objectPathId);
            }
            else {
                return JSON.stringify(value);
            }
        };
        RequestPrettyPrinter.prototype.getObjVarNameBase = function (objectPathId) {
            var ret = 'v';
            var objPath = this.m_referencedObjectPaths[objectPathId];
            if (objPath) {
                switch (objPath.objectPathInfo.ObjectPathType) {
                    case 1:
                        ret = this.m_globalObjName;
                        break;
                    case 4:
                        ret = Utility._toCamelLowerCase(objPath.objectPathInfo.Name);
                        break;
                    case 3:
                        var methodName = objPath.objectPathInfo.Name;
                        if (methodName.length > 3 && methodName.substr(0, 3) === 'Get') {
                            methodName = methodName.substr(3);
                        }
                        ret = Utility._toCamelLowerCase(methodName);
                        break;
                    case 5:
                        var parentName = this.getObjVarNameBase(objPath.objectPathInfo.ParentObjectPathId);
                        if (parentName.charAt(parentName.length - 1) === 's') {
                            ret = parentName.substr(0, parentName.length - 1);
                        }
                        else {
                            ret = parentName + 'Item';
                        }
                        break;
                }
            }
            return ret;
        };
        RequestPrettyPrinter.prototype.getObjVarName = function (objectPathId) {
            if (this.m_variableNameForObjectPathMap[objectPathId]) {
                return this.m_variableNameForObjectPathMap[objectPathId];
            }
            var ret = this.getObjVarNameBase(objectPathId);
            if (!this.m_variableNameToObjectPathMap[ret]) {
                this.m_variableNameForObjectPathMap[objectPathId] = ret;
                this.m_variableNameToObjectPathMap[ret] = objectPathId;
                return ret;
            }
            var i = 1;
            while (this.m_variableNameToObjectPathMap[ret + i.toString()]) {
                i++;
            }
            ret = ret + i.toString();
            this.m_variableNameForObjectPathMap[objectPathId] = ret;
            this.m_variableNameToObjectPathMap[ret] = objectPathId;
            return ret;
        };
        return RequestPrettyPrinter;
    }());
    var ResourceStrings = (function (_super) {
        __extends(ResourceStrings, _super);
        function ResourceStrings() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        ResourceStrings.cannotRegisterEvent = 'CannotRegisterEvent';
        ResourceStrings.connectionFailureWithStatus = 'ConnectionFailureWithStatus';
        ResourceStrings.connectionFailureWithDetails = 'ConnectionFailureWithDetails';
        ResourceStrings.propertyNotLoaded = 'PropertyNotLoaded';
        ResourceStrings.runMustReturnPromise = 'RunMustReturnPromise';
        ResourceStrings.moreInfoInnerError = 'MoreInfoInnerError';
        ResourceStrings.cannotApplyPropertyThroughSetMethod = 'CannotApplyPropertyThroughSetMethod';
        ResourceStrings.invalidOperationInCellEditMode = 'InvalidOperationInCellEditMode';
        ResourceStrings.objectIsUntracked = 'ObjectIsUntracked';
        ResourceStrings.customFunctionDefintionMissing = 'CustomFunctionDefintionMissing';
        ResourceStrings.customFunctionImplementationMissing = 'CustomFunctionImplementationMissing';
        ResourceStrings.customFunctionNameContainsBadChars = 'CustomFunctionNameContainsBadChars';
        ResourceStrings.customFunctionNameCannotSplit = 'CustomFunctionNameCannotSplit';
        ResourceStrings.customFunctionUnexpectedNumberOfEntriesInResultBatch = 'CustomFunctionUnexpectedNumberOfEntriesInResultBatch';
        ResourceStrings.customFunctionCancellationHandlerMissing = 'CustomFunctionCancellationHandlerMissing';
        ResourceStrings.customFunctionInvalidFunction = 'CustomFunctionInvalidFunction';
        ResourceStrings.customFunctionInvalidFunctionMapping = 'CustomFunctionInvalidFunctionMapping';
        ResourceStrings.customFunctionWindowMissing = 'CustomFunctionWindowMissing';
        ResourceStrings.customFunctionDefintionMissingOnWindow = 'CustomFunctionDefintionMissingOnWindow';
        ResourceStrings.pendingBatchInProgress = 'PendingBatchInProgress';
        ResourceStrings.notInsideBatch = 'NotInsideBatch';
        ResourceStrings.cannotUpdateReadOnlyProperty = 'CannotUpdateReadOnlyProperty';
        return ResourceStrings;
    }(CommonResourceStrings));
    OfficeExtension_1.ResourceStrings = ResourceStrings;
    CoreUtility.addResourceStringValues({
        CannotRegisterEvent: 'The event handler cannot be registered.',
        PropertyNotLoaded: "The property '{0}' is not available. Before reading the property's value, call the load method on the containing object and call \"context.sync()\" on the associated request context.",
        RunMustReturnPromise: 'The batch function passed to the ".run" method didn\'t return a promise. The function must return a promise, so that any automatically-tracked objects can be released at the completion of the batch operation. Typically, you return a promise by returning the response from "context.sync()".',
        InvalidOrTimedOutSessionMessage: 'Your Office Online session has expired or is invalid. To continue, refresh the page.',
        InvalidOperationInCellEditMode: 'Excel is in cell-editing mode. Please exit the edit mode by pressing ENTER or TAB or selecting another cell, and then try again.',
        CustomFunctionDefintionMissing: "A property with the name '{0}' that represents the function's definition must exist on Excel.Script.CustomFunctions.",
        CustomFunctionDefintionMissingOnWindow: "A property with the name '{0}' that represents the function's definition must exist on the window object.",
        CustomFunctionImplementationMissing: "The property with the name '{0}' on Excel.Script.CustomFunctions that represents the function's definition must contain a 'call' property that implements the function.",
        CustomFunctionNameContainsBadChars: 'The function name may only contain letters, digits, underscores, and periods.',
        CustomFunctionNameCannotSplit: 'The function name must contain a non-empty namespace and a non-empty short name.',
        CustomFunctionUnexpectedNumberOfEntriesInResultBatch: "The batching function returned a number of results that doesn't match the number of parameter value sets that were passed into it.",
        CustomFunctionCancellationHandlerMissing: 'The cancellation handler onCanceled is missing in the function. The handler must be present as the function is defined as cancelable.',
        CustomFunctionInvalidFunction: "The property with the name '{0}' that represents the function's definition is not a valid function.",
        CustomFunctionInvalidFunctionMapping: "The property with the name '{0}' on CustomFunctionMappings that represents the function's definition is not a valid function.",
        CustomFunctionWindowMissing: 'The window object was not found.',
        PendingBatchInProgress: 'There is a pending batch in progress. The batch method may not be called inside another batch, or simultaneously with another batch.',
        NotInsideBatch: 'Operations may not be invoked outside of a batch method.',
        CannotUpdateReadOnlyProperty: "The property '{0}' is read-only and it cannot be updated.",
        ObjectIsUntracked: 'The object is untracked.'
    });
    var Utility = (function (_super) {
        __extends(Utility, _super);
        function Utility() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        Utility.fixObjectPathIfNecessary = function (clientObject, value) {
            if (clientObject && clientObject._objectPath && value) {
                clientObject._objectPath.updateUsingObjectData(value, clientObject);
            }
        };
        Utility.load = function (clientObj, option) {
            clientObj.context.load(clientObj, option);
            return clientObj;
        };
        Utility.loadAndSync = function (clientObj, option) {
            clientObj.context.load(clientObj, option);
            return clientObj.context.sync().then(function () { return clientObj; });
        };
        Utility.retrieve = function (clientObj, option) {
            var shouldPolyfill = OfficeExtension_1._internalConfig.alwaysPolyfillClientObjectRetrieveMethod;
            if (!shouldPolyfill) {
                shouldPolyfill = !Utility.isSetSupported('RichApiRuntime', '1.1');
            }
            var result = new RetrieveResultImpl(clientObj, shouldPolyfill);
            clientObj._retrieve(option, result);
            return result;
        };
        Utility.retrieveAndSync = function (clientObj, option) {
            var result = Utility.retrieve(clientObj, option);
            return clientObj.context.sync().then(function () { return result; });
        };
        Utility.toJson = function (clientObj, scalarProperties, navigationProperties, collectionItemsIfAny) {
            var result = {};
            for (var prop in scalarProperties) {
                var value = scalarProperties[prop];
                if (typeof value !== 'undefined') {
                    result[prop] = value;
                }
            }
            for (var prop in navigationProperties) {
                var value = navigationProperties[prop];
                if (typeof value !== 'undefined') {
                    if (value[Utility.fieldName_isCollection] && typeof value[Utility.fieldName_m__items] !== 'undefined') {
                        result[prop] = value.toJSON()['items'];
                    }
                    else {
                        result[prop] = value.toJSON();
                    }
                }
            }
            if (collectionItemsIfAny) {
                result['items'] = collectionItemsIfAny.map(function (item) { return item.toJSON(); });
            }
            return result;
        };
        Utility.throwError = function (resourceId, arg, errorLocation) {
            throw new _Internal.RuntimeError({
                code: resourceId,
                message: CoreUtility._getResourceString(resourceId, arg),
                debugInfo: errorLocation ? { errorLocation: errorLocation } : undefined
            });
        };
        Utility.createRuntimeError = function (code, message, location) {
            return new _Internal.RuntimeError({
                code: code,
                message: message,
                debugInfo: { errorLocation: location }
            });
        };
        Utility.throwIfNotLoaded = function (propertyName, fieldValue, entityName, isNull) {
            if (!isNull &&
                CoreUtility.isUndefined(fieldValue) &&
                propertyName.charCodeAt(0) != Utility.s_underscoreCharCode) {
                throw Utility.createPropertyNotLoadedException(entityName, propertyName);
            }
        };
        Utility.createPropertyNotLoadedException = function (entityName, propertyName) {
            return new _Internal.RuntimeError({
                code: ErrorCodes.propertyNotLoaded,
                message: CoreUtility._getResourceString(ResourceStrings.propertyNotLoaded, propertyName),
                debugInfo: entityName ? { errorLocation: entityName + '.' + propertyName } : undefined
            });
        };
        Utility.createCannotUpdateReadOnlyPropertyException = function (entityName, propertyName) {
            return new _Internal.RuntimeError({
                code: ErrorCodes.cannotUpdateReadOnlyProperty,
                message: CoreUtility._getResourceString(ResourceStrings.cannotUpdateReadOnlyProperty, propertyName),
                debugInfo: entityName ? { errorLocation: entityName + '.' + propertyName } : undefined
            });
        };
        Utility.promisify = function (action) {
            return new OfficeExtension_1.Promise(function (resolve, reject) {
                var callback = function (result) {
                    if (result.status == 'failed') {
                        reject(result.error);
                    }
                    else {
                        resolve(result.value);
                    }
                };
                action(callback);
            });
        };
        Utility._addActionResultHandler = function (clientObj, action, resultHandler) {
            clientObj.context._pendingRequest.addActionResultHandler(action, resultHandler);
        };
        Utility._handleNavigationPropertyResults = function (clientObj, objectValue, propertyNames) {
            for (var i = 0; i < propertyNames.length - 1; i += 2) {
                if (!CoreUtility.isUndefined(objectValue[propertyNames[i + 1]])) {
                    clientObj[propertyNames[i]]._handleResult(objectValue[propertyNames[i + 1]]);
                }
            }
        };
        Utility._fixupApiFlags = function (flags) {
            if (typeof flags === 'boolean') {
                if (flags) {
                    flags = 1;
                }
                else {
                    flags = 0;
                }
            }
            return flags;
        };
        Utility.definePropertyThrowUnloadedException = function (obj, typeName, propertyName) {
            Object.defineProperty(obj, propertyName, {
                configurable: true,
                enumerable: true,
                get: function () {
                    throw Utility.createPropertyNotLoadedException(typeName, propertyName);
                },
                set: function () {
                    throw Utility.createCannotUpdateReadOnlyPropertyException(typeName, propertyName);
                }
            });
        };
        Utility.defineReadOnlyPropertyWithValue = function (obj, propertyName, value) {
            Object.defineProperty(obj, propertyName, {
                configurable: true,
                enumerable: true,
                get: function () {
                    return value;
                },
                set: function () {
                    throw Utility.createCannotUpdateReadOnlyPropertyException(null, propertyName);
                }
            });
        };
        Utility.processRetrieveResult = function (proxy, value, result, childItemCreateFunc) {
            if (CoreUtility.isNullOrUndefined(value)) {
                return;
            }
            if (childItemCreateFunc) {
                var data = value[Constants.itemsLowerCase];
                if (Array.isArray(data)) {
                    var itemsResult = [];
                    for (var i = 0; i < data.length; i++) {
                        var itemProxy = childItemCreateFunc(data[i], i);
                        var itemResult = {};
                        itemResult[Constants.proxy] = itemProxy;
                        itemProxy._handleRetrieveResult(data[i], itemResult);
                        itemsResult.push(itemResult);
                    }
                    Utility.defineReadOnlyPropertyWithValue(result, Constants.itemsLowerCase, itemsResult);
                }
            }
            else {
                var scalarPropertyNames = proxy[Constants.scalarPropertyNames];
                var navigationPropertyNames = proxy[Constants.navigationPropertyNames];
                var typeName = proxy[Constants.className];
                if (scalarPropertyNames) {
                    for (var i = 0; i < scalarPropertyNames.length; i++) {
                        var propName = scalarPropertyNames[i];
                        var propValue = value[propName];
                        if (CoreUtility.isUndefined(propValue)) {
                            Utility.definePropertyThrowUnloadedException(result, typeName, propName);
                        }
                        else {
                            Utility.defineReadOnlyPropertyWithValue(result, propName, propValue);
                        }
                    }
                }
                if (navigationPropertyNames) {
                    for (var i = 0; i < navigationPropertyNames.length; i++) {
                        var propName = navigationPropertyNames[i];
                        var propValue = value[propName];
                        if (CoreUtility.isUndefined(propValue)) {
                            Utility.definePropertyThrowUnloadedException(result, typeName, propName);
                        }
                        else {
                            var propProxy = proxy[propName];
                            var propResult = {};
                            propProxy._handleRetrieveResult(propValue, propResult);
                            propResult[Constants.proxy] = propProxy;
                            if (Array.isArray(propResult[Constants.itemsLowerCase])) {
                                propResult = propResult[Constants.itemsLowerCase];
                            }
                            Utility.defineReadOnlyPropertyWithValue(result, propName, propResult);
                        }
                    }
                }
            }
        };
        Utility.setMockData = function (clientObj, value, childItemCreateFunc, setItemsFunc) {
            if (CoreUtility.isNullOrUndefined(value)) {
                clientObj._handleResult(value);
                return;
            }
            if (clientObj[Constants.scalarPropertyOriginalNames]) {
                var result = {};
                var scalarPropertyOriginalNames = clientObj[Constants.scalarPropertyOriginalNames];
                var scalarPropertyNames = clientObj[Constants.scalarPropertyNames];
                for (var i = 0; i < scalarPropertyNames.length; i++) {
                    if (typeof (value[scalarPropertyNames[i]]) !== 'undefined') {
                        result[scalarPropertyOriginalNames[i]] = value[scalarPropertyNames[i]];
                    }
                }
                clientObj._handleResult(result);
            }
            if (clientObj[Constants.navigationPropertyNames]) {
                var navigationPropertyNames = clientObj[Constants.navigationPropertyNames];
                for (var i = 0; i < navigationPropertyNames.length; i++) {
                    if (typeof (value[navigationPropertyNames[i]]) !== 'undefined') {
                        var navigationPropValue = clientObj[navigationPropertyNames[i]];
                        if (navigationPropValue.setMockData) {
                            navigationPropValue.setMockData(value[navigationPropertyNames[i]]);
                        }
                    }
                }
            }
            if (clientObj[Constants.isCollection] && childItemCreateFunc) {
                var itemsData = Array.isArray(value) ? value : value[Constants.itemsLowerCase];
                if (Array.isArray(itemsData)) {
                    var items = [];
                    for (var i = 0; i < itemsData.length; i++) {
                        var item = childItemCreateFunc(itemsData, i);
                        Utility.setMockData(item, itemsData[i]);
                        items.push(item);
                    }
                    setItemsFunc(items);
                }
            }
        };
        Utility.applyMixin = function (derived, base) {
            Object.getOwnPropertyNames(base.prototype).forEach(function (name) {
                if (name !== 'constructor') {
                    Object.defineProperty(derived.prototype, name, Object.getOwnPropertyDescriptor(base.prototype, name));
                }
            });
        };
        Utility.fieldName_m__items = 'm__items';
        Utility.fieldName_isCollection = '_isCollection';
        Utility._synchronousCleanup = false;
        Utility.s_underscoreCharCode = '_'.charCodeAt(0);
        return Utility;
    }(CommonUtility));
    OfficeExtension_1.Utility = Utility;
    var BatchApiHelper = (function () {
        function BatchApiHelper() {
        }
        BatchApiHelper.invokeMethod = function (obj, methodName, operationType, args, flags, resultProcessType) {
            var action = ActionFactory.createMethodAction(obj.context, obj, methodName, operationType, args, flags);
            var result = new ClientResult(resultProcessType);
            Utility._addActionResultHandler(obj, action, result);
            return result;
        };
        BatchApiHelper.invokeEnsureUnchanged = function (obj, objectState) {
            ActionFactory.createEnsureUnchangedAction(obj.context, obj, objectState);
        };
        BatchApiHelper.invokeSetProperty = function (obj, propName, propValue, flags) {
            ActionFactory.createSetPropertyAction(obj.context, obj, propName, propValue, flags);
        };
        BatchApiHelper.createRootServiceObject = function (type, context) {
            var objectPath = ObjectPathFactory.createGlobalObjectObjectPath(context);
            return new type(context, objectPath);
        };
        BatchApiHelper.createObjectFromReferenceId = function (type, context, referenceId) {
            var objectPath = ObjectPathFactory.createReferenceIdObjectPath(context, referenceId);
            return new type(context, objectPath);
        };
        BatchApiHelper.createTopLevelServiceObject = function (type, context, typeName, isCollection, flags) {
            var objectPath = ObjectPathFactory.createNewObjectObjectPath(context, typeName, isCollection, flags);
            return new type(context, objectPath);
        };
        BatchApiHelper.createPropertyObject = function (type, parent, propertyName, isCollection, flags) {
            var objectPath = ObjectPathFactory.createPropertyObjectPath(parent.context, parent, propertyName, isCollection, false, flags);
            return new type(parent.context, objectPath);
        };
        BatchApiHelper.createIndexerObject = function (type, parent, args) {
            var objectPath = ObjectPathFactory.createIndexerObjectPath(parent.context, parent, args);
            return new type(parent.context, objectPath);
        };
        BatchApiHelper.createMethodObject = function (type, parent, methodName, operationType, args, isCollection, isInvalidAfterRequest, getByIdMethodName, flags) {
            var objectPath = ObjectPathFactory.createMethodObjectPath(parent.context, parent, methodName, operationType, args, isCollection, isInvalidAfterRequest, getByIdMethodName, flags);
            return new type(parent.context, objectPath);
        };
        BatchApiHelper.createChildItemObject = function (type, hasIndexerMethod, parent, chileItem, index) {
            var objectPath = ObjectPathFactory.createChildItemObjectPathUsingIndexerOrGetItemAt(hasIndexerMethod, parent.context, parent, chileItem, index);
            return new type(parent.context, objectPath);
        };
        return BatchApiHelper;
    }());
    OfficeExtension_1.BatchApiHelper = BatchApiHelper;
    var LibraryBuilder = (function () {
        function LibraryBuilder(options) {
            this.m_namespaceMap = {};
            this.m_namespace = options.metadata.name;
            this.m_targetNamespaceObject = options.targetNamespaceObject;
            this.m_namespaceMap[this.m_namespace] = options.targetNamespaceObject;
            if (options.namespaceMap) {
                for (var ns in options.namespaceMap) {
                    this.m_namespaceMap[ns] = options.namespaceMap[ns];
                }
            }
            this.m_defaultApiSetName = options.metadata.defaultApiSetName;
            this.m_hostName = options.metadata.hostName;
            var metadata = options.metadata;
            if (metadata.enumTypes) {
                for (var i = 0; i < metadata.enumTypes.length; i++) {
                    this.buildEnumType(metadata.enumTypes[i]);
                }
            }
            if (metadata.apiSets) {
                for (var i = 0; i < metadata.apiSets.length; i++) {
                    var elem = metadata.apiSets[i];
                    if (Array.isArray(elem)) {
                        metadata.apiSets[i] = {
                            version: elem[0],
                            name: elem[1] || this.m_defaultApiSetName
                        };
                    }
                }
                this.m_apiSets = metadata.apiSets;
            }
            this.m_strings = metadata.strings;
            if (metadata.clientObjectTypes) {
                for (var i = 0; i < metadata.clientObjectTypes.length; i++) {
                    var elem = metadata.clientObjectTypes[i];
                    if (Array.isArray(elem)) {
                        this.ensureArraySize(elem, 11);
                        metadata.clientObjectTypes[i] = {
                            name: this.getString(elem[0]),
                            behaviorFlags: elem[1],
                            collectionPropertyPath: this.getString(elem[6]),
                            newObjectServerTypeFullName: this.getString(elem[9]),
                            newObjectApiFlags: elem[10],
                            childItemTypeFullName: this.getString(elem[7]),
                            scalarProperties: elem[2],
                            navigationProperties: elem[3],
                            scalarMethods: elem[4],
                            navigationMethods: elem[5],
                            events: elem[8],
                        };
                    }
                    this.buildClientObjectType(metadata.clientObjectTypes[i], options.fullyInitialize);
                }
            }
        }
        LibraryBuilder.prototype.ensureArraySize = function (value, size) {
            var count = size - value.length;
            while (count > 0) {
                value.push(0);
                count--;
            }
        };
        LibraryBuilder.prototype.getString = function (ordinalOrValue) {
            if (typeof (ordinalOrValue) === "number") {
                if (ordinalOrValue > 0) {
                    return this.m_strings[ordinalOrValue - 1];
                }
                return null;
            }
            return ordinalOrValue;
        };
        LibraryBuilder.prototype.buildEnumType = function (elem) {
            var enumType;
            if (Array.isArray(elem)) {
                enumType = {
                    name: elem[0],
                    fields: elem[2]
                };
                if (!enumType.fields) {
                    enumType.fields = {};
                }
                var fieldsWithCamelUpperCaseValue = elem[1];
                if (Array.isArray(fieldsWithCamelUpperCaseValue)) {
                    for (var index = 0; index < fieldsWithCamelUpperCaseValue.length; index++) {
                        enumType.fields[fieldsWithCamelUpperCaseValue[index]] = this.toSimpleCamelUpperCase(fieldsWithCamelUpperCaseValue[index]);
                    }
                }
            }
            else {
                enumType = elem;
            }
            this.m_targetNamespaceObject[enumType.name] = enumType.fields;
        };
        LibraryBuilder.prototype.buildClientObjectType = function (typeInfo, fullyInitialize) {
            var thisBuilder = this;
            var type = function (context, objectPath) {
                ClientObject.apply(this, arguments);
                if (!thisBuilder.m_targetNamespaceObject[typeInfo.name]._typeInited) {
                    thisBuilder.buildPrototype(thisBuilder.m_targetNamespaceObject[typeInfo.name], typeInfo);
                    thisBuilder.m_targetNamespaceObject[typeInfo.name]._typeInited = true;
                }
            };
            this.m_targetNamespaceObject[typeInfo.name] = type;
            this.extendsType(type, ClientObject);
            this.buildNewObject(type, typeInfo);
            if ((typeInfo.behaviorFlags & 2) !== 0) {
                type.prototype._KeepReference = function () {
                    BatchApiHelper.invokeMethod(this, "_KeepReference", 1, [], 0, 0);
                };
            }
            if ((typeInfo.behaviorFlags & 32) !== 0) {
                var func = this.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_StaticCustomize");
                func.call(null, type);
            }
            if (fullyInitialize) {
                this.buildPrototype(type, typeInfo);
                type._typeInited = true;
            }
        };
        LibraryBuilder.prototype.extendsType = function (d, b) {
            function __() { this.constructor = d; }
            d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
        };
        LibraryBuilder.prototype.findObjectUnderPath = function (top, paths, pathStartIndex) {
            var obj = top;
            for (var i = pathStartIndex; i < paths.length; i++) {
                if (typeof (obj) !== 'object') {
                    throw new OfficeExtension_1.Error("Cannot find " + paths.join("."));
                }
                obj = obj[paths[i]];
            }
            return obj;
        };
        LibraryBuilder.prototype.getFunction = function (fullName) {
            var ret = this.resolveObjectByFullName(fullName);
            if (typeof (ret) !== 'function') {
                throw new OfficeExtension_1.Error("Cannot find function or type: " + fullName);
            }
            return ret;
        };
        LibraryBuilder.prototype.resolveObjectByFullName = function (fullName) {
            var parts = fullName.split('.');
            if (parts.length === 1) {
                return this.m_targetNamespaceObject[parts[0]];
            }
            var rootName = parts[0];
            if (rootName === this.m_namespace) {
                return this.findObjectUnderPath(this.m_targetNamespaceObject, parts, 1);
            }
            if (this.m_namespaceMap[rootName]) {
                return this.findObjectUnderPath(this.m_namespaceMap[rootName], parts, 1);
            }
            return this.findObjectUnderPath(this.m_targetNamespaceObject, parts, 0);
        };
        LibraryBuilder.prototype.evaluateExpression = function (expression, thisObj) {
            if (Utility.isNullOrUndefined(expression)) {
                return null;
            }
            var result = new Function('return ' + expression).call(thisObj);
            return result;
        };
        LibraryBuilder.prototype.evaluateEventTargetId = function (targetIdExpression, thisObj) {
            if (Utility.isNullOrEmptyString(targetIdExpression)) {
                return '';
            }
            return this.evaluateExpression(targetIdExpression, thisObj);
        };
        LibraryBuilder.prototype.isAllDigits = function (expression) {
            var charZero = '0'.charCodeAt(0);
            var charNine = '9'.charCodeAt(0);
            for (var i = 0; i < expression.length; i++) {
                if (expression.charCodeAt(i) < charZero ||
                    expression.charCodeAt(i) > charNine) {
                    return false;
                }
            }
            return true;
        };
        LibraryBuilder.prototype.evaluateEventType = function (eventTypeExpression) {
            if (Utility.isNullOrEmptyString(eventTypeExpression)) {
                return 0;
            }
            if (this.isAllDigits(eventTypeExpression)) {
                return parseInt(eventTypeExpression);
            }
            var ret = this.resolveObjectByFullName(eventTypeExpression);
            if (typeof (ret) !== 'number') {
                throw new OfficeExtension_1.Error("Invalid event type: " + eventTypeExpression);
            }
            return ret;
        };
        LibraryBuilder.prototype.buildPrototype = function (type, typeInfo) {
            this.buildScalarProperties(type, typeInfo);
            this.buildNavigationProperties(type, typeInfo);
            this.buildScalarMethods(type, typeInfo);
            this.buildNavigationMethods(type, typeInfo);
            this.buildEvents(type, typeInfo);
            this.buildHandleResult(type, typeInfo);
            this.buildHandleIdResult(type, typeInfo);
            this.buildHandleRetrieveResult(type, typeInfo);
            this.buildLoad(type, typeInfo);
            this.buildRetrieve(type, typeInfo);
            this.buildSetMockData(type, typeInfo);
            this.buildEnsureUnchanged(type, typeInfo);
            this.buildUpdate(type, typeInfo);
            this.buildSet(type, typeInfo);
            this.buildToJSON(type, typeInfo);
            this.buildItems(type, typeInfo);
            this.buildTypeMetadataInfo(type, typeInfo);
            this.buildTrackUntrack(type, typeInfo);
            this.buildMixin(type, typeInfo);
        };
        LibraryBuilder.prototype.toSimpleCamelUpperCase = function (name) {
            return name.substr(0, 1).toUpperCase() + name.substr(1);
        };
        LibraryBuilder.prototype.ensureOriginalName = function (member) {
            if (member.originalName === null) {
                member.originalName = this.toSimpleCamelUpperCase(member.name);
            }
        };
        LibraryBuilder.prototype.getFieldName = function (member) {
            return "m_" + member.name;
        };
        LibraryBuilder.prototype.throwIfApiNotSupported = function (typeInfo, member) {
            if (this.m_apiSets && member.apiSetInfoOrdinal > 0) {
                var apiSetInfo = this.m_apiSets[member.apiSetInfoOrdinal - 1];
                if (apiSetInfo) {
                    Utility.throwIfApiNotSupported(typeInfo.name + "." + member.name, apiSetInfo.name, apiSetInfo.version, this.m_hostName);
                }
            }
        };
        LibraryBuilder.prototype.buildScalarProperties = function (type, typeInfo) {
            if (Array.isArray(typeInfo.scalarProperties)) {
                for (var i = 0; i < typeInfo.scalarProperties.length; i++) {
                    var elem = typeInfo.scalarProperties[i];
                    if (Array.isArray(elem)) {
                        this.ensureArraySize(elem, 5);
                        typeInfo.scalarProperties[i] = {
                            name: this.getString(elem[0]),
                            behaviorFlags: elem[1],
                            apiSetInfoOrdinal: elem[2],
                            originalName: this.getString(elem[3]),
                            setMethodApiFlags: elem[4]
                        };
                    }
                    this.buildScalarProperty(type, typeInfo, typeInfo.scalarProperties[i]);
                }
            }
        };
        LibraryBuilder.prototype.buildScalarProperty = function (type, typeInfo, propInfo) {
            this.ensureOriginalName(propInfo);
            var thisBuilder = this;
            var fieldName = this.getFieldName(propInfo);
            var descriptor = {
                get: function () {
                    Utility.throwIfNotLoaded(propInfo.name, this[fieldName], typeInfo.name, this._isNull);
                    thisBuilder.throwIfApiNotSupported(typeInfo, propInfo);
                    return this[fieldName];
                },
                enumerable: true,
                configurable: true
            };
            if ((propInfo.behaviorFlags & 2) === 0) {
                descriptor.set = function (value) {
                    if (propInfo.behaviorFlags & 4) {
                        var customizationFunc = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_" + propInfo.originalName + "_Set");
                        var handled = customizationFunc.call(this, this, value).handled;
                        if (handled) {
                            return;
                        }
                    }
                    this[fieldName] = value;
                    BatchApiHelper.invokeSetProperty(this, propInfo.originalName, value, propInfo.setMethodApiFlags);
                };
            }
            Object.defineProperty(type.prototype, propInfo.name, descriptor);
        };
        LibraryBuilder.prototype.buildNavigationProperties = function (type, typeInfo) {
            if (Array.isArray(typeInfo.navigationProperties)) {
                for (var i = 0; i < typeInfo.navigationProperties.length; i++) {
                    var elem = typeInfo.navigationProperties[i];
                    if (Array.isArray(elem)) {
                        this.ensureArraySize(elem, 7);
                        typeInfo.navigationProperties[i] = {
                            name: this.getString(elem[0]),
                            behaviorFlags: elem[2],
                            apiSetInfoOrdinal: elem[3],
                            originalName: this.getString(elem[4]),
                            getMethodApiFlags: elem[5],
                            setMethodApiFlags: elem[6],
                            propertyTypeFullName: this.getString(elem[1])
                        };
                    }
                    this.buildNavigationProperty(type, typeInfo, typeInfo.navigationProperties[i]);
                }
            }
        };
        LibraryBuilder.prototype.buildNavigationProperty = function (type, typeInfo, propInfo) {
            this.ensureOriginalName(propInfo);
            var thisBuilder = this;
            var fieldName = this.getFieldName(propInfo);
            var descriptor = {
                get: function () {
                    if (!this[thisBuilder.getFieldName(propInfo)]) {
                        thisBuilder.throwIfApiNotSupported(typeInfo, propInfo);
                        this[fieldName] = BatchApiHelper.createPropertyObject(thisBuilder.getFunction(propInfo.propertyTypeFullName), this, propInfo.originalName, (propInfo.behaviorFlags & 16) !== 0, propInfo.getMethodApiFlags);
                    }
                    if (propInfo.behaviorFlags & 64) {
                        var customizationFunc = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_" + propInfo.originalName + "_Get");
                        customizationFunc.call(this, this, this[fieldName]);
                    }
                    return this[fieldName];
                },
                enumerable: true,
                configurable: true
            };
            if ((propInfo.behaviorFlags & 2) === 0) {
                descriptor.set = function (value) {
                    if (propInfo.behaviorFlags & 4) {
                        var customizationFunc = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_" + propInfo.originalName + "_Set");
                        var handled = customizationFunc.call(this, this, value).handled;
                        if (handled) {
                            return;
                        }
                    }
                    this[fieldName] = value;
                    BatchApiHelper.invokeSetProperty(this, propInfo.originalName, value, propInfo.setMethodApiFlags);
                };
            }
            Object.defineProperty(type.prototype, propInfo.name, descriptor);
        };
        LibraryBuilder.prototype.buildScalarMethods = function (type, typeInfo) {
            if (Array.isArray(typeInfo.scalarMethods)) {
                for (var i = 0; i < typeInfo.scalarMethods.length; i++) {
                    var elem = typeInfo.scalarMethods[i];
                    if (Array.isArray(elem)) {
                        this.ensureArraySize(elem, 6);
                        typeInfo.scalarMethods[i] = {
                            name: this.getString(elem[0]),
                            behaviorFlags: elem[2],
                            apiSetInfoOrdinal: elem[3],
                            originalName: this.getString(elem[5]),
                            apiFlags: elem[4],
                            parameterCount: elem[1]
                        };
                    }
                    this.buildScalarMethod(type, typeInfo, typeInfo.scalarMethods[i]);
                }
            }
        };
        LibraryBuilder.prototype.buildScalarMethod = function (type, typeInfo, methodInfo) {
            this.ensureOriginalName(methodInfo);
            var thisBuilder = this;
            type.prototype[methodInfo.name] = function () {
                var args = [];
                if ((methodInfo.behaviorFlags & 64) && methodInfo.parameterCount > 0) {
                    for (var i = 0; i < methodInfo.parameterCount - 1; i++) {
                        args.push(arguments[i]);
                    }
                    var rest = [];
                    for (var i = methodInfo.parameterCount - 1; i < arguments.length; i++) {
                        rest.push(arguments[i]);
                    }
                    args.push(rest);
                }
                else {
                    for (var i = 0; i < arguments.length; i++) {
                        args.push(arguments[i]);
                    }
                }
                if (methodInfo.behaviorFlags & 1) {
                    var customizationFunc = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_" + methodInfo.originalName);
                    var applyArgs = [this];
                    for (var i = 0; i < args.length; i++) {
                        applyArgs.push(args[i]);
                    }
                    var _a = customizationFunc.apply(this, applyArgs), handled = _a.handled, result = _a.result;
                    if (handled) {
                        return result;
                    }
                }
                thisBuilder.throwIfApiNotSupported(typeInfo, methodInfo);
                var resultProcessType = 0;
                if (methodInfo.behaviorFlags & 32) {
                    resultProcessType = 1;
                }
                var operationType = 0;
                if (methodInfo.behaviorFlags & 2) {
                    operationType = 1;
                }
                return BatchApiHelper.invokeMethod(this, methodInfo.originalName, operationType, args, methodInfo.apiFlags, resultProcessType);
            };
        };
        LibraryBuilder.prototype.buildNavigationMethods = function (type, typeInfo) {
            if (Array.isArray(typeInfo.navigationMethods)) {
                for (var i = 0; i < typeInfo.navigationMethods.length; i++) {
                    var elem = typeInfo.navigationMethods[i];
                    if (Array.isArray(elem)) {
                        this.ensureArraySize(elem, 8);
                        typeInfo.navigationMethods[i] = {
                            name: this.getString(elem[0]),
                            behaviorFlags: elem[3],
                            apiSetInfoOrdinal: elem[4],
                            originalName: this.getString(elem[6]),
                            apiFlags: elem[5],
                            parameterCount: elem[2],
                            returnTypeFullName: this.getString(elem[1]),
                            returnObjectGetByIdMethodName: this.getString(elem[7])
                        };
                    }
                    this.buildNavigationMethod(type, typeInfo, typeInfo.navigationMethods[i]);
                }
            }
        };
        LibraryBuilder.prototype.buildNavigationMethod = function (type, typeInfo, methodInfo) {
            this.ensureOriginalName(methodInfo);
            var thisBuilder = this;
            type.prototype[methodInfo.name] = function () {
                var args = [];
                if ((methodInfo.behaviorFlags & 64) && methodInfo.parameterCount > 0) {
                    for (var i = 0; i < methodInfo.parameterCount - 1; i++) {
                        args.push(arguments[i]);
                    }
                    var rest = [];
                    for (var i = methodInfo.parameterCount - 1; i < arguments.length; i++) {
                        rest.push(arguments[i]);
                    }
                    args.push(rest);
                }
                else {
                    for (var i = 0; i < arguments.length; i++) {
                        args.push(arguments[i]);
                    }
                }
                if (methodInfo.behaviorFlags & 1) {
                    var customizationFunc = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_" + methodInfo.originalName);
                    var applyArgs = [this];
                    for (var i = 0; i < args.length; i++) {
                        applyArgs.push(args[i]);
                    }
                    var _a = customizationFunc.apply(this, applyArgs), handled = _a.handled, result = _a.result;
                    if (handled) {
                        return result;
                    }
                }
                thisBuilder.throwIfApiNotSupported(typeInfo, methodInfo);
                if ((methodInfo.behaviorFlags & 16) !== 0) {
                    return BatchApiHelper.createIndexerObject(thisBuilder.getFunction(methodInfo.returnTypeFullName), this, args);
                }
                else {
                    var operationType = 0;
                    if (methodInfo.behaviorFlags & 2) {
                        operationType = 1;
                    }
                    return BatchApiHelper.createMethodObject(thisBuilder.getFunction(methodInfo.returnTypeFullName), this, methodInfo.originalName, operationType, args, (methodInfo.behaviorFlags & 4) !== 0, (methodInfo.behaviorFlags & 8) !== 0, methodInfo.returnObjectGetByIdMethodName, methodInfo.apiFlags);
                }
            };
        };
        LibraryBuilder.prototype.buildHandleResult = function (type, typeInfo) {
            var thisBuilder = this;
            type.prototype._handleResult = function (value) {
                ClientObject.prototype._handleResult.call(this, value);
                if (Utility.isNullOrUndefined(value)) {
                    return;
                }
                Utility.fixObjectPathIfNecessary(this, value);
                if (typeInfo.behaviorFlags & 8) {
                    var customizationFunc = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_HandleResult");
                    customizationFunc.call(this, this, value);
                }
                if (typeInfo.scalarProperties) {
                    for (var i_3 = 0; i_3 < typeInfo.scalarProperties.length; i_3++) {
                        if (!Utility.isUndefined(value[typeInfo.scalarProperties[i_3].originalName])) {
                            if ((typeInfo.scalarProperties[i_3].behaviorFlags & 8) !== 0) {
                                this[thisBuilder.getFieldName(typeInfo.scalarProperties[i_3])] = Utility.adjustToDateTime(value[typeInfo.scalarProperties[i_3].originalName]);
                            }
                            else {
                                this[thisBuilder.getFieldName(typeInfo.scalarProperties[i_3])] = value[typeInfo.scalarProperties[i_3].originalName];
                            }
                        }
                    }
                }
                if (typeInfo.navigationProperties) {
                    var propNames = [];
                    for (var i_4 = 0; i_4 < typeInfo.navigationProperties.length; i_4++) {
                        propNames.push(typeInfo.navigationProperties[i_4].name);
                        propNames.push(typeInfo.navigationProperties[i_4].originalName);
                    }
                    Utility._handleNavigationPropertyResults(this, value, propNames);
                }
                if ((typeInfo.behaviorFlags & 1) !== 0) {
                    var hasIndexerMethod = thisBuilder.hasIndexMethod(typeInfo);
                    if (!Utility.isNullOrUndefined(value[Constants.items])) {
                        this.m__items = [];
                        var _data = value[Constants.items];
                        var childItemType = thisBuilder.getFunction(typeInfo.childItemTypeFullName);
                        for (var i = 0; i < _data.length; i++) {
                            var _item = BatchApiHelper.createChildItemObject(childItemType, hasIndexerMethod, this, _data[i], i);
                            _item._handleResult(_data[i]);
                            this.m__items.push(_item);
                        }
                    }
                }
            };
        };
        LibraryBuilder.prototype.buildHandleRetrieveResult = function (type, typeInfo) {
            var thisBuilder = this;
            type.prototype._handleRetrieveResult = function (value, result) {
                ClientObject.prototype._handleRetrieveResult.call(this, value, result);
                if (Utility.isNullOrUndefined(value)) {
                    return;
                }
                if (typeInfo.scalarProperties) {
                    for (var i = 0; i < typeInfo.scalarProperties.length; i++) {
                        if (typeInfo.scalarProperties[i].behaviorFlags & 8) {
                            if (!Utility.isNullOrUndefined(value[typeInfo.scalarProperties[i].name])) {
                                value[typeInfo.scalarProperties[i].name] = Utility.adjustToDateTime(value[typeInfo.scalarProperties[i].name]);
                            }
                        }
                    }
                }
                if (typeInfo.behaviorFlags & 1) {
                    var hasIndexerMethod_1 = thisBuilder.hasIndexMethod(typeInfo);
                    var childItemType_1 = thisBuilder.getFunction(typeInfo.childItemTypeFullName);
                    var thisObj_1 = this;
                    Utility.processRetrieveResult(thisObj_1, value, result, function (childItemData, index) { return BatchApiHelper.createChildItemObject(childItemType_1, hasIndexerMethod_1, thisObj_1, childItemData, index); });
                }
                else {
                    Utility.processRetrieveResult(this, value, result);
                }
            };
        };
        LibraryBuilder.prototype.buildHandleIdResult = function (type, typeInfo) {
            var thisBuilder = this;
            type.prototype._handleIdResult = function (value) {
                ClientObject.prototype._handleIdResult.call(this, value);
                if (Utility.isNullOrUndefined(value)) {
                    return;
                }
                if (typeInfo.behaviorFlags & 16) {
                    var customizationFunc = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_HandleIdResult");
                    customizationFunc.call(this, this, value);
                }
                if (typeInfo.scalarProperties) {
                    for (var i = 0; i < typeInfo.scalarProperties.length; i++) {
                        var propName = typeInfo.scalarProperties[i].originalName;
                        if (propName === "Id" || propName === "_Id" || propName === "_ReferenceId") {
                            if (!Utility.isNullOrUndefined(value[typeInfo.scalarProperties[i].originalName])) {
                                this[thisBuilder.getFieldName(typeInfo.scalarProperties[i])] = value[typeInfo.scalarProperties[i].originalName];
                            }
                        }
                    }
                }
            };
        };
        LibraryBuilder.prototype.buildLoad = function (type, typeInfo) {
            type.prototype.load = function (options) {
                return Utility.load(this, options);
            };
        };
        LibraryBuilder.prototype.buildRetrieve = function (type, typeInfo) {
            type.prototype.retrieve = function (options) {
                return Utility.retrieve(this, options);
            };
        };
        LibraryBuilder.prototype.buildNewObject = function (type, typeInfo) {
            if (!Utility.isNullOrEmptyString(typeInfo.newObjectServerTypeFullName)) {
                type.newObject = function (context) {
                    return BatchApiHelper.createTopLevelServiceObject(type, context, typeInfo.newObjectServerTypeFullName, (typeInfo.behaviorFlags & 1) !== 0, typeInfo.newObjectApiFlags);
                };
            }
        };
        LibraryBuilder.prototype.buildSetMockData = function (type, typeInfo) {
            var thisBuilder = this;
            if (typeInfo.behaviorFlags & 1) {
                var hasIndexMethod_1 = thisBuilder.hasIndexMethod(typeInfo);
                type.prototype.setMockData = function (data) {
                    var thisObj = this;
                    Utility.setMockData(thisObj, data, function (childItemData, index) {
                        return BatchApiHelper.createChildItemObject(thisBuilder.getFunction(typeInfo.childItemTypeFullName), hasIndexMethod_1, thisObj, childItemData, index);
                    }, function (items) {
                        thisObj.m__items = items;
                    });
                };
            }
            else {
                type.prototype.setMockData = function (data) {
                    Utility.setMockData(this, data);
                };
            }
        };
        LibraryBuilder.prototype.buildEnsureUnchanged = function (type, typeInfo) {
            type.prototype.ensureUnchanged = function (data) {
                BatchApiHelper.invokeEnsureUnchanged(this, data);
            };
        };
        LibraryBuilder.prototype.buildUpdate = function (type, typeInfo) {
            type.prototype.update = function (properties) {
                this._recursivelyUpdate(properties);
            };
        };
        LibraryBuilder.prototype.buildSet = function (type, typeInfo) {
            if ((typeInfo.behaviorFlags & 1) !== 0) {
                return;
            }
            var notAllowedToBeSetPropertyNames = [];
            var allowedScalarPropertyNames = [];
            if (typeInfo.scalarProperties) {
                for (var i = 0; i < typeInfo.scalarProperties.length; i++) {
                    if ((typeInfo.scalarProperties[i].behaviorFlags & 2) === 0 &&
                        (typeInfo.scalarProperties[i].behaviorFlags & 1) !== 0) {
                        allowedScalarPropertyNames.push(typeInfo.scalarProperties[i].name);
                    }
                    else {
                        notAllowedToBeSetPropertyNames.push(typeInfo.scalarProperties[i].name);
                    }
                }
            }
            var allowedNavigationPropertyNames = [];
            if (typeInfo.navigationProperties) {
                for (var i = 0; i < typeInfo.navigationProperties.length; i++) {
                    if ((typeInfo.navigationProperties[i].behaviorFlags & 16) !== 0) {
                        notAllowedToBeSetPropertyNames.push(typeInfo.navigationProperties[i].name);
                    }
                    else if ((typeInfo.navigationProperties[i].behaviorFlags & 1) === 0) {
                        notAllowedToBeSetPropertyNames.push(typeInfo.navigationProperties[i].name);
                    }
                    else if ((typeInfo.navigationProperties[i].behaviorFlags & 32) === 0) {
                        notAllowedToBeSetPropertyNames.push(typeInfo.navigationProperties[i].name);
                    }
                    else {
                        allowedNavigationPropertyNames.push(typeInfo.navigationProperties[i].name);
                    }
                }
            }
            if (allowedNavigationPropertyNames.length === 0 && allowedScalarPropertyNames.length === 0) {
                return;
            }
            type.prototype.set = function (properties, options) {
                this._recursivelySet(properties, options, allowedScalarPropertyNames, allowedNavigationPropertyNames, notAllowedToBeSetPropertyNames);
            };
        };
        LibraryBuilder.prototype.buildItems = function (type, typeInfo) {
            if ((typeInfo.behaviorFlags & 1) === 0) {
                return;
            }
            Object.defineProperty(type.prototype, "items", {
                get: function () {
                    Utility.throwIfNotLoaded("items", this.m__items, typeInfo.name, this._isNull);
                    return this.m__items;
                },
                enumerable: true,
                configurable: true
            });
        };
        LibraryBuilder.prototype.buildToJSON = function (type, typeInfo) {
            var thisBuilder = this;
            if ((typeInfo.behaviorFlags & 1) !== 0) {
                type.prototype.toJSON = function () {
                    return Utility.toJson(this, {}, {}, this.m__items);
                };
                return;
            }
            else {
                type.prototype.toJSON = function () {
                    var scalarProperties = {};
                    if (typeInfo.scalarProperties) {
                        for (var i = 0; i < typeInfo.scalarProperties.length; i++) {
                            if ((typeInfo.scalarProperties[i].behaviorFlags & 1) !== 0) {
                                scalarProperties[typeInfo.scalarProperties[i].name] = this[thisBuilder.getFieldName(typeInfo.scalarProperties[i])];
                            }
                        }
                    }
                    var navProperties = {};
                    if (typeInfo.navigationProperties) {
                        for (var i = 0; i < typeInfo.navigationProperties.length; i++) {
                            if ((typeInfo.navigationProperties[i].behaviorFlags & 1) !== 0) {
                                navProperties[typeInfo.navigationProperties[i].name] = this[thisBuilder.getFieldName(typeInfo.navigationProperties[i])];
                            }
                        }
                    }
                    return Utility.toJson(this, scalarProperties, navProperties);
                };
            }
        };
        LibraryBuilder.prototype.buildTypeMetadataInfo = function (type, typeInfo) {
            Object.defineProperty(type.prototype, "_className", {
                get: function () {
                    return typeInfo.name;
                },
                enumerable: true,
                configurable: true
            });
            Object.defineProperty(type.prototype, "_isCollection", {
                get: function () {
                    return (typeInfo.behaviorFlags & 1) !== 0;
                },
                enumerable: true,
                configurable: true
            });
            if (!Utility.isNullOrEmptyString(typeInfo.collectionPropertyPath)) {
                Object.defineProperty(type.prototype, "_collectionPropertyPath", {
                    get: function () {
                        return typeInfo.collectionPropertyPath;
                    },
                    enumerable: true,
                    configurable: true
                });
            }
            if (typeInfo.scalarProperties && typeInfo.scalarProperties.length > 0) {
                Object.defineProperty(type.prototype, "_scalarPropertyNames", {
                    get: function () {
                        if (!this.m__scalarPropertyNames) {
                            this.m__scalarPropertyNames = typeInfo.scalarProperties.map(function (p) { return p.name; });
                        }
                        return this.m__scalarPropertyNames;
                    },
                    enumerable: true,
                    configurable: true
                });
                Object.defineProperty(type.prototype, "_scalarPropertyOriginalNames", {
                    get: function () {
                        if (!this.m__scalarPropertyOriginalNames) {
                            this.m__scalarPropertyOriginalNames = typeInfo.scalarProperties.map(function (p) { return p.originalName; });
                        }
                        return this.m__scalarPropertyOriginalNames;
                    },
                    enumerable: true,
                    configurable: true
                });
                Object.defineProperty(type.prototype, "_scalarPropertyUpdateable", {
                    get: function () {
                        if (!this.m__scalarPropertyUpdateable) {
                            this.m__scalarPropertyUpdateable = typeInfo.scalarProperties.map(function (p) { return (p.behaviorFlags & 2) === 0; });
                        }
                        return this.m__scalarPropertyUpdateable;
                    },
                    enumerable: true,
                    configurable: true
                });
            }
            if (typeInfo.navigationProperties && typeInfo.navigationProperties.length > 0) {
                Object.defineProperty(type.prototype, "_navigationPropertyNames", {
                    get: function () {
                        if (!this.m__navigationPropertyNames) {
                            this.m__navigationPropertyNames = typeInfo.navigationProperties.map(function (p) { return p.name; });
                        }
                        return this.m__navigationPropertyNames;
                    },
                    enumerable: true,
                    configurable: true
                });
            }
        };
        LibraryBuilder.prototype.buildTrackUntrack = function (type, typeInfo) {
            if (typeInfo.behaviorFlags & 2) {
                type.prototype.track = function () {
                    this.context.trackedObjects.add(this);
                    return this;
                };
                type.prototype.untrack = function () {
                    this.context.trackedObjects.remove(this);
                    return this;
                };
            }
        };
        LibraryBuilder.prototype.buildMixin = function (type, typeInfo) {
            if (typeInfo.behaviorFlags & 4) {
                var mixinType = this.getFunction(typeInfo.name + 'Custom');
                Utility.applyMixin(type, mixinType);
            }
        };
        LibraryBuilder.prototype.getOnEventName = function (name) {
            if (name[0] === '_') {
                return '_on' + name.substr(1);
            }
            return 'on' + name;
        };
        LibraryBuilder.prototype.buildEvents = function (type, typeInfo) {
            if (typeInfo.events) {
                for (var i = 0; i < typeInfo.events.length; i++) {
                    var elem = typeInfo.events[i];
                    if (Array.isArray(elem)) {
                        this.ensureArraySize(elem, 7);
                        typeInfo.events[i] = {
                            name: this.getString(elem[0]),
                            behaviorFlags: elem[1],
                            apiSetInfoOrdinal: elem[2],
                            typeExpression: this.getString(elem[3]),
                            targetIdExpression: this.getString(elem[4]),
                            register: this.getString(elem[5]),
                            unregister: this.getString(elem[6])
                        };
                    }
                    this.buildEvent(type, typeInfo, typeInfo.events[i]);
                }
            }
        };
        LibraryBuilder.prototype.buildEvent = function (type, typeInfo, evt) {
            if (evt.behaviorFlags & 1) {
                this.buildV0Event(type, typeInfo, evt);
            }
            else {
                this.buildV2Event(type, typeInfo, evt);
            }
        };
        LibraryBuilder.prototype.buildV2Event = function (type, typeInfo, evt) {
            var thisBuilder = this;
            var eventName = this.getOnEventName(evt.name);
            var fieldName = this.getFieldName(evt);
            Object.defineProperty(type.prototype, eventName, {
                get: function () {
                    if (!this[fieldName]) {
                        thisBuilder.throwIfApiNotSupported(typeInfo, evt);
                        var thisObj = this;
                        var registerFunc = null;
                        if (evt.register !== 'null') {
                            registerFunc = this[evt.register].bind(this);
                        }
                        var unregisterFunc = null;
                        if (evt.unregister !== 'null') {
                            unregisterFunc = this[evt.unregister].bind(this);
                        }
                        var getTargetIdFunc = function () {
                            return thisBuilder.evaluateEventTargetId(evt.targetIdExpression, thisObj);
                        };
                        var func = null;
                        if (evt.behaviorFlags & 2) {
                            func = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_" + evt.name + "_EventArgsTransform");
                        }
                        var eventArgsTransformFunc = function (value) {
                            if (func) {
                                value = func.call(thisObj, thisObj, value);
                            }
                            return Utility._createPromiseFromResult(value);
                        };
                        var eventType = thisBuilder.evaluateEventType(evt.typeExpression);
                        this[fieldName] = new GenericEventHandlers(this.context, this, evt.name, {
                            eventType: eventType,
                            getTargetIdFunc: getTargetIdFunc,
                            registerFunc: registerFunc,
                            unregisterFunc: unregisterFunc,
                            eventArgsTransformFunc: eventArgsTransformFunc
                        });
                    }
                    return this[fieldName];
                },
                enumerable: true,
                configurable: true
            });
        };
        LibraryBuilder.prototype.buildV0Event = function (type, typeInfo, evt) {
            var thisBuilder = this;
            var eventName = this.getOnEventName(evt.name);
            var fieldName = this.getFieldName(evt);
            Object.defineProperty(type.prototype, eventName, {
                get: function () {
                    if (!this[fieldName]) {
                        thisBuilder.throwIfApiNotSupported(typeInfo, evt);
                        var thisObj = this;
                        var registerFunc = null;
                        if (Utility.isNullOrEmptyString(evt.register)) {
                            var eventType_1 = thisBuilder.evaluateEventType(evt.typeExpression);
                            registerFunc =
                                function (handlerCallback) {
                                    var targetId = thisBuilder.evaluateEventTargetId(evt.targetIdExpression, thisObj);
                                    return thisObj.context.eventRegistration.register(eventType_1, targetId, handlerCallback);
                                };
                        }
                        else if (evt.register !== 'null') {
                            var func_1 = thisBuilder.getFunction(evt.register);
                            registerFunc =
                                function (handlerCallback) {
                                    return func_1.call(thisObj, thisObj, handlerCallback);
                                };
                        }
                        var unregisterFunc = null;
                        if (Utility.isNullOrEmptyString(evt.unregister)) {
                            var eventType_2 = thisBuilder.evaluateEventType(evt.typeExpression);
                            unregisterFunc =
                                function (handlerCallback) {
                                    var targetId = thisBuilder.evaluateEventTargetId(evt.targetIdExpression, thisObj);
                                    return thisObj.context.eventRegistration.unregister(eventType_2, targetId, handlerCallback);
                                };
                        }
                        else if (evt.unregister !== 'null') {
                            var func_2 = thisBuilder.getFunction(evt.unregister);
                            unregisterFunc =
                                function (handlerCallback) {
                                    return func_2.call(thisObj, thisObj, handlerCallback);
                                };
                        }
                        var func = null;
                        if (evt.behaviorFlags & 2) {
                            func = thisBuilder.getFunction(LibraryBuilder.CustomizationCodeNamespace + "." + typeInfo.name + "_" + evt.name + "_EventArgsTransform");
                        }
                        var eventArgsTransformFunc = function (value) {
                            if (func) {
                                value = func.call(thisObj, thisObj, value);
                            }
                            return Utility._createPromiseFromResult(value);
                        };
                        this[fieldName] = new EventHandlers(this.context, this, evt.name, {
                            registerFunc: registerFunc,
                            unregisterFunc: unregisterFunc,
                            eventArgsTransformFunc: eventArgsTransformFunc
                        });
                    }
                    return this[fieldName];
                },
                enumerable: true,
                configurable: true
            });
        };
        LibraryBuilder.prototype.hasIndexMethod = function (typeInfo) {
            var ret = false;
            if (typeInfo.navigationMethods) {
                for (var i = 0; i < typeInfo.navigationMethods.length; i++) {
                    if ((typeInfo.navigationMethods[i].behaviorFlags & 16) !== 0) {
                        ret = true;
                        break;
                    }
                }
            }
            return ret;
        };
        LibraryBuilder.CustomizationCodeNamespace = "_CC";
        return LibraryBuilder;
    }());
    OfficeExtension_1.LibraryBuilder = LibraryBuilder;
    var versionToken = 1;
    var internalConfiguration = {
        invokeRequestModifier: function (request) {
            request.DdaMethod.Version = versionToken;
            return request;
        },
        invokeResponseModifier: function (args) {
            versionToken = args.Version;
            if (args.Error) {
                args.error = {};
                args.error.Code = args.Error;
            }
            return args;
        }
    };
    var CommunicationConstants;
    (function (CommunicationConstants) {
        CommunicationConstants["SendingId"] = "sId";
        CommunicationConstants["RespondingId"] = "rId";
        CommunicationConstants["CommandKey"] = "command";
        CommunicationConstants["SessionInfoKey"] = "sessionInfo";
        CommunicationConstants["ParamsKey"] = "params";
        CommunicationConstants["ApiReadyCommand"] = "apiready";
        CommunicationConstants["ExecuteMethodCommand"] = "executeMethod";
        CommunicationConstants["GetAppContextCommand"] = "getAppContext";
        CommunicationConstants["RegisterEventCommand"] = "registerEvent";
        CommunicationConstants["UnregisterEventCommand"] = "unregisterEvent";
        CommunicationConstants["FireEventCommand"] = "fireEvent";
    })(CommunicationConstants || (CommunicationConstants = {}));
    var EmbeddedConstants = (function () {
        function EmbeddedConstants() {
        }
        EmbeddedConstants.sessionContext = 'sc';
        EmbeddedConstants.embeddingPageOrigin = 'EmbeddingPageOrigin';
        EmbeddedConstants.embeddingPageSessionInfo = 'EmbeddingPageSessionInfo';
        return EmbeddedConstants;
    }());
    OfficeExtension_1.EmbeddedConstants = EmbeddedConstants;
    var EmbeddedSession = (function (_super) {
        __extends(EmbeddedSession, _super);
        function EmbeddedSession(url, options) {
            var _this = _super.call(this) || this;
            _this.m_chosenWindow = null;
            _this.m_chosenOrigin = null;
            _this.m_enabled = true;
            _this.m_onMessageHandler = _this._onMessage.bind(_this);
            _this.m_callbackList = {};
            _this.m_id = 0;
            _this.m_timeoutId = -1;
            _this.m_appContext = null;
            _this.m_url = url;
            _this.m_options = options;
            if (!_this.m_options) {
                _this.m_options = { sessionKey: Math.random().toString() };
            }
            if (!_this.m_options.sessionKey) {
                _this.m_options.sessionKey = Math.random().toString();
            }
            if (!_this.m_options.container) {
                _this.m_options.container = document.body;
            }
            if (!_this.m_options.timeoutInMilliseconds) {
                _this.m_options.timeoutInMilliseconds = 60000;
            }
            if (!_this.m_options.height) {
                _this.m_options.height = '400px';
            }
            if (!_this.m_options.width) {
                _this.m_options.width = '100%';
            }
            if (!(_this.m_options.webApplication &&
                _this.m_options.webApplication.accessToken &&
                _this.m_options.webApplication.accessTokenTtl)) {
                _this.m_options.webApplication = null;
            }
            return _this;
        }
        EmbeddedSession.prototype._getIFrameSrc = function () {
            var origin = window.location.protocol + '//' + window.location.host;
            var toAppend = EmbeddedConstants.embeddingPageOrigin +
                '=' +
                encodeURIComponent(origin) +
                '&' +
                EmbeddedConstants.embeddingPageSessionInfo +
                '=' +
                encodeURIComponent(this.m_options.sessionKey);
            var useHash = false;
            if (this.m_url.toLowerCase().indexOf('/_layouts/preauth.aspx') > 0 ||
                this.m_url.toLowerCase().indexOf('/_layouts/15/preauth.aspx') > 0) {
                useHash = true;
            }
            var a = document.createElement('a');
            a.href = this.m_url;
            if (this.m_options.webApplication) {
                var toAppendWAC = EmbeddedConstants.embeddingPageOrigin +
                    '=' +
                    origin +
                    '&' +
                    EmbeddedConstants.embeddingPageSessionInfo +
                    '=' +
                    this.m_options.sessionKey;
                if (a.search.length === 0 || a.search === '?') {
                    a.search = '?' + EmbeddedConstants.sessionContext + '=' + encodeURIComponent(toAppendWAC);
                }
                else {
                    a.search = a.search + '&' + EmbeddedConstants.sessionContext + '=' + encodeURIComponent(toAppendWAC);
                }
            }
            else if (useHash) {
                if (a.hash.length === 0 || a.hash === '#') {
                    a.hash = '#' + toAppend;
                }
                else {
                    a.hash = a.hash + '&' + toAppend;
                }
            }
            else {
                if (a.search.length === 0 || a.search === '?') {
                    a.search = '?' + toAppend;
                }
                else {
                    a.search = a.search + '&' + toAppend;
                }
            }
            var iframeSrc = a.href;
            return iframeSrc;
        };
        EmbeddedSession.prototype.init = function () {
            var _this = this;
            window.addEventListener('message', this.m_onMessageHandler);
            var iframeSrc = this._getIFrameSrc();
            return CoreUtility.createPromise(function (resolve, reject) {
                var iframeElement = document.createElement('iframe');
                if (_this.m_options.id) {
                    iframeElement.id = _this.m_options.id;
                    iframeElement.name = _this.m_options.id;
                }
                iframeElement.style.height = _this.m_options.height;
                iframeElement.style.width = _this.m_options.width;
                if (!_this.m_options.webApplication) {
                    iframeElement.src = iframeSrc;
                    _this.m_options.container.appendChild(iframeElement);
                }
                else {
                    var webApplicationForm = document.createElement('form');
                    webApplicationForm.setAttribute('action', iframeSrc);
                    webApplicationForm.setAttribute('method', 'post');
                    webApplicationForm.setAttribute('target', iframeElement.name);
                    _this.m_options.container.appendChild(webApplicationForm);
                    var token_input = document.createElement('input');
                    token_input.setAttribute('type', 'hidden');
                    token_input.setAttribute('name', 'access_token');
                    token_input.setAttribute('value', _this.m_options.webApplication.accessToken);
                    webApplicationForm.appendChild(token_input);
                    var token_ttl_input = document.createElement('input');
                    token_ttl_input.setAttribute('type', 'hidden');
                    token_ttl_input.setAttribute('name', 'access_token_ttl');
                    token_ttl_input.setAttribute('value', _this.m_options.webApplication.accessTokenTtl);
                    webApplicationForm.appendChild(token_ttl_input);
                    _this.m_options.container.appendChild(iframeElement);
                    webApplicationForm.submit();
                }
                _this.m_timeoutId = window.setTimeout(function () {
                    _this.close();
                    var err = Utility.createRuntimeError(CoreErrorCodes.timeout, CoreUtility._getResourceString(CoreResourceStrings.timeout), 'EmbeddedSession.init');
                    reject(err);
                }, _this.m_options.timeoutInMilliseconds);
                _this.m_promiseResolver = resolve;
            });
        };
        EmbeddedSession.prototype._invoke = function (method, callback, params) {
            if (!this.m_enabled) {
                callback(5001, null);
                return;
            }
            if (internalConfiguration.invokeRequestModifier) {
                params = internalConfiguration.invokeRequestModifier(params);
            }
            this._sendMessageWithCallback(this.m_id++, method, params, function (args) {
                if (internalConfiguration.invokeResponseModifier) {
                    args = internalConfiguration.invokeResponseModifier(args);
                }
                var errorCode = args['Error'];
                delete args['Error'];
                callback(errorCode || 0, args);
            });
        };
        EmbeddedSession.prototype.close = function () {
            window.removeEventListener('message', this.m_onMessageHandler);
            window.clearTimeout(this.m_timeoutId);
            this.m_enabled = false;
        };
        Object.defineProperty(EmbeddedSession.prototype, "eventRegistration", {
            get: function () {
                if (!this.m_sessionEventManager) {
                    this.m_sessionEventManager = new EventRegistration(this._registerEventImpl.bind(this), this._unregisterEventImpl.bind(this));
                }
                return this.m_sessionEventManager;
            },
            enumerable: true,
            configurable: true
        });
        EmbeddedSession.prototype._createRequestExecutorOrNull = function () {
            return new EmbeddedRequestExecutor(this);
        };
        EmbeddedSession.prototype._resolveRequestUrlAndHeaderInfo = function () {
            return CoreUtility._createPromiseFromResult(null);
        };
        EmbeddedSession.prototype._registerEventImpl = function (eventId, targetId) {
            var _this = this;
            return CoreUtility.createPromise(function (resolve, reject) {
                _this._sendMessageWithCallback(_this.m_id++, CommunicationConstants.RegisterEventCommand, { EventId: eventId, TargetId: targetId }, function () {
                    resolve(null);
                });
            });
        };
        EmbeddedSession.prototype._unregisterEventImpl = function (eventId, targetId) {
            var _this = this;
            return CoreUtility.createPromise(function (resolve, reject) {
                _this._sendMessageWithCallback(_this.m_id++, CommunicationConstants.UnregisterEventCommand, { EventId: eventId, TargetId: targetId }, function () {
                    resolve();
                });
            });
        };
        EmbeddedSession.prototype._onMessage = function (event) {
            var _this = this;
            if (!this.m_enabled) {
                return;
            }
            if (this.m_chosenWindow && (this.m_chosenWindow !== event.source || this.m_chosenOrigin !== event.origin)) {
                return;
            }
            var eventData = event.data;
            if (eventData && eventData[CommunicationConstants.CommandKey] === CommunicationConstants.ApiReadyCommand) {
                if (!this.m_chosenWindow &&
                    this._isValidDescendant(event.source) &&
                    eventData[CommunicationConstants.SessionInfoKey] === this.m_options.sessionKey) {
                    this.m_chosenWindow = event.source;
                    this.m_chosenOrigin = event.origin;
                    this._sendMessageWithCallback(this.m_id++, CommunicationConstants.GetAppContextCommand, null, function (appContext) {
                        _this._setupContext(appContext);
                        window.clearTimeout(_this.m_timeoutId);
                        _this.m_promiseResolver();
                    });
                }
                return;
            }
            if (eventData && eventData[CommunicationConstants.CommandKey] === CommunicationConstants.FireEventCommand) {
                var msg = eventData[CommunicationConstants.ParamsKey];
                var eventId = msg['EventId'];
                var targetId = msg['TargetId'];
                var data = msg['Data'];
                if (this.m_sessionEventManager) {
                    var handlers = this.m_sessionEventManager.getHandlers(eventId, targetId);
                    for (var i = 0; i < handlers.length; i++) {
                        handlers[i](data);
                    }
                }
                return;
            }
            if (eventData && eventData.hasOwnProperty(CommunicationConstants.RespondingId)) {
                var rId = eventData[CommunicationConstants.RespondingId];
                var callback = this.m_callbackList[rId];
                if (typeof callback === 'function') {
                    callback(eventData[CommunicationConstants.ParamsKey]);
                }
                delete this.m_callbackList[rId];
            }
        };
        EmbeddedSession.prototype._sendMessageWithCallback = function (id, command, data, callback) {
            this.m_callbackList[id] = callback;
            var message = {};
            message[CommunicationConstants.SendingId] = id;
            message[CommunicationConstants.CommandKey] = command;
            message[CommunicationConstants.ParamsKey] = data;
            this.m_chosenWindow.postMessage(JSON.stringify(message), this.m_chosenOrigin);
        };
        EmbeddedSession.prototype._isValidDescendant = function (wnd) {
            var container = this.m_options.container || document.body;
            function doesFrameWindow(containerWindow) {
                if (containerWindow === wnd) {
                    return true;
                }
                for (var i = 0, len = containerWindow.frames.length; i < len; i++) {
                    if (doesFrameWindow(containerWindow.frames[i])) {
                        return true;
                    }
                }
                return false;
            }
            var iframes = container.getElementsByTagName('iframe');
            for (var i = 0, len = iframes.length; i < len; i++) {
                if (doesFrameWindow(iframes[i].contentWindow)) {
                    return true;
                }
            }
            return false;
        };
        EmbeddedSession.prototype._setupContext = function (appContext) {
            if (!(this.m_appContext = appContext)) {
                return;
            }
        };
        return EmbeddedSession;
    }(SessionBase));
    OfficeExtension_1.EmbeddedSession = EmbeddedSession;
    var EmbeddedRequestExecutor = (function () {
        function EmbeddedRequestExecutor(session) {
            this.m_session = session;
        }
        EmbeddedRequestExecutor.prototype.executeAsync = function (customData, requestFlags, requestMessage) {
            var _this = this;
            var messageSafearray = RichApiMessageUtility.buildMessageArrayForIRequestExecutor(customData, requestFlags, requestMessage, EmbeddedRequestExecutor.SourceLibHeaderValue);
            return CoreUtility.createPromise(function (resolve, reject) {
                _this.m_session._invoke(CommunicationConstants.ExecuteMethodCommand, function (status, result) {
                    CoreUtility.log('Response:');
                    CoreUtility.log(JSON.stringify(result));
                    var response;
                    if (status == 0) {
                        response = RichApiMessageUtility.buildResponseOnSuccess(RichApiMessageUtility.getResponseBodyFromSafeArray(result.Data), RichApiMessageUtility.getResponseHeadersFromSafeArray(result.Data));
                    }
                    else {
                        response = RichApiMessageUtility.buildResponseOnError(result.error.Code, result.error.Message);
                    }
                    resolve(response);
                }, EmbeddedRequestExecutor._transformMessageArrayIntoParams(messageSafearray));
            });
        };
        EmbeddedRequestExecutor._transformMessageArrayIntoParams = function (msgArray) {
            return {
                ArrayData: msgArray,
                DdaMethod: {
                    DispatchId: EmbeddedRequestExecutor.DispidExecuteRichApiRequestMethod
                }
            };
        };
        EmbeddedRequestExecutor.DispidExecuteRichApiRequestMethod = 93;
        EmbeddedRequestExecutor.SourceLibHeaderValue = 'Embedded';
        return EmbeddedRequestExecutor;
    }());
})(OfficeExtension || (OfficeExtension = {}));
