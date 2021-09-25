import {_ as e, u as o} from "./useTable.1153f980.js";
import {_ as i} from "./useForm.bb6fa296.js";
import {b as r} from "./system.78153014.js";
import {_ as t, c as n, d as a, s} from "./RoleDrawer.ed467fc5.js";
import {u as d} from "./index.d55bbd60.js";
import {ao as l} from "./index.446d454d.js";
import {$ as c, a0 as h, a4 as b, ab as j, ac as x, B as m, D as u, F as p, w as f} from "./vendor.4c4242b5.js"; /* empty css              */
import "./index.b86de47c.js"; /* empty css              */
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./uuid.5e4d726a.js";
import "./index.ae2ab368.js"; /* empty css              */
import "./useSortable.8f01f022.js"; /* empty css              */
import "./index.d48332d7.js";
import "./download.b1d83379.js";
import "./index.4400f2f0.js";
import "./Tree.vue_vue&type=style&index=0&lang.f9b58fa2.js"; /* empty css              *//* empty css              *//* empty css              *//* empty css              *//* empty css              *//* empty css              */
var w = m({
    name: "RoleManagement", components: {BasicTable: e, RoleDrawer: t, TableAction: i}, setup() {
        const [e, {openDrawer: i}] = d(), {hasPermission: t} = l(), [m, {reload: c}] = o({
            title: "角色列表",
            api: r,
            rowKey: "roleId",
            columns: n,
            formConfig: {labelWidth: 120, schemas: s, autoSubmitOnEnter: !0},
            useSearchForm: !0,
            showTableSetting: !0,
            bordered: !0,
            showIndexColumn: !1,
            actionColumn: {
                width: 80,
                title: "操作",
                dataIndex: "action",
                slots: {customRender: "action"},
                fixed: void 0,
                ifShow: t("role:update") || t("role:delete")
            }
        });
        return {
            registerTable: m, registerDrawer: e, handleCreate: function () {
                i(!0, {isUpdate: !1})
            }, handleEdit: function (e) {
                i(!0, {record: e, isUpdate: !0})
            }, handleDelete: function (e) {
                return o = this, i = null, r = function* () {
                    yield a(e.id), c()
                }, new Promise(((e, t) => {
                    var n = e => {
                        try {
                            a(r.next(e))
                        } catch (o) {
                            t(o)
                        }
                    }, s = e => {
                        try {
                            a(r.throw(e))
                        } catch (o) {
                            t(o)
                        }
                    }, a = o => o.done ? e(o.value) : Promise.resolve(o.value).then(n, s);
                    a((r = r.apply(o, i)).next())
                }));
                var o, i, r
            }, handleSuccess: function () {
                c()
            }, hasPermission: t
        }
    }
});
const g = x(" 新增角色 ");
w.render = function (e, o, i, r, t, n) {
    const s = c("a-button"), a = c("TableAction"), d = c("BasicTable"), l = c("RoleDrawer");
    return u(), p("div", null, [f(d, {onRegister: e.registerTable}, {
        toolbar: b((() => [e.hasPermission("role:add") ? (u(), h(s, {
            key: 0,
            type: "primary",
            onClick: e.handleCreate
        }, {default: b((() => [g])), _: 1}, 8, ["onClick"])) : j("", !0)])),
        action: b((({record: o}) => [f(a, {
            actions: [{
                icon: "clarity:note-edit-line",
                onClick: e.handleEdit.bind(null, o),
                ifShow: e.hasPermission("role:update")
            }, {
                icon: "ant-design:delete-outlined",
                color: "error",
                popConfirm: {title: "是否确认删除", confirm: e.handleDelete.bind(null, o)},
                ifShow: e.hasPermission("role:delete")
            }]
        }, null, 8, ["actions"])])),
        _: 1
    }, 8, ["onRegister"]), f(l, {
        onRegister: e.registerDrawer,
        onSuccess: e.handleSuccess
    }, null, 8, ["onRegister", "onSuccess"])])
};
export {w as default};
