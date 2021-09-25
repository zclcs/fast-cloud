import {B as a} from "./index.ae2ab368.js";
import {D as s, u as t} from "./index.440a9e9b.js";
import {e} from "./index.446d454d.js";
import {getDescSchema as o} from "./data.db9dbf9d.js";
import {a0 as d, a3 as l, a4 as n, B as r, D as i, u as f, w as m} from "./vendor.4c4242b5.js";

var p = r({
    props: {info: {type: Object, default: null}}, setup(r) {
        const {t: p} = e(), [u] = t({column: 2, schema: o()});
        return (t, e) => (i(), d(f(a), l({
            width: 800,
            title: f(p)("sys.errorLog.tableActionDesc")
        }, t.$attrs), {
            default: n((() => [m(f(s), {data: r.info, onRegister: f(u)}, null, 8, ["data", "onRegister"])])),
            _: 1
        }, 16, ["title"]))
    }
});
export {p as _};
