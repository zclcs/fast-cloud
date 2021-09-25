import {P as e} from "./index.b86de47c.js";
import {f as s, g as r} from "./useForm.bb6fa296.js";
import {c as t, m as i} from "./user.5f6ebdde.js";
import {aL as o, P as a} from "./index.446d454d.js";
import {$ as d, a0 as m, a4 as c, ac as f, B as n, D as l, J as p, w as u} from "./vendor.4c4242b5.js"; /* empty css              */
import "./useWindowSizeFn.d8bc0d08.js";
import "./useContentViewHeight.cec819c9.js"; /* empty css              */
import "./index.d48332d7.js";
import "./index.ae2ab368.js"; /* empty css              */
import "./uuid.5e4d726a.js";
import "./download.b1d83379.js";
import "./index.4400f2f0.js";/* empty css              *//* empty css              *//* empty css              *//* empty css              *//* empty css              *//* empty css              */
const j = [{
    field: "passwordOld",
    label: "当前密码",
    component: "InputPassword",
    helpMessage: ["输入原密码"],
    rules: [{required: !0, message: "请输入原密码"}, {
        validator: (e, s) => new Promise(((e, r) => {
            t(s).then((s => s ? e() : r("原密码错误"))).catch((e => {
                r(e.message || "验证失败")
            }))
        }))
    }]
}, {
    field: "passwordNew",
    label: "新密码",
    component: "StrengthMeter",
    componentProps: {placeholder: "新密码"},
    rules: [{required: !0, message: "请输入新密码"}]
}, {
    field: "confirmPassword",
    label: "确认密码",
    component: "InputPassword",
    dynamicRules: ({values: e}) => [{
        required: !0,
        validator: (s, r) => r ? r !== e.passwordNew ? Promise.reject("两次输入的密码不一致!") : Promise.resolve() : Promise.reject("不能为空")
    }]
}];
var b = n({
    name: "ChangePassword", components: {BasicForm: s, PageWrapper: e}, setup() {
        const [e, {validate: s, resetFields: t}] = r({
            size: "large",
            labelWidth: 100,
            showActionButtonGroup: !1,
            schemas: j
        });
        return {
            register: e, resetFields: t, handleSubmit: function () {
                return e = this, r = null, t = function* () {
                    try {
                        const e = yield s();
                        yield i(e.passwordNew), o.push(a.BASE_LOGIN)
                    } catch (e) {
                    }
                }, new Promise(((s, i) => {
                    var o = e => {
                        try {
                            n(t.next(e))
                        } catch (s) {
                            i(s)
                        }
                    }, a = e => {
                        try {
                            n(t.throw(e))
                        } catch (s) {
                            i(s)
                        }
                    }, n = e => e.done ? s(e.value) : Promise.resolve(e.value).then(o, a);
                    n((t = t.apply(e, r)).next())
                }));
                var e, r, t
            }
        }
    }
});
const h = {class: "py-8 bg-white flex flex-col justify-center items-center"}, w = {class: "flex justify-center"},
    x = f(" 重置 "), g = f(" 确认 ");
b.render = function (e, s, r, t, i, o) {
    const a = d("BasicForm"), n = d("a-button"), f = d("PageWrapper");
    return l(), m(f, {
        title: "修改当前用户密码",
        content: "修改成功后会自动退出当前登录！"
    }, {
        default: c((() => [p("div", h, [u(a, {onRegister: e.register}, null, 8, ["onRegister"]), p("div", w, [u(n, {onClick: e.resetFields}, {
            default: c((() => [x])),
            _: 1
        }, 8, ["onClick"]), u(n, {class: "!ml-4", type: "primary", onClick: e.handleSubmit}, {
            default: c((() => [g])),
            _: 1
        }, 8, ["onClick"])])])])), _: 1
    })
};
export {b as default};
