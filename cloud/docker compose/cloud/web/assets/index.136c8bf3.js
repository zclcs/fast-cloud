var e = Object.defineProperty, t = Object.getOwnPropertySymbols, n = Object.prototype.hasOwnProperty,
    l = Object.prototype.propertyIsEnumerable,
    a = (t, n, l) => n in t ? e(t, n, {enumerable: !0, configurable: !0, writable: !0, value: l}) : t[n] = l,
    i = (e, i) => {
        for (var o in i || (i = {})) n.call(i, o) && a(e, o, i[o]);
        if (t) for (var o of t(i)) l.call(i, o) && a(e, o, i[o]);
        return e
    };
import {B as o, u as E} from "./index.d55bbd60.js";
import {$ as S, a$ as O, a3 as g, a9 as d, B as s, D as T, F as A, j as _, u, w as r} from "./vendor.4c4242b5.js"; /* empty css              */
import {
    $ as m,
    _ as x,
    a$ as F,
    a_ as P,
    aQ as M,
    aR as R,
    aS as I,
    aT as H,
    aU as U,
    aV as b,
    aW as y,
    aX as f,
    aY as B,
    aZ as v,
    b0 as w,
    c as h,
    e as C,
    F as N,
    M as c,
    m as D,
    O as p,
    q as W,
    U as L,
    Z as G
} from "./index.446d454d.js";
import {a as k, c as X, u as j} from "./index.7bf0a616.js";

const K = X((() => N((() => import("./TypePicker.92beb48f.js")), ["assets/TypePicker.92beb48f.js", "assets/TypePicker.f8614c9e.css", "assets/vendor.4c4242b5.js", "assets/vendor.4762b10c.css", "assets/index.446d454d.js", "assets/index.c94109dd.css"]))),
    V = X((() => N((() => import("./ThemeColorPicker.0c4b522d.js")), ["assets/ThemeColorPicker.0c4b522d.js", "assets/ThemeColorPicker.8eb61909.css", "assets/index.1bb9cac4.css", "assets/index.35b5cf30.css", "assets/index.9f1c8d57.css", "assets/index.446d454d.js", "assets/index.c94109dd.css", "assets/vendor.4c4242b5.js", "assets/vendor.4762b10c.css", "assets/index.d55bbd60.js", "assets/index.5c7227e9.css", "assets/index.7bf0a616.js", "assets/index.78cadd6e.css", "assets/index.85d7f834.js", "assets/index.55076fdd.css", "assets/useWindowSizeFn.d8bc0d08.js", "assets/useContentViewHeight.cec819c9.js", "assets/useSortable.8f01f022.js", "assets/lock.dfd9ac6c.js"]))),
    Y = X((() => N((() => import("./SettingFooter.7842fb87.js")), ["assets/SettingFooter.7842fb87.js", "assets/SettingFooter.d8922452.css", "assets/index.446d454d.js", "assets/index.c94109dd.css", "assets/vendor.4c4242b5.js", "assets/vendor.4762b10c.css"]))),
    Q = X((() => N((() => import("./SwitchItem.2b0f9408.js")), ["assets/SwitchItem.2b0f9408.js", "assets/SwitchItem.458f0d56.css", "assets/index.317f90e2.css", "assets/index.1bb9cac4.css", "assets/index.35b5cf30.css", "assets/index.9f1c8d57.css", "assets/vendor.4c4242b5.js", "assets/vendor.4762b10c.css", "assets/index.446d454d.js", "assets/index.c94109dd.css", "assets/index.d55bbd60.js", "assets/index.5c7227e9.css", "assets/index.7bf0a616.js", "assets/index.78cadd6e.css", "assets/index.85d7f834.js", "assets/index.55076fdd.css", "assets/useWindowSizeFn.d8bc0d08.js", "assets/useContentViewHeight.cec819c9.js", "assets/useSortable.8f01f022.js", "assets/lock.dfd9ac6c.js"]))),
    $ = X((() => N((() => import("./SelectItem.159c7d37.js")), ["assets/SelectItem.159c7d37.js", "assets/SelectItem.809be52d.css", "assets/index.1bb9cac4.css", "assets/index.35b5cf30.css", "assets/index.9f1c8d57.css", "assets/vendor.4c4242b5.js", "assets/vendor.4762b10c.css", "assets/index.446d454d.js", "assets/index.c94109dd.css", "assets/index.d55bbd60.js", "assets/index.5c7227e9.css", "assets/index.7bf0a616.js", "assets/index.78cadd6e.css", "assets/index.85d7f834.js", "assets/index.55076fdd.css", "assets/useWindowSizeFn.d8bc0d08.js", "assets/useContentViewHeight.cec819c9.js", "assets/useSortable.8f01f022.js", "assets/lock.dfd9ac6c.js"]))),
    Z = X((() => N((() => import("./InputNumberItem.75ef2802.js")), ["assets/InputNumberItem.75ef2802.js", "assets/InputNumberItem.32e93ffc.css", "assets/index.553174f4.css", "assets/index.1bb9cac4.css", "assets/index.35b5cf30.css", "assets/index.9f1c8d57.css", "assets/vendor.4c4242b5.js", "assets/vendor.4762b10c.css", "assets/index.446d454d.js", "assets/index.c94109dd.css", "assets/index.d55bbd60.js", "assets/index.5c7227e9.css", "assets/index.7bf0a616.js", "assets/index.78cadd6e.css", "assets/index.85d7f834.js", "assets/index.55076fdd.css", "assets/useWindowSizeFn.d8bc0d08.js", "assets/useContentViewHeight.cec819c9.js", "assets/useSortable.8f01f022.js", "assets/lock.dfd9ac6c.js"]))), {t: z} = C();
var q, J;
(J = q || (q = {}))[J.CHANGE_LAYOUT = 0] = "CHANGE_LAYOUT", J[J.CHANGE_THEME_COLOR = 1] = "CHANGE_THEME_COLOR", J[J.CHANGE_THEME = 2] = "CHANGE_THEME", J[J.MENU_HAS_DRAG = 3] = "MENU_HAS_DRAG", J[J.MENU_ACCORDION = 4] = "MENU_ACCORDION", J[J.MENU_TRIGGER = 5] = "MENU_TRIGGER", J[J.MENU_TOP_ALIGN = 6] = "MENU_TOP_ALIGN", J[J.MENU_COLLAPSED = 7] = "MENU_COLLAPSED", J[J.MENU_COLLAPSED_SHOW_TITLE = 8] = "MENU_COLLAPSED_SHOW_TITLE", J[J.MENU_WIDTH = 9] = "MENU_WIDTH", J[J.MENU_SHOW_SIDEBAR = 10] = "MENU_SHOW_SIDEBAR", J[J.MENU_THEME = 11] = "MENU_THEME", J[J.MENU_SPLIT = 12] = "MENU_SPLIT", J[J.MENU_FIXED = 13] = "MENU_FIXED", J[J.MENU_CLOSE_MIX_SIDEBAR_ON_CHANGE = 14] = "MENU_CLOSE_MIX_SIDEBAR_ON_CHANGE", J[J.MENU_TRIGGER_MIX_SIDEBAR = 15] = "MENU_TRIGGER_MIX_SIDEBAR", J[J.MENU_FIXED_MIX_SIDEBAR = 16] = "MENU_FIXED_MIX_SIDEBAR", J[J.HEADER_SHOW = 17] = "HEADER_SHOW", J[J.HEADER_THEME = 18] = "HEADER_THEME", J[J.HEADER_FIXED = 19] = "HEADER_FIXED", J[J.HEADER_SEARCH = 20] = "HEADER_SEARCH", J[J.TABS_SHOW_QUICK = 21] = "TABS_SHOW_QUICK", J[J.TABS_SHOW_REDO = 22] = "TABS_SHOW_REDO", J[J.TABS_SHOW = 23] = "TABS_SHOW", J[J.TABS_SHOW_FOLD = 24] = "TABS_SHOW_FOLD", J[J.LOCK_TIME = 25] = "LOCK_TIME", J[J.FULL_CONTENT = 26] = "FULL_CONTENT", J[J.CONTENT_MODE = 27] = "CONTENT_MODE", J[J.SHOW_BREADCRUMB = 28] = "SHOW_BREADCRUMB", J[J.SHOW_BREADCRUMB_ICON = 29] = "SHOW_BREADCRUMB_ICON", J[J.GRAY_MODE = 30] = "GRAY_MODE", J[J.COLOR_WEAK = 31] = "COLOR_WEAK", J[J.SHOW_LOGO = 32] = "SHOW_LOGO", J[J.SHOW_FOOTER = 33] = "SHOW_FOOTER", J[J.ROUTER_TRANSITION = 34] = "ROUTER_TRANSITION", J[J.OPEN_PROGRESS = 35] = "OPEN_PROGRESS", J[J.OPEN_PAGE_LOADING = 36] = "OPEN_PAGE_LOADING", J[J.OPEN_ROUTE_TRANSITION = 37] = "OPEN_ROUTE_TRANSITION";
const ee = [{value: M.FULL, label: z("layout.setting.contentModeFull")}, {
        value: M.FIXED,
        label: z("layout.setting.contentModeFixed")
    }], te = [{value: R.CENTER, label: z("layout.setting.topMenuAlignRight")}, {
        value: R.START,
        label: z("layout.setting.topMenuAlignLeft")
    }, {value: R.END, label: z("layout.setting.topMenuAlignCenter")}],
    ne = [I.ZOOM_FADE, I.FADE, I.ZOOM_OUT, I.FADE_SIDE, I.FADE_BOTTOM, I.FADE_SCALE].map((e => ({label: e, value: e}))),
    le = [{
        title: z("layout.setting.menuTypeSidebar"),
        mode: c.INLINE,
        type: D.SIDEBAR
    }, {
        title: z("layout.setting.menuTypeMix"),
        mode: c.INLINE,
        type: D.MIX
    }, {
        title: z("layout.setting.menuTypeTopMenu"),
        mode: c.HORIZONTAL,
        type: D.TOP_MENU
    }, {title: z("layout.setting.menuTypeMixSidebar"), mode: c.INLINE, type: D.MIX_SIDEBAR}],
    ae = [{value: H.HOVER, label: z("layout.setting.triggerHover")}, {
        value: H.CLICK,
        label: z("layout.setting.triggerClick")
    }];

function ie(e, t) {
    const n = L(), l = function (e, t) {
        const n = L(), {getThemeColor: l, getDarkMode: a} = p();
        switch (e) {
            case q.CHANGE_LAYOUT:
                const {mode: e, type: o, split: E} = t;
                return {
                    menuSetting: i({
                        mode: e,
                        type: o,
                        collapsed: !1,
                        show: !0,
                        hidden: !1
                    }, void 0 === E ? {split: E} : {})
                };
            case q.CHANGE_THEME_COLOR:
                return l.value === t ? {} : (v(t), {themeColor: t});
            case q.CHANGE_THEME:
                return a.value === t || B(t), {};
            case q.MENU_HAS_DRAG:
                return {menuSetting: {canDrag: t}};
            case q.MENU_ACCORDION:
                return {menuSetting: {accordion: t}};
            case q.MENU_TRIGGER:
                return {menuSetting: {trigger: t}};
            case q.MENU_TOP_ALIGN:
                return {menuSetting: {topMenuAlign: t}};
            case q.MENU_COLLAPSED:
                return {menuSetting: {collapsed: t}};
            case q.MENU_WIDTH:
                return {menuSetting: {menuWidth: t}};
            case q.MENU_SHOW_SIDEBAR:
                return {menuSetting: {show: t}};
            case q.MENU_COLLAPSED_SHOW_TITLE:
                return {menuSetting: {collapsedShowTitle: t}};
            case q.MENU_THEME:
                return b(t), {menuSetting: {bgColor: t}};
            case q.MENU_SPLIT:
                return {menuSetting: {split: t}};
            case q.MENU_CLOSE_MIX_SIDEBAR_ON_CHANGE:
                return {menuSetting: {closeMixSidebarOnChange: t}};
            case q.MENU_FIXED:
                return {menuSetting: {fixed: t}};
            case q.MENU_TRIGGER_MIX_SIDEBAR:
                return {menuSetting: {mixSideTrigger: t}};
            case q.MENU_FIXED_MIX_SIDEBAR:
                return {menuSetting: {mixSideFixed: t}};
            case q.OPEN_PAGE_LOADING:
                return n.setPageLoading(!1), {transitionSetting: {openPageLoading: t}};
            case q.ROUTER_TRANSITION:
                return {transitionSetting: {basicTransition: t}};
            case q.OPEN_ROUTE_TRANSITION:
                return {transitionSetting: {enable: t}};
            case q.OPEN_PROGRESS:
                return {transitionSetting: {openNProgress: t}};
            case q.LOCK_TIME:
                return {lockTime: t};
            case q.FULL_CONTENT:
                return {fullContent: t};
            case q.CONTENT_MODE:
                return {contentMode: t};
            case q.SHOW_BREADCRUMB:
                return {showBreadCrumb: t};
            case q.SHOW_BREADCRUMB_ICON:
                return {showBreadCrumbIcon: t};
            case q.GRAY_MODE:
                return f(t), {grayMode: t};
            case q.SHOW_FOOTER:
                return {showFooter: t};
            case q.COLOR_WEAK:
                return y(t), {colorWeak: t};
            case q.SHOW_LOGO:
                return {showLogo: t};
            case q.TABS_SHOW_QUICK:
                return {multiTabsSetting: {showQuick: t}};
            case q.TABS_SHOW:
                return {multiTabsSetting: {show: t}};
            case q.TABS_SHOW_REDO:
                return {multiTabsSetting: {showRedo: t}};
            case q.TABS_SHOW_FOLD:
                return {multiTabsSetting: {showFold: t}};
            case q.HEADER_THEME:
                return U(t), {headerSetting: {bgColor: t}};
            case q.HEADER_SEARCH:
                return {headerSetting: {showSearch: t}};
            case q.HEADER_FIXED:
                return {headerSetting: {fixed: t}};
            case q.HEADER_SHOW:
                return {headerSetting: {show: t}};
            default:
                return {}
        }
    }(e, t);
    n.setProjectConfig(l), e === q.CHANGE_THEME && (U(), b())
}

const {t: oe} = C();
var Ee = s({
    name: "SettingDrawer", setup(e, {attrs: t}) {
        const {
                getContentMode: n,
                getShowFooter: l,
                getShowBreadCrumb: a,
                getShowBreadCrumbIcon: i,
                getShowLogo: E,
                getFullContent: s,
                getColorWeak: S,
                getGrayMode: T,
                getLockTime: A,
                getShowDarkModeToggle: N,
                getThemeColor: M
            } = p(), {
                getOpenPageLoading: R,
                getBasicTransition: I,
                getEnableTransition: c,
                getOpenNProgress: H
            } = G(), {
                getIsHorizontal: C,
                getShowMenu: L,
                getMenuType: U,
                getTrigger: b,
                getCollapsedShowTitle: y,
                getMenuFixed: f,
                getCollapsed: B,
                getCanDrag: v,
                getTopMenuAlign: x,
                getAccordion: X,
                getMenuWidth: J,
                getMenuBgColor: Ee,
                getIsTopMenu: se,
                getSplit: _e,
                getIsMixSidebar: ue,
                getCloseMixSidebarOnChange: re,
                getMixSideTrigger: Oe,
                getMixSideFixed: de
            } = W(), {
                getShowHeader: ge,
                getFixed: Se,
                getHeaderBgColor: Te,
                getShowSearch: Ae
            } = j(), {getShowMultipleTab: Ne, getShowQuick: Me, getShowRedo: Re, getShowFold: Ie} = k(),
            ce = _((() => u(L) && !u(C)));

        function De() {
            let e = u(b);
            const t = (l = u(_e), [{value: m.NONE, label: z("layout.setting.menuTriggerNone")}, {
                value: m.FOOTER,
                label: z("layout.setting.menuTriggerBottom")
            }, ...l ? [] : [{value: m.HEADER, label: z("layout.setting.menuTriggerTop")}]]);
            var l;
            return t.some((t => t.value === e)) || (e = m.FOOTER), r(d, null, [r(Q, {
                title: oe("layout.setting.splitMenu"),
                event: q.MENU_SPLIT,
                def: u(_e),
                disabled: !u(ce) || u(U) !== D.MIX
            }, null), r(Q, {
                title: oe("layout.setting.mixSidebarFixed"),
                event: q.MENU_FIXED_MIX_SIDEBAR,
                def: u(de),
                disabled: !u(ue)
            }, null), r(Q, {
                title: oe("layout.setting.closeMixSidebarOnChange"),
                event: q.MENU_CLOSE_MIX_SIDEBAR_ON_CHANGE,
                def: u(re),
                disabled: !u(ue)
            }, null), r(Q, {
                title: oe("layout.setting.menuCollapse"),
                event: q.MENU_COLLAPSED,
                def: u(B),
                disabled: !u(ce)
            }, null), r(Q, {
                title: oe("layout.setting.menuDrag"),
                event: q.MENU_HAS_DRAG,
                def: u(v),
                disabled: !u(ce)
            }, null), r(Q, {
                title: oe("layout.setting.menuSearch"),
                event: q.HEADER_SEARCH,
                def: u(Ae),
                disabled: !u(ge)
            }, null), r(Q, {
                title: oe("layout.setting.menuAccordion"),
                event: q.MENU_ACCORDION,
                def: u(X),
                disabled: !u(ce)
            }, null), r(Q, {
                title: oe("layout.setting.collapseMenuDisplayName"),
                event: q.MENU_COLLAPSED_SHOW_TITLE,
                def: u(y),
                disabled: !u(ce) || !u(B) || u(ue)
            }, null), r(Q, {
                title: oe("layout.setting.fixedHeader"),
                event: q.HEADER_FIXED,
                def: u(Se),
                disabled: !u(ge)
            }, null), r(Q, {
                title: oe("layout.setting.fixedSideBar"),
                event: q.MENU_FIXED,
                def: u(f),
                disabled: !u(ce) || u(ue)
            }, null), r($, {
                title: oe("layout.setting.mixSidebarTrigger"),
                event: q.MENU_TRIGGER_MIX_SIDEBAR,
                def: u(Oe),
                options: ae,
                disabled: !u(ue)
            }, null), r($, {
                title: oe("layout.setting.topMenuLayout"),
                event: q.MENU_TOP_ALIGN,
                def: u(x),
                options: te,
                disabled: !u(ge) || u(_e) || !u(se) && !u(_e) || u(ue)
            }, null), r($, {
                title: oe("layout.setting.menuCollapseButton"),
                event: q.MENU_TRIGGER,
                def: e,
                options: t,
                disabled: !u(ce) || u(ue)
            }, null), r($, {
                title: oe("layout.setting.contentMode"),
                event: q.CONTENT_MODE,
                def: u(n),
                options: ee
            }, null), r(Z, {
                title: oe("layout.setting.autoScreenLock"),
                min: 0,
                event: q.LOCK_TIME,
                defaultValue: u(A),
                formatter: e => 0 === parseInt(e) ? `0(${oe("layout.setting.notAutoScreenLock")})` : `${e}${oe("layout.setting.minute")}`
            }, null), r(Z, {
                title: oe("layout.setting.expandedMenuWidth"),
                max: 600,
                min: 100,
                step: 10,
                event: q.MENU_WIDTH,
                disabled: !u(ce),
                defaultValue: u(J),
                formatter: e => `${parseInt(e)}px`
            }, null)])
        }

        return () => r(o, g(t, {
            title: oe("layout.setting.drawerTitle"),
            width: 330,
            wrapClassName: "setting-drawer"
        }), {
            default: () => [u(N) && r(O, null, {default: () => oe("layout.setting.darkMode")}), u(N) && r(h, {class: "mx-auto"}, null), r(O, null, {default: () => oe("layout.setting.navMode")}), r(d, null, [r(K, {
                menuTypeList: le,
                handler: e => {
                    ie(q.CHANGE_LAYOUT, {mode: e.mode, type: e.type, split: !u(C) && void 0})
                },
                def: u(U)
            }, null)]), r(O, null, {default: () => oe("layout.setting.sysTheme")}), r(V, {
                colorList: P,
                def: u(M),
                event: q.CHANGE_THEME_COLOR
            }, null), r(O, null, {default: () => oe("layout.setting.headerTheme")}), r(V, {
                colorList: F,
                def: u(Te),
                event: q.HEADER_THEME
            }, null), r(O, null, {default: () => oe("layout.setting.sidebarTheme")}), r(V, {
                colorList: w,
                def: u(Ee),
                event: q.MENU_THEME
            }, null), r(O, null, {default: () => oe("layout.setting.interfaceFunction")}), De(), r(O, null, {default: () => oe("layout.setting.interfaceDisplay")}), r(d, null, [r(Q, {
                title: oe("layout.setting.breadcrumb"),
                event: q.SHOW_BREADCRUMB,
                def: u(a),
                disabled: !u(ge)
            }, null), r(Q, {
                title: oe("layout.setting.breadcrumbIcon"),
                event: q.SHOW_BREADCRUMB_ICON,
                def: u(i),
                disabled: !u(ge)
            }, null), r(Q, {
                title: oe("layout.setting.tabs"),
                event: q.TABS_SHOW,
                def: u(Ne)
            }, null), r(Q, {
                title: oe("layout.setting.tabsRedoBtn"),
                event: q.TABS_SHOW_REDO,
                def: u(Re),
                disabled: !u(Ne)
            }, null), r(Q, {
                title: oe("layout.setting.tabsQuickBtn"),
                event: q.TABS_SHOW_QUICK,
                def: u(Me),
                disabled: !u(Ne)
            }, null), r(Q, {
                title: oe("layout.setting.tabsFoldBtn"),
                event: q.TABS_SHOW_FOLD,
                def: u(Ie),
                disabled: !u(Ne)
            }, null), r(Q, {
                title: oe("layout.setting.sidebar"),
                event: q.MENU_SHOW_SIDEBAR,
                def: u(L),
                disabled: u(C)
            }, null), r(Q, {
                title: oe("layout.setting.header"),
                event: q.HEADER_SHOW,
                def: u(ge)
            }, null), r(Q, {
                title: "Logo",
                event: q.SHOW_LOGO,
                def: u(E),
                disabled: u(ue)
            }, null), r(Q, {
                title: oe("layout.setting.footer"),
                event: q.SHOW_FOOTER,
                def: u(l)
            }, null), r(Q, {
                title: oe("layout.setting.fullContent"),
                event: q.FULL_CONTENT,
                def: u(s)
            }, null), r(Q, {
                title: oe("layout.setting.grayMode"),
                event: q.GRAY_MODE,
                def: u(T)
            }, null), r(Q, {
                title: oe("layout.setting.colorWeak"),
                event: q.COLOR_WEAK,
                def: u(S)
            }, null)]), r(O, null, {default: () => oe("layout.setting.animation")}), r(d, null, [r(Q, {
                title: oe("layout.setting.progress"),
                event: q.OPEN_PROGRESS,
                def: u(H)
            }, null), r(Q, {
                title: oe("layout.setting.switchLoading"),
                event: q.OPEN_PAGE_LOADING,
                def: u(R)
            }, null), r(Q, {
                title: oe("layout.setting.switchAnimation"),
                event: q.OPEN_ROUTE_TRANSITION,
                def: u(c)
            }, null), r($, {
                title: oe("layout.setting.animationType"),
                event: q.ROUTER_TRANSITION,
                def: u(I),
                options: ne,
                disabled: !u(c)
            }, null)]), r(O, null, null), r(Y, null, null)]
        })
    }
}), se = s({
    name: "SettingButton", components: {SettingDrawer: Ee, Icon: x}, setup() {
        const [e, {openDrawer: t}] = E();
        return {register: e, openDrawer: t}
    }
});
se.render = function (e, t, n, l, a, i) {
    const o = S("Icon"), E = S("SettingDrawer");
    return T(), A("div", {onClick: t[0] || (t[0] = t => e.openDrawer(!0))}, [r(o, {icon: "ion:settings-outline"}), r(E, {onRegister: e.register}, null, 8, ["onRegister"])])
};
var _e = Object.freeze({__proto__: null, [Symbol.toStringTag]: "Module", default: se});
export {ie as b, _e as i};
