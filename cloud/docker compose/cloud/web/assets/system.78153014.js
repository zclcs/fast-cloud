import {aJ as e} from "./index.446d454d.js";

var s, t;
(t = s || (s = {})).UserPage = "/system/user", t.UserLogPage = "/system/log", t.IsUserExist = "/system/user/check/", t.IsRoleExist = "/system/role/check/", t.DeptTree = "/system/dept/options", t.DeptList = "/system/dept/list", t.setRoleStatus = "/system/setRoleStatus", t.MenuList = "/system/menu", t.RolePageList = "/system/role", t.GetAllRoleList = "/system/role/options";
const r = t => e.get({url: s.UserPage, params: t}), a = t => e.get({url: s.UserLogPage, params: t}),
    o = t => e.get({url: s.DeptTree, params: t}), l = t => e.get({url: s.DeptList, params: t}),
    g = t => e.get({url: s.MenuList, params: t}), m = t => e.get({url: s.RolePageList, params: t}),
    i = t => e.get({url: s.GetAllRoleList, params: t}),
    p = (t, r) => e.get({url: s.IsUserExist + t + "/" + r}, {errorMessageMode: "none"}),
    u = (t, r) => e.get({url: s.IsRoleExist + t + "/" + r}, {errorMessageMode: "none"});
export {g as a, m as b, a as c, p as d, i as e, l as f, o as g, r as h, u as i};
