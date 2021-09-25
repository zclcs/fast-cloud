import {q as e} from "./index.446d454d.js";
import {$ as s, a0 as n, ay as r, B as l, c9 as o, ca as t, D as a, F as d} from "./vendor.4c4242b5.js";

var g = l({
    name: "SiderTrigger", components: {DoubleRightOutlined: o, DoubleLeftOutlined: t}, setup() {
        const {getCollapsed: l, toggleCollapsed: o} = e();
        return {getCollapsed: l, toggleCollapsed: o}
    }
});
g.render = function (e, l, o, t, g, i) {
    const p = s("DoubleRightOutlined"), u = s("DoubleLeftOutlined");
    return a(), d("div", {onClick: l[0] || (l[0] = r(((...l) => e.toggleCollapsed && e.toggleCollapsed(...l)), ["stop"]))}, [e.getCollapsed ? (a(), n(p, {key: 0})) : (a(), n(u, {key: 1}))])
};
export {g as default};
