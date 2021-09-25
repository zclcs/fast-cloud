import {
    $ as a,
    a0 as r,
    a4 as i,
    aA as e,
    ag as t,
    B as n,
    D as o,
    j as s,
    J as c,
    K as u,
    w as l
} from "./vendor.4c4242b5.js";
import {_ as m, p} from "./index.446d454d.js";

var d = n({
    name: "DropdownMenuItem",
    components: {MenuItem: e.Item, Icon: m},
    props: {key: p.string, text: p.string, icon: p.string},
    setup(n) {
        const e = t();
        return {
            itemKey: s((() => {
                var s, t;
                return n.key || (null == (t = null == (s = null == e ? void 0 : e.vnode) ? void 0 : s.props) ? void 0 : t.key)
            }))
        }
    }
});
const v = {class: "flex items-center"};
d.render = function (n, e, s, t, m, p) {
    const d = a("Icon"), f = a("MenuItem");
    return o(), r(f, {key: n.itemKey}, {
        default: i((() => [c("span", v, [l(d, {
            icon: n.icon,
            class: "mr-1"
        }, null, 8, ["icon"]), c("span", null, u(n.text), 1)])])), _: 1
    })
};
export {d as default};
