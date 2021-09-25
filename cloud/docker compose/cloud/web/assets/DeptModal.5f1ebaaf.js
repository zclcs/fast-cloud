var e = Object.defineProperty, t = Object.getOwnPropertySymbols, a = Object.prototype.hasOwnProperty,
    o = Object.prototype.propertyIsEnumerable,
    r = (t, a, o) => a in t ? e(t, a, {enumerable: !0, configurable: !0, writable: !0, value: o}) : t[a] = o,
    l = (e, t, a) => new Promise(((o, r) => {
        var l = e => {
            try {
                s(a.next(e))
            } catch (t) {
                r(t)
            }
        }, n = e => {
            try {
                s(a.throw(e))
            } catch (t) {
                r(t)
            }
        }, s = e => e.done ? o(e.value) : Promise.resolve(e.value).then(l, n);
        s((a = a.apply(e, t)).next())
    }));
import {B as n, b as s} from "./index.ae2ab368.js";
import {f as i, g as d} from "./useForm.bb6fa296.js";
import {g as u} from "./system.78153014.js";
import {aJ as p, aK as c} from "./index.446d454d.js";
import {$ as g, a0 as h, a3 as w, a4 as P, B as m, D as y, j as v, r as f, u as b, w as j} from "./vendor.4c4242b5.js";

const I = [{title: "部门名称", dataIndex: "label", width: 160, align: "left"}, {
        title: "排序",
        dataIndex: "orderNum",
        width: 50
    }, {title: "创建时间", dataIndex: "createTime", width: 180}],
    O = [{field: "deptName", label: "部门名称", component: "Input", colProps: {span: 8}}],
    T = [{field: "label", label: "部门名称", component: "Input", required: !0}, {
        field: "hasParent",
        label: "是否顶级部门",
        component: "RadioButtonGroup",
        defaultValue: !0,
        componentProps: ({formModel: e}) => ({
            options: [{label: "是", value: !1}, {label: "否", value: !0}], onChange(t) {
                t && (e.parentId = void 0)
            }
        }),
        required: !0
    }, {
        field: "parentId",
        label: "上级部门",
        component: "ApiTreeSelect",
        componentProps: {
            api: u,
            replaceFields: {title: "label", key: "id", value: "id"},
            getPopupContainer: () => document.body
        },
        required: !0,
        ifShow: ({values: e}) => e.hasParent
    }, {field: "orderNum", label: "排序", component: "InputNumber", required: !0}];
var S;
(S || (S = {})).DEPT = "/system/dept";
const M = e => p.delete({url: S.DEPT + "/" + e});
var x = m({
    name: "DeptModal", components: {BasicModal: n, BasicForm: i}, emits: ["success", "register"], setup(e, {emit: n}) {
        const i = f(!0), m = f(""), [g, {
            resetFields: y,
            setFieldsValue: h,
            updateSchema: P,
            validate: j
        }] = d({labelWidth: 100, schemas: T, showActionButtonGroup: !1}), [w, {
            setModalProps: I,
            closeModal: O
        }] = s((e => l(this, null, (function* () {
            y(), I({confirmLoading: !1}), i.value = !!(null == e ? void 0 : e.isUpdate), b(i) && (m.value = e.record.id, h(((e, l) => {
                for (var n in l || (l = {})) a.call(l, n) && r(e, n, l[n]);
                if (t) for (var n of t(l)) o.call(l, n) && r(e, n, l[n]);
                return e
            })({}, e.record)));
            const l = yield u();
            P({field: "parentId", componentProps: {treeData: l}})
        }))));
        return {
            registerModal: w,
            registerForm: g,
            getTitle: v((() => b(i) ? "编辑部门" : "新增部门")),
            handleSubmit: function () {
                return l(this, null, (function* () {
                    try {
                        const t = yield j();
                        I({confirmLoading: !0}), t.deptName = t.label, t.label = void 0, b(i) ? (t.deptId = m.value, yield(e = t, p.put({
                            url: S.DEPT,
                            headers: {"Content-Type": c.JSON},
                            data: e
                        }))) : yield(e => p.post({
                            url: S.DEPT,
                            headers: {"Content-Type": c.JSON},
                            data: e
                        }))(t), O(), n("success")
                    } finally {
                        I({confirmLoading: !1})
                    }
                    var e
                }))
            }
        }
    }
});
x.render = function (e, t, a, o, r, l) {
    const n = g("BasicForm"), s = g("BasicModal");
    return y(), h(s, w(e.$attrs, {
        onRegister: e.registerModal,
        title: e.getTitle,
        onOk: e.handleSubmit
    }), {
        default: P((() => [j(n, {onRegister: e.registerForm}, null, 8, ["onRegister"])])),
        _: 1
    }, 16, ["onRegister", "title", "onOk"])
};
var B = Object.freeze({__proto__: null, [Symbol.toStringTag]: "Module", default: x});
export {B as D, x as _, I as c, M as d, O as s};
