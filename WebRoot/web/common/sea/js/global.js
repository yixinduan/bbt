/**
 * Created by 小银龙 on 14-2-22.
 */

/**
 * 版本控制
 */
(function () {
    var JS_version = '20140226001';
    if (typeof KISSY === 'object') {
        KISSY.use('cookie', function (S, Cookie) {
            if (Cookie.get('JS_version') !== JS_version) {
                Cookie.set('JS_version', JS_version, 365, '', '/')
            }
        })
    }
})()

/**
 * 基于window.onerror的收集前端错误信息
 */
;
(function (win) {
    if (win.addEventListener) {
        win.addEventListener("error", bufferFx, true);
    } else if (win.attachEvent) {
        win.attachEvent("onerror", bufferFx);
    }
    function bufferFx(msg, url, line) {
        var arg = arguments[0];
        if (typeof KISSY === 'object') {
            if (arg.target.tagName !== 'SCRIPT') {
                KISSY.use('cache', function (S, Cache) {
                    var content = '前端Javascript错误自动提交{错误信息:' + arg.message + ',错误行号:' + arg.lineno + '}';
                    Cache.post(content);
                })
            }
        }
    }
})(window);
//END