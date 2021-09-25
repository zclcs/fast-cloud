import {_ as e} from "./Tree.vue_vue&type=style&index=0&lang.f9b58fa2.js";
import {g as t} from "./system.78153014.js";
import {$ as s, B as a, D as o, F as l, r, w as i, Z as n} from "./vendor.4c4242b5.js";
import "./index.446d454d.js"; /* empty css              */
var c = a({
    name: "DeptTree", components: {BasicTree: e}, emits: ["select"], setup(e, {emit: a}) {
        const s = r([]);

        function o() {
            return e = this, a = null, r = function* () {
                s.value = yield t()
            }, new Promise(((t, n) => {
                var s = e => {
                    try {
                        l(r.next(e))
                    } catch (t) {
                        n(t)
                    }
                }, o = e => {
                    try {
                        l(r.throw(e))
                    } catch (t) {
                        n(t)
                    }
                }, l = e => e.done ? t(e.value) : Promise.resolve(e.value).then(s, o);
                l((r = r.apply(e, a)).next())
            }));
            var e, a, r
        }

        return n((() => {
            o()
        })), {
            treeData: s, handleSelect: function (e) {
                a("select", e[0])
            }
        }
    }
});
const d = {class: "bg-white m-4 mr-0 overflow-hidden"};
c.render = function (e, t, a, r, n, c) {
    const m = s("BasicTree");
    return o(), l("div", d, [i(m, {
        title: "部门列表",
        toolbar: "",
        search: "",
        clickRowToExpand: !1,
        treeData: e.treeData,
        replaceFields: {key: "id", title: "label"},
        onSelect: e.handleSelect
    }, null, 8, ["treeData", "onSelect"])])
};
export {c as default};
