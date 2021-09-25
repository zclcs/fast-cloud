import {a0 as t, a4 as r, B as e, bx as o, D as s, J as i, r as a, u as n, w as l} from "./vendor.4c4242b5.js"; /* empty css              */
import {P as d} from "./index.b86de47c.js";
import {_ as u} from "./WorkbenchHeader.vue_vue&type=script&setup=true&lang.7af9e2d4.js";
import c from "./ProjectCard.8f2ce965.js";
import {_ as m} from "./QuickNav.vue_vue&type=script&setup=true&lang.8a5b53c8.js";
import {_ as p} from "./DynamicInfo.vue_vue&type=script&setup=true&lang.640c840f.js";
import {_ as v} from "./SaleRadar.vue_vue&type=script&setup=true&lang.083c638b.js";
import "./index.446d454d.js"; /* empty css              */
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js";
import "./header.d801b988.js";
import "./data.8ddc77c3.js"; /* empty css              */
import "./useECharts.028395ed.js";/* empty css              *//* empty css              *//* empty css              */
const g = {class: "lg:flex"}, j = {class: "lg:w-7/10 w-full !mr-4 enter-y"}, f = {class: "lg:w-3/10 w-full enter-y"},
    y = i("img", {class: "xl:h-50 h-30 mx-auto", src: "/assets/illustration.8e82152d.svg"}, null, -1);
var x = e({
    setup(e) {
        const x = a(!0);
        return setTimeout((() => {
            x.value = !1
        }), 1500), (e, a) => (s(), t(n(d), null, {
            headerContent: r((() => [l(u)])),
            default: r((() => [i("div", g, [i("div", j, [l(c, {
                loading: x.value,
                class: "enter-y"
            }, null, 8, ["loading"]), l(p, {
                loading: x.value,
                class: "!my-4 enter-y"
            }, null, 8, ["loading"])]), i("div", f, [l(m, {
                loading: x.value,
                class: "enter-y"
            }, null, 8, ["loading"]), l(n(o), {class: "!my-4 enter-y", loading: x.value}, {
                default: r((() => [y])),
                _: 1
            }, 8, ["loading"]), l(v, {loading: x.value, class: "enter-y"}, null, 8, ["loading"])])])])),
            _: 1
        }))
    }
});
export {x as default};
