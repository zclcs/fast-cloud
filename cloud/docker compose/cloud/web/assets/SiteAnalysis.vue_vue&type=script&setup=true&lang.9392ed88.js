import {
    a0 as e,
    a3 as b,
    a4 as i,
    ab as p,
    B as a,
    bx as o,
    D as s,
    F as r,
    r as t,
    u as n,
    w as u
} from "./vendor.4c4242b5.js"; /* empty css              */
import {_ as v} from "./VisitAnalysis.vue_vue&type=script&setup=true&lang.a688fbde.js";
import {_ as c} from "./VisitAnalysisBar.vue_vue&type=script&setup=true&lang.5f4c6e3c.js";/* empty css              *//* empty css              */
const l = {key: 0}, y = {key: 1};
var f = a({
    setup(a) {
        const f = t("tab1"), m = [{key: "tab1", tab: "流量趋势"}, {key: "tab2", tab: "访问量"}];

        function d(a) {
            f.value = a
        }

        return (a, t) => (s(), e(n(o), b({"tab-list": m}, a.$attrs, {
            "active-tab-key": f.value,
            onTabChange: d
        }), {
            default: i((() => ["tab1" === f.value ? (s(), r("p", l, [u(v)])) : p("", !0), "tab2" === f.value ? (s(), r("p", y, [u(c)])) : p("", !0)])),
            _: 1
        }, 16, ["active-tab-key"]))
    }
});
export {f as _};
