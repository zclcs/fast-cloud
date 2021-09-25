import {$ as a, a as n, a0 as i, a4 as u, a7 as t, B as o, bP as e, D as s, j as r, w as l} from "./vendor.4c4242b5.js"; /* empty css              */
import {_ as c, aj as d, e as f, P as m} from "./index.446d454d.js";

var p = o({
    name: "ErrorAction", components: {Icon: c, Tooltip: t, Badge: e}, setup() {
        const {t: o} = f(), {push: t} = n(), e = d();
        return {
            t: o, getCount: r((() => e.getErrorLogListCount)), handleToErrorList: function () {
                t(m.ERROR_LOG_PAGE).then((() => {
                    e.setErrorLogListCount(0)
                }))
            }
        }
    }
});
p.render = function (o, t, e, n, r, c) {
    const d = a("Icon"), f = a("Badge"), m = a("Tooltip");
    return s(), i(m, {
        title: o.t("layout.header.tooltipErrorLog"),
        placement: "bottom",
        mouseEnterDelay: .5,
        onClick: o.handleToErrorList
    }, {
        default: u((() => [l(f, {
            count: o.getCount,
            offset: [0, 10],
            overflowCount: 99
        }, {default: u((() => [l(d, {icon: "ion:bug-outline"})])), _: 1}, 8, ["count"])])), _: 1
    }, 8, ["title", "mouseEnterDelay", "onClick"])
};
export {p as default};
