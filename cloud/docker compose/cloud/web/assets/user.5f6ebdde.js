import {aJ as s, aK as e} from "./index.446d454d.js";

var a, r;
(r = a || (a = {})).ACCOUNT_INFO = "/account/getAccountInfo", r.SESSION_TIMEOUT = "/user/sessionTimeout", r.USER = "/system/user", r.RESETPASSWORD = "/system/user/password/reset", r.CHECKPASSWORD = "/system/user/password/check", r.CHECKMINEPASSWORD = "/system/user/password/mine/check", r.PASSWORD = "/system/user/password", r.PASSWORDMINE = "/system/user/password/mine", r.STATUS = "/system/user/status";
const S = r => s.post({url: a.USER, headers: {"Content-Type": e.JSON}, data: r}),
    t = r => s.put({url: a.USER, headers: {"Content-Type": e.JSON}, data: r}),
    u = e => s.put({url: a.RESETPASSWORD, params: {usernames: e}}),
    o = (e, r) => s.get({url: a.CHECKPASSWORD, params: {username: e, password: r}}, {errorMessageMode: "none"}),
    p = e => s.get({url: a.CHECKMINEPASSWORD, params: {password: e}}, {errorMessageMode: "none"}),
    m = (e, r) => s.put({url: a.PASSWORD, params: {username: e, password: r}}),
    d = e => s.put({url: a.PASSWORDMINE, params: {password: e}}),
    n = e => s.put({url: a.STATUS, params: {username: e}}), E = e => s.delete({url: a.USER + "/" + e});
export {m as a, o as b, p as c, t as d, S as e, E as f, d as m, u as r, n as u};
