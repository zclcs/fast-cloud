import {B as s, by as x, bz as d, D as t, F as e, j as a, J as r, K as n, u as c, w as l} from "./vendor.4c4242b5.js"; /* empty css              */
import {f as i} from "./index.446d454d.js";
import {h as m} from "./header.d801b988.js";

const o = {class: "lg:flex"}, f = {class: "md:ml-6 flex flex-col justify-center md:mt-0 mt-2"},
    p = {class: "md:text-lg text-md"}, v = r("span", {class: "text-secondary"}, " 今日晴，20℃ - 32℃！ ", -1),
    j = d('<div class="flex flex-1 justify-end md:mt-0 mt-4"><div class="flex flex-col justify-center text-right"><span class="text-secondary"> 待办 </span><span class="text-2xl">2/10</span></div><div class="flex flex-col justify-center text-right md:mx-16 mx-12"><span class="text-secondary"> 项目 </span><span class="text-2xl">8</span></div><div class="flex flex-col justify-center text-right md:mr-10 mr-4"><span class="text-secondary"> 团队 </span><span class="text-2xl">300</span></div></div>', 1);
var u = s({
    setup(s) {
        const d = i(), u = a((() => d.getUserInfo));
        return (s, a) => (t(), e("div", o, [l(c(x), {
            src: c(u).avatar || c(m),
            size: 72,
            class: "!mx-auto !block"
        }, null, 8, ["src"]), r("div", f, [r("h1", p, "早安, " + n(c(u).realName) + ", 开始您一天的工作吧！", 1), v]), j]))
    }
});
export {u as _};
