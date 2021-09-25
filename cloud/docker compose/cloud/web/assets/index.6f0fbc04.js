import {a as o, aP as s, F as e, O as t, X as i} from "./index.446d454d.js";
import {
    $ as u,
    a0 as c,
    a9 as l,
    ab as f,
    B as r,
    c5 as a,
    D as d,
    F as m,
    j as n,
    L as j,
    u as p,
    w as g
} from "./vendor.4c4242b5.js";
import {c as x, u as T} from "./index.7bf0a616.js";
import _ from "./SessionTimeoutLogin.24ea1f03.js";
import "./index.85d7f834.js";
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./useSortable.8f01f022.js";
import "./lock.dfd9ac6c.js";
import "./Login.vue_vue&type=style&index=0&lang.77076394.js";
import "./LoginForm.vue_vue&type=script&setup=true&lang.d3d22a72.js"; /* empty css              */
import "./uuid.5e4d726a.js";
import "./LoginFormTitle.vue_vue&type=script&setup=true&lang.ae413af1.js";
import "./ForgetPasswordForm.vue_vue&type=script&setup=true&lang.2d60f51e.js";
import "./index.d48332d7.js";
import "./RegisterForm.vue_vue&type=script&setup=true&lang.6a252fee.js";
import "./index.4400f2f0.js";
import "./MobileForm.vue_vue&type=script&setup=true&lang.cac54566.js";
import "./QrCodeForm.vue_vue&type=script&setup=true&lang.06cd7e13.js";
import "./download.b1d83379.js";/* empty css              *//* empty css              *//* empty css              *//* empty css              */
var v = r({
    name: "LayoutFeatures",
    components: {
        BackTop: a,
        LayoutLockPage: x((() => e((() => import("./index.f7392910.js")), ["assets/index.f7392910.js", "assets/vendor.4c4242b5.js", "assets/vendor.4762b10c.css", "assets/LockPage.514e48dc.js", "assets/LockPage.88e4425b.css", "assets/index.446d454d.js", "assets/index.c94109dd.css", "assets/lock.dfd9ac6c.js", "assets/header.d801b988.js"]))),
        SettingDrawer: x((() => e((() => import("./index.136c8bf3.js").then((function (e) {
            return e.i
        }))), ["assets/index.136c8bf3.js", "assets/index.35b5cf30.css", "assets/index.d55bbd60.js", "assets/index.5c7227e9.css", "assets/index.1bb9cac4.css", "assets/index.446d454d.js", "assets/index.c94109dd.css", "assets/vendor.4c4242b5.js", "assets/vendor.4762b10c.css", "assets/index.7bf0a616.js", "assets/index.78cadd6e.css", "assets/index.9f1c8d57.css", "assets/index.85d7f834.js", "assets/index.55076fdd.css", "assets/useWindowSizeFn.d8bc0d08.js", "assets/useContentViewHeight.cec819c9.js", "assets/useSortable.8f01f022.js", "assets/lock.dfd9ac6c.js"]))),
        SessionTimeoutLogin: _
    },
    setup() {
        const {getUseOpenBackTop: e, getShowSettingButton: r, getSettingButtonPosition: a, getFullContent: u} = t(),
            d = s(), {prefixCls: m} = o("setting-drawer-fearure"), {getShowHeader: g} = T(),
            c = n((() => d.getSessionTimeout));
        return {
            getTarget: () => document.body, getUseOpenBackTop: e, getIsFixedSettingDrawer: n((() => {
                if (!p(r)) return !1;
                const e = p(a);
                return e === i.AUTO ? !p(g) || p(u) : e === i.FIXED
            })), prefixCls: m, getIsSessionTimeout: c
        }
    }
});
v.render = function (e, t, s, o, i, r) {
    const a = u("LayoutLockPage"), n = u("BackTop"), p = u("SettingDrawer"), x = u("SessionTimeoutLogin");
    return d(), m(l, null, [g(a), e.getUseOpenBackTop ? (d(), c(n, {
        key: 0,
        target: e.getTarget
    }, null, 8, ["target"])) : f("", !0), e.getIsFixedSettingDrawer ? (d(), c(p, {
        key: 1,
        class: j(e.prefixCls)
    }, null, 8, ["class"])) : f("", !0), e.getIsSessionTimeout ? (d(), c(x, {key: 2})) : f("", !0)], 64)
};
export {v as default};
