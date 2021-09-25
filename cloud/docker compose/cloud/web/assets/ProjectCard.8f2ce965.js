import {
    $ as t,
    a0 as l,
    a3 as f,
    a4 as r,
    a9 as m,
    ac as p,
    ar as d,
    B as a,
    bx as s,
    D as e,
    F as o,
    J as i,
    K as c,
    w as n
} from "./vendor.4c4242b5.js"; /* empty css              */
import {_ as u} from "./index.446d454d.js";
import {g as x} from "./data.8ddc77c3.js";/* empty css              *//* empty css              */
var j = a({components: {Card: s, CardGrid: s.Grid, Icon: u}, setup: () => ({items: x})});
const y = p("更多"), b = {class: "flex"}, v = {class: "text-lg ml-4"}, w = {class: "flex mt-2 h-10 text-secondary"},
    C = {class: "flex justify-between text-secondary"};
j.render = function (a, s, p, u, x, j) {
    const _ = t("a-button"), g = t("Icon"), G = t("CardGrid"), k = t("Card");
    return e(), l(k, f({title: "项目"}, a.$attrs), {
        extra: r((() => [n(_, {
            type: "link",
            size: "small"
        }, {default: r((() => [y])), _: 1})])),
        default: r((() => [(e(!0), o(m, null, d(a.items, (a => (e(), l(G, {
            key: a,
            class: "!md:w-1/3 !w-full"
        }, {
            default: r((() => [i("span", b, [n(g, {
                icon: a.icon,
                color: a.color,
                size: "30"
            }, null, 8, ["icon", "color"]), i("span", v, c(a.title), 1)]), i("div", w, c(a.desc), 1), i("div", C, [i("span", null, c(a.group), 1), i("span", null, c(a.date), 1)])])),
            _: 2
        }, 1024)))), 128))])),
        _: 1
    }, 16)
};
export {j as default};
