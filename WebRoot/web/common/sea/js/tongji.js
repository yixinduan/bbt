/**
 * Created by 小银龙 on 14-2-22.
 */
! function(a) {
    function f(a) {
        for (var c, d, e, b = a, f = 0; f < b.length; f++) c = document.createElement("script"), c.type = "text/javascript", c.charset = "utf-8", c.defer = "defer", c.async = !0, c.id = "js-cnzz-" + (b[f].match(/id=\d+/g)[0].replace(/\D+/, "") || 0), c.src = b[f] + "&async=1", e = +new Date + Math.floor(100 * Math.random()), d = document.createElement("div"), d.id = e, d.style.display = "none", document.getElementsByTagName("body")[0].appendChild(d), document.getElementById(e).appendChild(c)
    }
    var b = [],
        c = "undefined" != typeof page_user_login,
        d = c && ("true" === page_user_login.toString().toLowerCase() || page_user_login),
        e = {
            "233_uc_login": "http://s22.cnzz.com/stat.php?id=3583776&web_id=3583776",
            "233_uc": "http://s94.cnzz.com/stat.php?id=4109769&web_id=4109769"
        };
    "undefined" != typeof page_tongJi_url && ("string" == typeof page_tongJi_url && b.push(page_tongJi_url), "object" == typeof page_tongJi_url && page_tongJi_url instanceof Array && (b = b.concat(page_tongJi_url))), c && (d ? b.push(e["233_uc_login"]) : b.push(e["233_uc"])), f(b), a.asyncTongJi = f
}(window);