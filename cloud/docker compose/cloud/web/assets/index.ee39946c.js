import {
    $ as d,
    a as s,
    A as l,
    a0 as c,
    a4 as f,
    ab as F,
    aT as e,
    B as o,
    b0 as t,
    D as u,
    j as n,
    J as p,
    K as m,
    L as C,
    r as a,
    u as r,
    w as _,
    z as i
} from "./vendor.4c4242b5.js";
import {D as h, G as v, S as w} from "./siteSetting.c485f07c.js";
import {a as g, e as b, o as R, O as L} from "./index.446d454d.js";
import {a as y} from "./useContentViewHeight.cec819c9.js";
import "./useWindowSizeFn.d8bc0d08.js";

var S = o({
    name: "LayoutFooter", components: {Footer: e.Footer, GithubFilled: t}, setup() {
        const {t: o} = b(), {getShowFooter: e} = L(), {currentRoute: t} = s(), {prefixCls: i} = g("layout-footer"),
            l = a(null), {setFooterHeight: d} = y();
        return {
            getShowLayoutFooter: n((() => {
                var o, s;
                if (r(e)) {
                    const e = null == (o = r(l)) ? void 0 : o.$el;
                    d((null == e ? void 0 : e.offsetHeight) || 0)
                } else d(0);
                return r(e) && !(null == (s = r(t).meta) ? void 0 : s.hiddenFooter)
            })), prefixCls: i, t: o, DOC_URL: h, GITHUB_URL: v, SITE_URL: w, openWindow: R, footerRef: l
        }
    }
});
i("data-v-62583d60");
const U = p("div", null, "Copyright ©2020 Vben Admin", -1);
l(), S.render = function (o, e, t, s, a, n) {
    const r = d("GithubFilled"), i = d("Footer");
    return o.getShowLayoutFooter ? (u(), c(i, {
        key: 0,
        class: C(o.prefixCls),
        ref: "footerRef"
    }, {
        default: f((() => [p("div", {class: C(`${o.prefixCls}__links`)}, [p("a", {onClick: e[0] || (e[0] = e => o.openWindow(o.SITE_URL))}, m(o.t("layout.footer.onlinePreview")), 1), _(r, {
            onClick: e[1] || (e[1] = e => o.openWindow(o.GITHUB_URL)),
            class: C(`${o.prefixCls}__github`)
        }, null, 8, ["class"]), p("a", {onClick: e[2] || (e[2] = e => o.openWindow(o.DOC_URL))}, m(o.t("layout.footer.onlineDocument")), 1)], 2), U])),
        _: 1
    }, 8, ["class"])) : F("", !0)
}, S.__scopeId = "data-v-62583d60";
export {S as default};
