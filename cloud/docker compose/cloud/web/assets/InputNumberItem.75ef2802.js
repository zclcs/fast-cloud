import {$ as t, a3 as d, B as e, bE as s, D as n, F as i, J as r, K as a, L as p, w as o} from "./vendor.4c4242b5.js"; /* empty css              */
import {a as m} from "./index.446d454d.js";
import {b as u} from "./index.136c8bf3.js";
import "./index.d55bbd60.js"; /* empty css              */
import "./index.7bf0a616.js";
import "./index.85d7f834.js";
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./useSortable.8f01f022.js";
import "./lock.dfd9ac6c.js";/* empty css              */
var l = e({
    name: "InputNumberItem",
    components: {InputNumber: s},
    props: {event: {type: Number}, title: {type: String}},
    setup(e) {
        const {prefixCls: s} = m("setting-input-number-item");
        return {
            prefixCls: s, handleChange: function (s) {
                e.event && u(e.event, s)
            }
        }
    }
});
l.render = function (e, s, m, u, l, f) {
    const c = t("InputNumber");
    return n(), i("div", {class: p(e.prefixCls)}, [r("span", null, a(e.title), 1), o(c, d(e.$attrs, {
        size: "small",
        class: `${e.prefixCls}-input-number`,
        onChange: e.handleChange
    }), null, 16, ["class", "onChange"])], 2)
}, l.__scopeId = "data-v-e6b792da";
export {l as default};
