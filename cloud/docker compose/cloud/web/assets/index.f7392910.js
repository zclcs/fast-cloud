import {a0 as e, a1 as m, a4 as r, ab as d, B as a, D as s, j as o, u as t} from "./vendor.4c4242b5.js";
import n from "./LockPage.514e48dc.js";
import {u} from "./lock.dfd9ac6c.js";
import "./index.446d454d.js";
import "./header.d801b988.js";

var i = a({
    setup(a) {
        const i = u(), c = o((() => {
            var a, o;
            return null != (o = null == (a = null == i ? void 0 : i.getLockInfo) ? void 0 : a.isLock) && o
        }));
        return (a, o) => (s(), e(m, {
            name: "fade-bottom",
            mode: "out-in"
        }, {default: r((() => [t(c) ? (s(), e(n, {key: 0})) : d("", !0)])), _: 1}))
    }
});
export {i as default};
