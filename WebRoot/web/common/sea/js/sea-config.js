! function() {
    var e = {
        alias: {
            jquery: "jquery/jquery/1.11.0/jquery"
        },

        vars: {},
        map: [
            [/^(.*\.(?:css|js))(.*)$/i, "$1?v=1" + core.timestamp]
        ],
        preload: [Function.prototype.bind ? "" : "es5-safe", this.JSON ? "" : "json"],
        debug: !1,
      
        charset: "utf-8",
        comboExcludes: function(e) {
            if (-1 === e.indexOf("img2.233.com")) return !0
        }
    };
    "object" == typeof seajs && (seajs.config(e), seajs.on("request", function(e) {
        var a = e.requestUri;
        a.indexOf("??") > 0 && (e.requestUri = a.replace(/\?([\w=]+)?[^,],/gi, ","))
    }))
}();