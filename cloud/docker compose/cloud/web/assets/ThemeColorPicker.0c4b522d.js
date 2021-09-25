import {a as e} from "./index.446d454d.js";
import {b as s} from "./index.136c8bf3.js";
import {$ as r, a9 as a, ar as d, B as i, bK as t, D as n, F as o, L as c, W as p, w as l} from "./vendor.4c4242b5.js";
import "./index.d55bbd60.js"; /* empty css              */
import "./index.7bf0a616.js";
import "./index.85d7f834.js";
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./useSortable.8f01f022.js";
import "./lock.dfd9ac6c.js";/* empty css              */
var f = i({
    name: "ThemeColorPicker",
    components: {CheckOutlined: t},
    props: {colorList: {type: Array, defualt: []}, event: {type: Number}, def: {type: String}},
    setup(i) {
        const {prefixCls: t} = e("setting-theme-picker");
        return {
            prefixCls: t, handleClick: function (e) {
                i.event && s(i.event, e)
            }
        }
    }
});
const m = ["onClick"];
f.render = function (e, s, i, t, f, u) {
    const x = r("CheckOutlined");
    return n(), o("div", {class: c(e.prefixCls)}, [(n(!0), o(a, null, d(e.colorList || [], (s => (n(), o("span", {
        key: s,
        onClick: i => e.handleClick(s),
        class: c([`${e.prefixCls}__item`, {[`${e.prefixCls}__item--active`]: e.def === s}]),
        style: p({background: s})
    }, [l(x)], 14, m)))), 128))], 2)
};
export {f as default};
