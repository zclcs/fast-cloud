import {
    $ as i,
    A as s,
    a0 as d,
    a4 as o,
    a7 as t,
    a9 as n,
    ar as p,
    B as e,
    D as l,
    F as r,
    J as c,
    L as f,
    z as a
} from "./vendor.4c4242b5.js";
import {a as u} from "./index.446d454d.js";

var m = e({
    name: "MenuTypePicker",
    components: {Tooltip: t},
    props: {
        menuTypeList: {type: Array, defualt: () => []},
        handler: {type: Function, default: () => ({})},
        def: {type: String, default: ""}
    },
    setup() {
        const {prefixCls: e} = u("setting-menu-type-picker");
        return {prefixCls: e}
    }
});
a("data-v-3bd5c878");
const y = ["onClick"], x = [c("div", {class: "mix-sidebar"}, null, -1)];
s(), m.render = function (e, t, a, s, u, m) {
    const _ = i("Tooltip");
    return l(), r("div", {class: f(e.prefixCls)}, [(l(!0), r(n, null, p(e.menuTypeList || [], (t => (l(), d(_, {
        key: t.title,
        title: t.title,
        placement: "bottom"
    }, {
        default: o((() => [c("div", {
            onClick: a => e.handler(t),
            class: f([`${e.prefixCls}__item`, `${e.prefixCls}__item--${t.type}`, {[`${e.prefixCls}__item--active`]: e.def === t.type}])
        }, x, 10, y)])), _: 2
    }, 1032, ["title"])))), 128))], 2)
}, m.__scopeId = "data-v-3bd5c878";
export {m as default};
