import {x as e} from "./index.446d454d.js";
import {u as t} from "./useWindowSizeFn.d8bc0d08.js";
import {j as i, r as n, u as o} from "./vendor.4c4242b5.js";

const r = Symbol();
const a = n(0), s = n(0);

function u() {
    return {
        headerHeightRef: a, footerHeightRef: s, setHeaderHeight: function (e) {
            a.value = e
        }, setFooterHeight: function (e) {
            s.value = e
        }
    }
}

function c() {
    const u = n(window.innerHeight), c = n(window.innerHeight), h = i((() => o(u) - o(a) - o(s) || 0));
    t((() => {
        u.value = window.innerHeight
    }), 100, {immediate: !0}), e({
        contentHeight: h, setPageHeight: function (e) {
            return t = this, n = null, i = function* () {
                c.value = e
            }, new Promise(((e, o) => {
                var r = e => {
                    try {
                        s(i.next(e))
                    } catch (t) {
                        o(t)
                    }
                }, a = e => {
                    try {
                        s(i.throw(e))
                    } catch (t) {
                        o(t)
                    }
                }, s = t => t.done ? e(t.value) : Promise.resolve(t.value).then(r, a);
                s((i = i.apply(t, n)).next())
            }));
            var t, n, i
        }, pageHeight: c
    }, r, {native: !0})
}

export {u as a, c as u};
