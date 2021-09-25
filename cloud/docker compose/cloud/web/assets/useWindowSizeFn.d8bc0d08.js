import {ae as n, bo as e, S as t} from "./vendor.4c4242b5.js";

function o(o, r = 150, s) {
    let i = () => {
        o()
    };
    const a = t(i, r);
    i = a;
    const d = () => {
        s && s.immediate && i(), window.addEventListener("resize", i)
    }, m = () => {
        window.removeEventListener("resize", i)
    };
    return e((() => {
        d()
    })), n((() => {
        m()
    })), [d, m]
}

export {o as u};
