var t=Object.defineProperty,a=Object.getOwnPropertySymbols,e=Object.prototype.hasOwnProperty,l=Object.prototype.propertyIsEnumerable,n=(a,e,l)=>e in a?t(a,e,{enumerable:!0,configurable:!0,writable:!0,value:l}):a[e]=l;import{af as o,w as r,_ as s}from "./index.446d454d.js";import{B as i,r as u,bv as d,j as c,u as p,al as f,R as m,Z as v,bw as y,D as b,F as x,K as g,W as V,a9 as j,ar as w,a0 as S,a4 as O,w as h,ac as F,bp as N,J as $,L as E,bx as _}from "./vendor.4c4242b5.js";/* empty css              *//* empty css              *//* empty css              *//* empty css              */var B=i({name:"CountTo",props:{startVal:{type:Number,default:0},endVal:{type:Number,default:2021},duration:{type:Number,default:1500},autoplay:{type:Boolean,default:!0},decimals:{type:Number,default:0,validator: t=>t>=0},prefix:{type:String,default:""},suffix:{type:String,default:""},separator:{type:String,default:","},decimal:{type:String,default:"."},color:{type:String},useEasing:{type:Boolean,default:!0},transition:{type:String,default:"linear"}},emits:["onStarted","onFinished"],setup(t, {emit:r}){const s=u(t.startVal),i=u(!1);let b=d(s);const x=c((()=>function(a){if(!a&&0!==a)return"";const{decimals:e,decimal:l,separator:n,suffix:r,prefix:s}=t;a=Number(a).toFixed(e);const i=(a+="").split(".");let u=i[0];const d=i.length>1?l+i[1]:"",c=/(\d+)(\d{3})/;if(n&&!o(n))for(; c.test(u);)u=u.replace(c,"$1"+n+"$2");return s+u+d+r}(p(b))));function g(){V(),s.value=t.endVal}function V(){b=d(s,((t, o)=>{for(var r in o||(o={}))e.call(o,r)&&n(t,r,o[r]);if(a)for(var r of a(o))l.call(o,r)&&n(t,r,o[r]);return t})({disabled:i,duration:t.duration,onFinished:()=>r("onFinished"),onStarted:()=>r("onStarted")},t.useEasing?{transition:y[t.transition]}:{}))}return f((()=>{s.value=t.startVal})),m([()=>t.startVal,()=>t.endVal],(()=>{t.autoplay&&g()})),v((()=>{t.autoplay&&g()})),{value:x,start:g,reset:function(){s.value=t.startVal,V()}}}});B.render=function(t, a, e, l, n, o){return b(),x("span",{style:V({color:t.color})},g(t.value),5)};const P=r(B),z=[{title:"访问数",icon:"visit-count|svg",value:2e3,total:12e4,color:"green",action:"月"},{title:"成交额",icon:"total-sales|svg",value:2e4,total:5e5,color:"blue",action:"月"},{title:"下载数",icon:"download-count|svg",value:8e3,total:12e4,color:"orange",action:"周"},{title:"成交数",icon:"transaction|svg",value:5e3,total:5e4,color:"purple",action:"年"}],k={class:"md:flex"},C={class:"py-4 px-4 flex justify-between"},D={class:"p-2 px-4 flex justify-between"};var I=i({setup: t=>(t, a)=>(b(),x("div",k,[(b(!0),x(j,null,w(p(z),((a, e)=>(b(),S(p(_),{key:a.title,size:"small",loading:t.$attrs.loading,title:a.title,class:E(["md:w-1/4 w-full !md:mt-0 !mt-4",[e+1<4&&"!md:mr-4"]]),canExpan:!1},{extra:O((()=>[h(p(N),{color:a.color},{default:O((()=>[F(g(a.action),1)])),_:2},1032,["color"])])),default:O((()=>[$("div",C,[h(p(P),{prefix:"$",startVal:1,endVal:a.value,class:"text-2xl"},null,8,["endVal"]),h(p(s),{icon:a.icon,size:40},null,8,["icon"])]),$("div",D,[$("span",null,"总"+g(a.title),1),h(p(P),{prefix:"$",startVal:1,endVal:a.total},null,8,["endVal"])])])),_:2},1032,["loading","title","class"])))),128))]))});export{I as _};
