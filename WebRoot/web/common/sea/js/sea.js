! function(a, b) {
    function e(a) {
        return function(b) {
            return {}.toString.call(b) == "[object " + a + "]";
        }
    }

    function k() {
        return j++
    }

    function r(a) {
        return a.match(n)[0]
    }

    function s(a) {
        for (a = a.replace(o, "/"); a.match(p);) a = a.replace(p, "/");
        return a = a.replace(q, "$1/")
    }

    function t(a) {
        var b = a.length - 1,
            c = a.charAt(b);
        return "#" === c ? a.substring(0, b) : ".js" === a.substring(b - 2) || a.indexOf("?") > 0 || ".css" === a.substring(b - 3) || "/" === c ? a : a + ".js"
    }

    function w(a) {
        var b = d.alias;
        return b && g(b[a]) ? b[a] : a
    }

    function x(a) {
        var c, b = d.paths;
        return b && (c = a.match(u)) && g(b[c[1]]) && (a = b[c[1]] + c[2]), a
    }

    function y(a) {
        var b = d.vars;
        return b && a.indexOf("{") > -1 && (a = a.replace(v, function(a, c) {
            return g(b[c]) ? b[c] : a
        })), a
    }

    function z(a) {
        var b = d.map,
            c = a;
        if (b) {
            for (var e = [], f = [], g = 0, h = b.length; h > g; g++) f.push(b[g][1].split("v=")[1]);
            e[0] = b[0][0], e[1] = "$1?v=" + f.join(""), b = [e]
        }
        if (b)
            for (var g = 0, h = b.length; h > g; g++) {
                var j = b[g];
                c = i(j) ? j(a) || a : a.replace(j[0], j[1])
            }
        return c
    }

    function C(a, b) {
        var c, e = a.charAt(0);
        if (A.test(a)) c = a;
        else if ("." === e) c = s((b ? r(b) : d.cwd) + a);
        else if ("/" === e) {
            var f = d.cwd.match(B);
            c = f ? f[0] + a.substring(1) : a
        } else c = d.base + a;
        return 0 === c.indexOf("//") && (c = location.protocol + c), c
    }

    function D(a, b) {
        if (!a) return "";
        a = w(a), a = x(a), a = y(a), a = t(a);
        var c = C(a, b);
        return c = z(c)
    }

    function J(a) {
        return a.hasAttribute ? a.src : a.getAttribute("src", 4)
    }

    function Q(a, b, c) {
        var d = M.test(a),
            e = E.createElement(d ? "link" : "script");
        if (c) {
            var f = i(c) ? c(a) : c;
            f && (e.charset = f)
        }
        R(e, b, d, a), d ? (e.rel = "stylesheet", e.href = a) : (e.async = !0, e.src = a), N = e, L ? K.insertBefore(e, L) : K.appendChild(e), N = null
    }

    function R(a, b, c, e) {
        function g() {
            a.onload = a.onerror = a.onreadystatechange = null, c || d.debug || K.removeChild(a), a = null, b()
        }
        var f = "onload" in a;
        return !c || !P && f ? void(f ? (a.onload = g, a.onerror = function() {
            m("error", {
                uri: e,
                node: a
            }), g()
        }) : a.onreadystatechange = function() {
            /loaded|complete/.test(a.readyState) && g()
        }) : void setTimeout(function() {
            S(a, b)
        }, 1)
    }

    function S(a, b) {
        var d, c = a.sheet;
        if (P) c && (d = !0);
        else if (c) try {
            c.cssRules && (d = !0)
        } catch (e) {
            "NS_ERROR_DOM_SECURITY_ERR" === e.name && (d = !0)
        }
        setTimeout(function() {
            d ? b() : S(a, b)
        }, 20)
    }

    function T() {
        if (N) return N;
        if (O && "interactive" === O.readyState) return O;
        for (var a = K.getElementsByTagName("script"), b = a.length - 1; b >= 0; b--) {
            var c = a[b];
            if ("interactive" === c.readyState) return O = c
        }
    }

    function W(a) {
        var b = [];
        return a.replace(V, "").replace(U, function(a, c, d) {
            d && b.push(d)
        }), b
    }

    function ba(a, b) {
        this.uri = a, this.dependencies = b || [], this.exports = null, this.status = 0, this._waitings = {}, this._remain = 0
    }
    if (!a.seajs) {
        var c = a.seajs = {
                version: "2.2.1"
            },
            d = c.data = {},
            f = e("Object"),
            g = e("String"),
            h = Array.isArray || e("Array"),
            i = e("Function"),
            j = 0,
            l = d.events = {};
        c.on = function(a, b) {
            var d = l[a] || (l[a] = []);
            return d.push(b), c
        }, c.off = function(a, b) {
            if (!a && !b) return l = d.events = {}, c;
            var e = l[a];
            if (e)
                if (b)
                    for (var f = e.length - 1; f >= 0; f--) e[f] === b && e.splice(f, 1);
                else delete l[a];
            return c
        };
        var m = c.emit = function(a, b) {
                var e, d = l[a];
                if (d)
                    for (d = d.slice(); e = d.shift();) e(b);
                return c
            },
            n = /[^?#]*\//,
            o = /\/\.\//g,
            p = /\/[^/]+\/\.\.\//,
            q = /([^:/])\/\//g,
            u = /^([^/:]+)(\/.+)$/,
            v = /{([^{]+)}/g,
            A = /^\/\/.|:\//,
            B = /^.*?\/\/.*?\//,
            E = document,
            F = r(E.URL),
            G = E.scripts,
            H = E.getElementById("seajsnode") || G[G.length - 1],
            I = r(J(H) || F);
        c.resolve = D;
        var N, O, K = E.head || E.getElementsByTagName("head")[0] || E.documentElement,
            L = K.getElementsByTagName("base")[0],
            M = /\.css(?:\?|$)/i,
            P = +navigator.userAgent.replace(/.*(?:AppleWebKit|AndroidWebKit)\/(\d+).*/, "$1") < 536;
        c.request = Q;
        var Y, U = /"(?:\\"|[^"])*"|'(?:\\'|[^'])*'|\/\*[\S\s]*?\*\/|\/(?:\\\/|[^\/\r\n])+\/(?=[^\/])|\/\/.*|\.\s*require|(?:^|[^$])\brequire\s*\(\s*(["'])(.+?)\1\s*\)/g,
            V = /\\\\/g,
            X = c.cache = {},
            Z = {},
            $ = {},
            _ = {},
            aa = ba.STATUS = {
                FETCHING: 1,
                SAVED: 2,
                LOADING: 3,
                LOADED: 4,
                EXECUTING: 5,
                EXECUTED: 6
            };
        ba.prototype.resolve = function() {
            for (var a = this, b = a.dependencies, c = [], d = 0, e = b.length; e > d; d++) c[d] = ba.resolve(b[d], a.uri);
            return c
        }, ba.prototype.load = function() {
            var a = this;
            if (!(a.status >= aa.LOADING)) {
                a.status = aa.LOADING;
                var b = a.resolve();
                m("load", b);
                for (var d, c = a._remain = b.length, e = 0; c > e; e++) d = ba.get(b[e]), d.status < aa.LOADED ? d._waitings[a.uri] = (d._waitings[a.uri] || 0) + 1 : a._remain--;
                if (0 === a._remain) return void a.onload();
                var f = {};
                for (e = 0; c > e; e++) d = X[b[e]], d.status < aa.FETCHING ? d.fetch(f) : d.status === aa.SAVED && d.load();
                for (var g in f) f.hasOwnProperty(g) && f[g]()
            }
        }, ba.prototype.onload = function() {
            var a = this;
            a.status = aa.LOADED, a.callback && a.callback();
            var c, d, b = a._waitings;
            for (c in b) b.hasOwnProperty(c) && (d = X[c], d._remain -= b[c], 0 === d._remain && d.onload());
            delete a._waitings, delete a._remain
        }, ba.prototype.fetch = function(a) {
            function h() {
                c.request(f.requestUri, f.onRequest, f.charset)
            }

            function i() {
                delete Z[g], $[g] = !0, Y && (ba.save(e, Y), Y = null);
                var a, b = _[g];
                for (delete _[g]; a = b.shift();) a.load()
            }
            var b = this,
                e = b.uri;
            b.status = aa.FETCHING;
            var f = {
                uri: e
            };
            m("fetch", f);
            var g = f.requestUri || e;
            return !g || $[g] ? void b.load() : Z[g] ? void _[g].push(b) : (Z[g] = !0, _[g] = [b], m("request", f = {
                uri: e,
                requestUri: g,
                onRequest: i,
                charset: d.charset
            }), void(f.requested || (a ? a[f.requestUri] = h : h())))
        }, ba.prototype.exec = function() {
            function d(a) {
                return ba.get(d.resolve(a)).exec()
            }
            var a = this;
            if (a.status >= aa.EXECUTING) return a.exports;
            a.status = aa.EXECUTING;
            var c = a.uri;
            d.resolve = function(a) {
                return ba.resolve(a, c)
            }, d.async = function(a, b) {
                return ba.use(a, b, c + "_async_" + k()), d
            };
            var e = a.factory,
                f = i(e) ? e(d, a.exports = {}, a) : e;
            return f === b && (f = a.exports), delete a.factory, a.exports = f, a.status = aa.EXECUTED, m("exec", a), f
        }, ba.resolve = function(a, b) {
            var d = {
                id: a,
                refUri: b
            };
            return m("resolve", d), d.uri || c.resolve(d.id, b)
        }, ba.define = function(a, c, d) {
            var e = arguments.length;
            1 === e ? (d = a, a = b) : 2 === e && (d = c, h(a) ? (c = a, a = b) : c = b), !h(c) && i(d) && (c = W(d.toString()));
            var f = {
                id: a,
                uri: ba.resolve(a),
                deps: c,
                factory: d
            };
            if (!f.uri && E.attachEvent) {
                var g = T();
                g && (f.uri = g.src)
            }
            m("define", f), f.uri ? ba.save(f.uri, f) : Y = f
        }, ba.save = function(a, b) {
            var c = ba.get(a);
            c.status < aa.SAVED && (c.id = b.id || a, c.dependencies = b.deps || [], c.factory = b.factory, c.status = aa.SAVED)
        }, ba.get = function(a, b) {
            return X[a] || (X[a] = new ba(a, b))
        }, ba.use = function(b, c, d) {
            var e = ba.get(d, h(b) ? b : [b]);
            e.callback = function() {
                for (var b = [], d = e.resolve(), f = 0, g = d.length; g > f; f++) b[f] = X[d[f]].exec();
                c && c.apply(a, b), delete e.callback
            }, e.load()
        }, ba.preload = function(a) {
            var b = d.preload,
                c = b.length;
            c ? ba.use(b, function() {
                b.splice(0, c), ba.preload(a)
            }, d.cwd + "_preload_" + k()) : a()
        }, c.use = function(a, b) {
            return ba.preload(function() {
                ba.use(a, b, d.cwd + "_use_" + k())
            }), c
        }, ba.define.cmd = {}, a.define = ba.define, c.Module = ba, d.fetchedList = $, d.cid = k, c.require = function(a) {
            var b = ba.get(ba.resolve(a));
            return b.status < aa.EXECUTING && (b.onload(), b.exec()), b.exports
        };
        var ca = /^(.+?\/)(\?\?)?(seajs\/)+/;
        d.base = (I.match(ca) || ["", I])[1], d.dir = I, d.cwd = F, d.charset = "utf-8", d.preload = function() {
            var a = [],
                b = location.search.replace(/(seajs-\w+)(&|$)/g, "$1=1$2");
            return b += " " + E.cookie, b.replace(/(seajs-\w+)=1/g, function(b, c) {
                a.push(c)
            }), a
        }(), c.config = function(a) {
            for (var b in a) {
                var e = a[b],
                    g = d[b];
                if (g && f(g))
                    for (var i in e) g[i] = e[i];
                else h(g) ? e = g.concat(e) : "base" === b && ("/" !== e.slice(-1) && (e += "/"), e = C(e)), d[b] = e
            }
            return m("config", a), c;
        }
    }
}(this);