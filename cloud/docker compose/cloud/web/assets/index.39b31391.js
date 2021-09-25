import {_ as e, u as n} from "./useTable.1153f980.js";
import {_ as i} from "./useForm.bb6fa296.js";
import {a as s} from "./system.78153014.js";
import {_ as o, c as t, d as r, s as a} from "./MenuDrawer.3a9783cd.js";
import {u as d} from "./index.d55bbd60.js";
import {ao as c} from "./index.446d454d.js";
import {$ as u, _ as m, a0 as j, a4 as h, ab as x, ac as w, B as l, D as p, F as f, w as b} from "./vendor.4c4242b5.js"; /* empty css              */
import "./index.b86de47c.js"; /* empty css              */
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./uuid.5e4d726a.js";
import "./index.ae2ab368.js"; /* empty css              */
import "./useSortable.8f01f022.js"; /* empty css              */
import "./index.d48332d7.js";
import "./download.b1d83379.js";
import "./index.4400f2f0.js"; /* empty css              *//* empty css              *//* empty css              *//* empty css              *//* empty css              *//* empty css              */
var S = l({
    name: "MenuManagement", components: {BasicTable: e, MenuDrawer: o, TableAction: i}, setup() {
        const [e, {openDrawer: i}] = d(), {hasPermission: o} = c(), [l, {reload: u, expandAll: p}] = n({
            title: "菜单列表",
            api: s,
            rowKey: "id",
            columns: t,
            formConfig: {labelWidth: 120, schemas: a, autoSubmitOnEnter: !0},
            isTreeTable: !0,
            pagination: !1,
            striped: !1,
            useSearchForm: !0,
            showTableSetting: !0,
            bordered: !0,
            showIndexColumn: !1,
            canResize: !1,
            actionColumn: {
                width: 80,
                title: "操作",
                dataIndex: "action",
                slots: {customRender: "action"},
                fixed: void 0,
                ifShow: o("menu:update") || o("menu:delete")
            }
        });
        return {
            registerTable: l, registerDrawer: e, handleCreate: function () {
                i(!0, {isUpdate: !1})
            }, handleEdit: function (e) {
                i(!0, {record: e, isUpdate: !0})
            }, handleDelete: function (e) {
                return n = this, i = null, s = function* () {
                    yield r(e.id), u()
                }, new Promise(((e, o) => {
                    var t = e => {
                        try {
                            r(s.next(e))
                        } catch (n) {
                            o(n)
                        }
                    }, a = e => {
                        try {
                            r(s.throw(e))
                        } catch (n) {
                            o(n)
                        }
                    }, r = n => n.done ? e(n.value) : Promise.resolve(n.value).then(t, a);
                    r((s = s.apply(n, i)).next())
                }));
                var n, i, s
            }, handleSuccess: function () {
                u()
            }, onFetchSuccess: function () {
                m(p)
            }, hasPermission: o
        }
    }
});
const g = w(" 新增菜单 ");
S.render = function (e, n, i, s, o, t) {
    const a = u("a-button"), r = u("TableAction"), d = u("BasicTable"), c = u("MenuDrawer");
    return p(), f("div", null, [b(d, {
        onRegister: e.registerTable,
        onFetchSuccess: e.onFetchSuccess
    }, {
        toolbar: h((() => [e.hasPermission("menu:add") ? (p(), j(a, {
            key: 0,
            type: "primary",
            onClick: e.handleCreate
        }, {default: h((() => [g])), _: 1}, 8, ["onClick"])) : x("", !0)])),
        action: h((({record: n}) => [b(r, {
            actions: [{
                icon: "clarity:note-edit-line",
                onClick: e.handleEdit.bind(null, n),
                ifShow: e.hasPermission("menu:update")
            }, {
                icon: "ant-design:delete-outlined",
                color: "error",
                popConfirm: {title: "是否确认删除", confirm: e.handleDelete.bind(null, n)},
                ifShow: e.hasPermission("menu:delete")
            }]
        }, null, 8, ["actions"])])),
        _: 1
    }, 8, ["onRegister", "onFetchSuccess"]), b(c, {
        onRegister: e.registerDrawer,
        onSuccess: e.handleSuccess
    }, null, 8, ["onRegister", "onSuccess"])])
};
export {S as default};
