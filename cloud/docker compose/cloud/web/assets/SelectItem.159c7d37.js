import {
    $ as i,
    a3 as l,
    B as e,
    bF as t,
    D as n,
    F as a,
    j as s,
    J as d,
    K as o,
    L as p,
    w as r
} from "./vendor.4c4242b5.js";
import {a as f} from "./index.446d454d.js";
import {b as m} from "./index.136c8bf3.js";
import "./index.d55bbd60.js"; /* empty css              */
import "./index.7bf0a616.js";
import "./index.85d7f834.js";
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./useSortable.8f01f022.js";
import "./lock.dfd9ac6c.js";/* empty css              */
var c = e({
    name: "SelectItem",
    components: {Select: t},
    props: {
        event: {type: Number},
        disabled: {type: Boolean},
        title: {type: String},
        def: {type: [String, Number]},
        initValue: {type: [String, Number]},
        options: {type: Array, default: () => []}
    },
    setup(e) {
        const {prefixCls: t} = f("setting-select-item");
        return {
            prefixCls: t, handleChange: function (t) {
                e.event && m(e.event, t)
            }, getBindValue: s((() => e.def ? {value: e.def, defaultValue: e.initValue || e.def} : {}))
        }
    }
});
c.render = function (e, t, s, f, m, c) {
    const u = i("Select");
    return n(), a("div", {class: p(e.prefixCls)}, [d("span", null, o(e.title), 1), r(u, l(e.getBindValue, {
        class: `${e.prefixCls}-select`,
        onChange: e.handleChange,
        disabled: e.disabled,
        size: "small",
        options: e.options
    }), null, 16, ["class", "onChange", "disabled", "options"])], 2)
}, c.__scopeId = "data-v-6707e46b";
export {c as default};
