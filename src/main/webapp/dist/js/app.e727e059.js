(function(t){function e(e){for(var o,r,s=e[0],l=e[1],c=e[2],d=0,p=[];d<s.length;d++)r=s[d],Object.prototype.hasOwnProperty.call(a,r)&&a[r]&&p.push(a[r][0]),a[r]=0;for(o in l)Object.prototype.hasOwnProperty.call(l,o)&&(t[o]=l[o]);u&&u(e);while(p.length)p.shift()();return i.push.apply(i,c||[]),n()}function n(){for(var t,e=0;e<i.length;e++){for(var n=i[e],o=!0,s=1;s<n.length;s++){var l=n[s];0!==a[l]&&(o=!1)}o&&(i.splice(e--,1),t=r(r.s=n[0]))}return t}var o={},a={app:0},i=[];function r(e){if(o[e])return o[e].exports;var n=o[e]={i:e,l:!1,exports:{}};return t[e].call(n.exports,n,n.exports,r),n.l=!0,n.exports}r.m=t,r.c=o,r.d=function(t,e,n){r.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},r.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},r.t=function(t,e){if(1&e&&(t=r(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(r.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var o in t)r.d(n,o,function(e){return t[e]}.bind(null,o));return n},r.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return r.d(e,"a",e),e},r.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},r.p="/";var s=window["webpackJsonp"]=window["webpackJsonp"]||[],l=s.push.bind(s);s.push=e,s=s.slice();for(var c=0;c<s.length;c++)e(s[c]);var u=l;i.push([0,"chunk-vendors"]),n()})({0:function(t,e,n){t.exports=n("56d7")},"034f":function(t,e,n){"use strict";var o=n("85ec"),a=n.n(o);a.a},"29ba":function(t,e,n){"use strict";var o=n("5472"),a=n.n(o);a.a},"2eb3":function(t,e,n){"use strict";var o=n("bac5"),a=n.n(o);a.a},"49b6":function(t,e,n){},5472:function(t,e,n){},"56d7":function(t,e,n){"use strict";n.r(e);n("e260"),n("e6cf"),n("cca6"),n("a79d");var o=n("2b0e"),a=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"app"}},[n("router-view")],1)},i=[],r=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("h1",{attrs:{align:"center"}},[t._v("QnA List")]),n("table",{attrs:{align:"center"}},[t._m(0),t._l(t.getQItems,(function(e){return n("tr",{key:e.qno},[n("td",{attrs:{align:"center"}},[t._v(t._s(e.qno))]),n("td",[n("span",{on:{click:function(n){return t.goQItemDetail(e.qno)}}},[t._v(t._s(e.title))]),t._v(" "),n("span",{staticClass:"aaa",on:{click:function(n){return t.goQItemUpdate(e.qno)}}},[t._v("수정")]),t._v("/ "),n("span",{staticClass:"aaa",on:{click:function(n){return t.deleteQItem(e.qno)}}},[t._v("삭제")])]),n("td",{attrs:{align:"center"}},[t._v(t._s(e.userid))]),n("td",{attrs:{align:"center"}},[t._v(t._s(e.write_date))]),n("td",{attrs:{align:"center"}},[t._v(t._s(e.hit))])])})),n("tr",[n("td",{attrs:{colspan:"5",align:"right"}},[n("input",{attrs:{type:"button",value:"글쓰기"},on:{click:t.goQnAInsert}})])])],2)])},s=[function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("tr",[n("th",[t._v("No")]),n("th",{attrs:{width:"50%"}},[t._v("제목")]),n("th",[t._v("글쓴이")]),n("th",[t._v("작성일")]),n("th",[t._v("조회수")])])}],l={name:"QnAList",created:function(){this.$store.dispatch("getQList")},computed:{getQItems:function(){return this.$store.state.QItems}},methods:{goQItemDetail:function(t){console.log("QnA 보기 페이지 이동 처리 되었습니다. 번호 : "+t),this.$router.push("/qnadetail/"+t)},goQItemUpdate:function(t){console.log("QnA Update 페이지 이동 처리 되었습니다. 번호 : "+t),this.$router.push("/qnaupdate/"+t)},goQnAInsert:function(){console.log("QnA Insert 페이지 이동 처리 되었습니다."),this.$router.push("/qnainsert")},deleteQItem:function(t){console.log("delete 처리 되었습니다. 번호 : "+t),this.$store.dispatch("deleteQItem",{no:t})}}},c=l,u=(n("cf21"),n("2877")),d=Object(u["a"])(c,r,s,!1,null,"aaae29ee",null),p=d.exports,f=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("h1",{attrs:{align:"center"}},[t._v("QnA 작성")]),n("table",{staticClass:"contentBox",attrs:{align:"center"}},[n("tr",[n("th",[t._v("제목")]),n("td",[n("input",{directives:[{name:"model",rawName:"v-model",value:t.QInput.title,expression:"QInput.title"}],attrs:{type:"text",name:"title"},domProps:{value:t.QInput.title},on:{input:function(e){e.target.composing||t.$set(t.QInput,"title",e.target.value)}}})])]),t._m(0),n("tr",[n("th",[t._v("내용")]),n("td",{attrs:{height:"10"}},[n("textarea",{directives:[{name:"model",rawName:"v-model",value:t.QInput.content,expression:"QInput.content"}],attrs:{rows:"10",cols:"200",name:"content"},domProps:{value:t.QInput.content},on:{input:function(e){e.target.composing||t.$set(t.QInput,"content",e.target.value)}}})])]),n("tr",[n("td",{attrs:{colspan:"2",align:"right"}},[n("input",{attrs:{type:"button",value:"작성하기"},on:{click:t.insertQItem}})])])])])},h=[function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("tr",[n("th",[t._v("글쓴이")]),n("td")])}],g={data:function(){return{QInput:{title:"",userid:"",content:""}}},created:function(){this.$store.dispatch("getQDetail",{no:this.$route.params.qno}),this.$store.dispatch("getADetail",{no:this.$route.params.qno})},methods:{insertQItem:function(){this.$store.dispatch("insetQItem",{QInput:this.QInput}),this.$router.push("/qnalist")}}},Q=g,m=(n("2eb3"),Object(u["a"])(Q,f,h,!1,null,"a22cbfb6",null)),v=m.exports,_=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("h1",{attrs:{align:"center"}},[t._v("QnA 수정")]),n("table",{staticClass:"contentBox",attrs:{align:"center"}},[n("tr",[n("th",[t._v("제목")]),n("td",[n("input",{directives:[{name:"model",rawName:"v-model",value:t.getQDetail.title,expression:"getQDetail.title"}],attrs:{type:"text"},domProps:{value:t.getQDetail.title},on:{input:function(e){e.target.composing||t.$set(t.getQDetail,"title",e.target.value)}}})])]),n("tr",[n("th",[t._v("글쓴이")]),n("td",[t._v(t._s(t.getQDetail.userid))])]),n("tr",[n("th",[t._v("작성일")]),n("td",[t._v(t._s(t.getQDetail.write_date))])]),n("tr",[n("th",[t._v("조회수")]),n("td",[t._v(t._s(t.getQDetail.hit))])]),n("tr",[n("th",[t._v("내용")]),n("td",{attrs:{height:"10"}},[n("textarea",{directives:[{name:"model",rawName:"v-model",value:t.getQDetail.content,expression:"getQDetail.content"}],attrs:{rows:"10",cols:"200"},domProps:{value:t.getQDetail.content},on:{input:function(e){e.target.composing||t.$set(t.getQDetail,"content",e.target.value)}}})])]),t._l(t.getADetail,(function(e){return n("tr",{key:e.ano},[n("td",[t._v(t._s(e.userid)+" "+t._s(e.write_date))]),n("td",[t._v(t._s(e.content))])])})),n("tr",[n("td",{attrs:{colspan:"2",align:"right"}},[n("input",{attrs:{type:"button",value:"수정하기"},on:{click:function(e){return t.updateQItem(t.getQDetail.qno)}}}),n("input",{attrs:{type:"button",value:"삭제하기"},on:{click:function(e){return t.deleteQItem(t.getQDetail.qno)}}})])])],2)])},D=[],I={created:function(){this.$store.dispatch("getQDetail",{no:this.$route.params.no}),this.$store.dispatch("getADetail",{no:this.$route.params.no})},computed:{getQDetail:function(){return this.$store.state.QDetail},getADetail:function(){return this.$store.state.ADetail}},methods:{updateQItem:function(t){console.log("update 처리 되었습니다. 번호 : "+t),this.$store.dispatch("updateQItem",{no:t,Qupdate:this.$store.state.QDetail}),this.$router.push("/qnadetail/"+t)},deleteQItem:function(t){console.log("delete 처리 되었습니다. 번호 : "+t),this.$store.dispatch("deleteQItem",{no:t}),this.$router.push("/qnalist")}}},A=I,b=(n("68b5"),Object(u["a"])(A,_,D,!1,null,"16ae6b95",null)),$=b.exports,q=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("h1",{attrs:{align:"center"}},[t._v("QnA 상세내용")]),n("table",{staticClass:"contentBox",attrs:{align:"center"}},[n("input",{directives:[{name:"model",rawName:"v-model",value:t.AInput.qno,expression:"AInput.qno"}],attrs:{type:"hidden",value:"getQDetail.qno"},domProps:{value:t.AInput.qno},on:{input:function(e){e.target.composing||t.$set(t.AInput,"qno",e.target.value)}}}),n("tr",[n("th",[t._v("제목")]),n("td",[t._v(t._s(t.getQDetail.title))])]),n("tr",[n("th",[t._v("글쓴이")]),n("td",[t._v(t._s(t.getQDetail.userid))])]),n("tr",[n("th",[t._v("작성일")]),n("td",[t._v(t._s(t.getQDetail.write_date))])]),n("tr",[n("th",[t._v("조회수")]),n("td",[t._v(t._s(t.getQDetail.hit))])]),n("tr",[n("th",[t._v("내용")]),n("td",{staticClass:"content"},[t._v(t._s(t.getQDetail.content))])]),n("tr",[n("td",{attrs:{aling:"left"}},[n("input",{attrs:{type:"button",value:"목록"},on:{click:t.goQList}})]),n("td",{attrs:{align:"right"}},[n("input",{attrs:{type:"button",value:"수정"},on:{click:function(e){return t.goQItemUpdate(t.getQDetail.qno)}}}),n("input",{attrs:{type:"button",value:"삭제"},on:{click:function(e){return t.deleteQItem(t.getQDetail.qno)}}})])])]),n("table",{staticClass:"replyBox",attrs:{align:"center"}},t._l(t.getADetail,(function(e){return n("div",{key:e.ano},[n("tr",[n("td",[t._v(" "+t._s(e.userid)+" ")]),n("td",[t._v(" | "+t._s(e.write_date))])]),n("tr",[n("td"),n("td",[t._v(t._s(e.content))])])])})),0)])},w=[],y={data:function(){return{AInput:{userid:"",content:"",qno:""}}},created:function(){this.$store.dispatch("getQDetail",{no:this.$route.params.no}),this.$store.dispatch("getADetail",{no:this.$route.params.no})},computed:{getQDetail:function(){return this.$store.state.QDetail},getADetail:function(){return this.$store.state.ADetail}},methods:{goQItemUpdate:function(t){console.log("QnA Update 페이지 이동 처리 되었습니다. 번호 : "+t),this.$router.push("/qnaupdate/"+t)},deleteQItem:function(t){console.log("delete 처리 되었습니다. 번호 : "+t),this.$store.dispatch("deleteQItem",{no:t}),this.$router.push("/qnalist")},insertAItem:function(){this.$store.dispatch("insetAItem",{AInput:this.AInput})},deleteAItem:function(t){console.log("delete 처리 되었습니다. 번호 : "+t),this.$store.dispatch("deleteAItem",{no:t})},goQList:function(){this.$router.push("/qnalist")}}},x=y,k=(n("29ba"),Object(u["a"])(x,q,w,!1,null,"424814fa",null)),O=k.exports,j=n("8c4f");o["a"].use(j["a"]);var L=new j["a"]({mode:"history",routes:[{path:"/",component:p},{path:"/qnalist",component:p},{path:"/qnainsert",component:v},{path:"/qnadetail/:no",component:O},{path:"/qnaupdate/:no",component:$}]}),P={name:"app",components:{},router:L},C=P,U=(n("034f"),Object(u["a"])(C,a,i,!1,null,null,null)),E=U.exports,N=n("2f62"),S=n("bc3a"),B=n.n(S),M=B.a.create({baseURL:"http://localhost:8080",headers:{"Content-type":"application/json"}});o["a"].use(N["a"]);var T=new N["a"].Store({state:{QItems:[],QDetail:{},ADetail:[],Qupdate:{},LoginUserInfo:{}},actions:{getQList:function(t){M.get("safefood/qna/searchAll").then((function(e){return t.commit("getQList",{QItems:e.data.data})})).catch((function(t){return alert("QItems get 처리에 실패하였습니다."+t)}))},getQDetail:function(t,e){M.get("/safefood/qna/searchQuestion/"+e.no).then((function(e){console.log("QDetail get 처리 되었습니다."),console.log(e.data.data),t.commit("getQDetail",{QDetail:e.data.data})})).catch((function(t){return alert("QDetail get 처리에 실패하였습니다."+t)}))},getADetail:function(t,e){M.get("/safefood/qna/searchAnswerAll/"+e.no).then((function(e){console.log("ADetail get 처리 되었습니다."),t.commit("getADetail",{ADetail:e.data.data})})).catch((function(t){return alert("ADetail get 처리에 실패하였습니다."+t)}))},insetQItem:function(t,e){M.post("/safefood/qna/insertQuestion",{title:e.QInput.title,userid:"",content:e.QInput.content}).then((function(){console.log("QnA insert 처리 되었습니다."),t.dispatch("getQList")})).catch((function(t){return alert("QnA insert 처리에 실패하였습니다."+t)}))},updateQItem:function(t,e){console.log("--------"+e.no),console.log("--------"+e.Qupdate.title),M.put("/safefood/qna/updateQuestion/",{qno:e.no,title:e.Qupdate.title,content:e.Qupdate.content}).then((function(){M.get("/safefood/qna/searchQuestion/"+e.no).then((function(e){console.log("QDetail get 처리 되었습니다."),console.log(e.data.data),t.commit("getQDetail",{QDetail:e.data.data})})).catch((function(t){return alert("QDetail get 처리에 실패하였습니다."+t)}))})).catch((function(t){return alert("QnA update 처리에 실패하였습니다."+t)}))},deleteQItem:function(t,e){M.delete("/safefood/qna/deleteQuestion/"+e.no).then((function(){console.log("QnA delete 처리 되었습니다."+e.no),t.dispatch("getQList")})).catch((function(t){return alert("QnA delete 처리에 실패하였습니다."+t)}))},insetAItem:function(t,e){M.post("/safefood/qna/insertAnswer",{userid:"",content:e.AInput.content,qno:e.AInput.qno}).then((function(){console.log("Answer insert 처리 되었습니다."),t.commit("getADetail")})).catch((function(t){return alert("QnA insert 처리에 실패하였습니다."+t)}))},deleteAItem:function(t,e){M.delete("/safefood/qna/deleteAnswer/"+e.no).then((function(){console.log("Answer delete 처리 되었습니다."),t.commit("getADetail")})).catch((function(t){return alert("Answer delete 처리에 실패하였습니다."+t)}))}},mutations:{getQList:function(t,e){t.QItems=e.QItems},getQDetail:function(t,e){t.QDetail=e.QDetail},getADetail:function(t,e){t.ADetail=e.ADetail}}}),J=T;o["a"].config.productionTip=!1,new o["a"]({render:function(t){return t(E)},store:J}).$mount("#app")},"68b5":function(t,e,n){"use strict";var o=n("49b6"),a=n.n(o);a.a},"85ec":function(t,e,n){},bac5:function(t,e,n){},cf21:function(t,e,n){"use strict";var o=n("e424"),a=n.n(o);a.a},e424:function(t,e,n){}});
//# sourceMappingURL=app.e727e059.js.map