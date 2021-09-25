import {_ as e, u as t} from "./useTable.1153f980.js";
import {_ as i} from "./useForm.bb6fa296.js";
import {g as o} from "./system.78153014.js";
import {_ as s, c as n, d as r, s as a} from "./DeptModal.5f1ebaaf.js";
import {u as d} from "./index.ae2ab368.js";
import {ao as c} from "./index.446d454d.js";
import {$ as p, _ as m, a0 as j, a4 as b, ab as x, ac as S, B as l, D as u, F as f, w as h} from "./vendor.4c4242b5.js"; /* empty css              */
import "./index.b86de47c.js"; /* empty css              */
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./uuid.5e4d726a.js"; /* empty css              */
import "./useSortable.8f01f022.js"; /* empty css              */
import "./index.d48332d7.js";
import "./download.b1d83379.js";
import "./index.4400f2f0.js";/* empty css              *//* empty css              *//* empty css              *//* empty css              *//* empty css              */
var g = l({
    name: "DeptManagement", components: {BasicTable: e, DeptModal: s, TableAction: i}, setup() {
        const [e, {openModal: i}] = d(), {hasPermission: s} = c(), [l, {reload: p, expandAll: u}] = t({
            title: "部门列表",
            api: o,
            rowKey: "id",
            columns: n,
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
                ifShow: s("dept:update") || s("dept:delete")
            }
        });
        return {
            registerTable: l, registerModal: e, handleCreate: function () {
                i(!0, {isUpdate: !1})
            }, handleEdit: function (e) {
                i(!0, {record: e, isUpdate: !0})
            }, handleDelete: function (e) {
                return t = this, i = null, o = function* () {
                    yield r(e.id), p()
                }, new Promise(((e, s) => {
                    var n = e => {
                        try {
                            r(o.next(e))
                        } catch (t) {
                            s(t)
                        }
                    }, a = e => {
                        try {
                            r(o.throw(e))
                        } catch (t) {
                            s(t)
                        }
                    }, r = t => t.done ? e(t.value) : Promise.resolve(t.value).then(n, a);
                    r((o = o.apply(t, i)).next())
                }));
                var t, i, o
            }, handleSuccess: function () {
                p()
            }, onFetchSuccess: function () {
                m(u)
            }, hasPermission: s
        }
    }
});
const w = S(" 新增部门 ");
g.render = function (e, t, i, o, s, n) {
    const a = p("a-button"), r = p("TableAction"), d = p("BasicTable"), c = p("DeptModal");
    return u(), f("div", null, [h(d, {
        onRegister: e.registerTable,
        onFetchSuccess: e.onFetchSuccess
    }, {
        toolbar: b((() => [e.hasPermission("dept:add") ? (u(), j(a, {
            key: 0,
            type: "primary",
            onClick: e.handleCreate
        }, {default: b((() => [w])), _: 1}, 8, ["onClick"])) : x("", !0)])),
        action: b((({record: t}) => [h(r, {
            actions: [{
                icon: "clarity:note-edit-line",
                onClick: e.handleEdit.bind(null, t),
                ifShow: e.hasPermission("dept:update")
            }, {
                icon: "ant-design:delete-outlined",
                color: "error",
                popConfirm: {title: "是否确认删除", confirm: e.handleDelete.bind(null, t)},
                ifShow: e.hasPermission("dept:delete")
            }]
        }, null, 8, ["actions"])])),
        _: 1
    }, 8, ["onRegister", "onFetchSuccess"]), h(c, {
        onRegister: e.registerModal,
        onSuccess: e.handleSuccess
    }, null, 8, ["onRegister", "onSuccess"])])
};
export {g as default};
