import {d as e, e as t, f as l, g as a} from "./system.78153014.js";
import {b as o} from "./user.5f6ebdde.js";
import {ai as d, bp as n} from "./vendor.4c4242b5.js"; /* empty css              */
const r = [{title: "用户名", dataIndex: "username", width: 120}, {
        title: "角色",
        dataIndex: "roleNames",
        width: 200
    }, {
        title: "用户状态", dataIndex: "status", width: 80, customRender: ({record: e}) => {
            const t = 1 == ~~e.status, a = t ? "有效" : "锁定";
            return d(n, {color: t ? "green" : "red"}, (() => a))
        }
    }, {title: "邮箱", dataIndex: "email", width: 120}, {title: "备注", dataIndex: "description"}, {
        title: "创建时间",
        dataIndex: "createTime",
        width: 180
    }], s = [{field: "username", label: "用户名", component: "Input", colProps: {span: 8}}],
    i = [{field: "userId", label: "用户编号", component: "Input", required: !0, ifShow: !1}, {
        field: "username",
        label: "用户名",
        component: "Input",
        helpMessage: ["用户名不能重复"],
        dynamicRules: ({values: t}) => [{
            required: !0, trigger: "change", validator: (a, l) => new Promise(((a, o) => {
                const {userId: d} = t;
                return d ? l ? void e(d, l).then((e => e ? o("用户名已被使用") : a())).catch((e => o(e.msg || "验证失败"))) : o("用户名不能为空") : a()
            }))
        }]
    }, {field: "password", label: "密码", component: "InputPassword", required: !0, ifShow: !1}, {
        label: "角色",
        field: "roleIds",
        component: "ApiSelect",
        componentProps: {api: t, mode: "multiple", labelField: "roleName", valueField: "roleId"},
        required: !0
    }, {
        field: "deptId",
        label: "所属部门",
        component: "ApiTreeSelect",
        componentProps: {
            api: a,
            replaceFields: {title: "label", key: "id", value: "id"},
            getPopupContainer: () => document.body
        },
        required: !0
    }, {
        label: "数据权限",
        field: "deptIds",
        component: "ApiSelect",
        componentProps: {api: l, mode: "multiple", labelField: "deptName", valueField: "deptId"},
        required: !0
    }, {
        label: "状态",
        field: "status",
        required: !0,
        component: "Select",
        componentProps: {options: [{label: "有效", value: "1"}, {label: "锁定", value: "0"}]},
        defaultValue: "1"
    }, {label: "邮箱", field: "email", component: "Input"}, {
        label: "描述",
        field: "description",
        component: "InputTextArea"
    }], p = [{field: "username", label: "用户名", component: "Input", required: !0, ifShow: !1}, {
        field: "password",
        label: "原密码",
        component: "InputPassword",
        helpMessage: ["输入原密码"],
        dynamicRules: ({values: e}) => [{
            required: !0, validator: (t, a) => new Promise(((t, l) => {
                const {username: d} = e;
                return d ? a ? void o(d, a).then((e => e ? t() : l("原密码错误"))).catch((e => l(e.msg || "验证失败"))) : l("原密码不能为空") : t()
            }))
        }]
    }, {field: "newPassword", label: "新密码", component: "InputPassword", required: !0}, {
        field: "rePassword",
        label: "确认密码",
        component: "InputPassword",
        helpMessage: ["二次输入新密码"],
        dynamicRules: ({values: e}) => [{
            required: !0, validator: (t, a) => new Promise(((t, l) => {
                const {newPassword: o} = e;
                return o ? a ? a === o ? t() : l("请确认两次密码输入是否一致") : l("确认密码不能为空") : t()
            }))
        }]
    }];
export {p as a, i as b, r as c, s};
