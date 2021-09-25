import {
    $ as i,
    a3 as l,
    B as e,
    bG as t,
    D as d,
    F as s,
    j as n,
    J as a,
    K as o,
    L as c,
    w as r
} from "./vendor.4c4242b5.js"; /* empty css              */
import {a as p, e as f} from "./index.446d454d.js";
import {b as m} from "./index.136c8bf3.js";
import "./index.d55bbd60.js"; /* empty css              */
import "./index.7bf0a616.js";
import "./index.85d7f834.js";
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./useSortable.8f01f022.js";
import "./lock.dfd9ac6c.js";/* empty css              */
var h = e({
    name: "SwitchItem",
    components: {Switch: t},
    props: {event: {type: Number}, disabled: {type: Boolean}, title: {type: String}, def: {type: Boolean}},
    setup(e) {
        const {prefixCls: t} = p("setting-switch-item"), {t: i} = f();
        return {
            prefixCls: t, t: i, handleChange: function (t) {
                e.event && m(e.event, t)
            }, getBindValue: n((() => e.def ? {checked: e.def} : {}))
        }
    }
});
h.render = function (e, t, n, p, f, m) {
    const h = i("Switch");
    return d(), s("div", {class: c(e.prefixCls)}, [a("span", null, o(e.title), 1), r(h, l(e.getBindValue, {
        onChange: e.handleChange,
        disabled: e.disabled,
        checkedChildren: e.t("layout.setting.on"),
        unCheckedChildren: e.t("layout.setting.off")
    }), null, 16, ["onChange", "disabled", "checkedChildren", "unCheckedChildren"])], 2)
}, h.__scopeId = "data-v-440e72fd";
export {h as default};
