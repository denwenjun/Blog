$.serializeObject=function(a){return $.serializeObject(a,false)};$.serializeObject=function(b,a){var c={};$.each(b.serializeArray(),function(e){if(c[this["name"]]){if(a){var d=b.find("input[name='"+this["name"]+"']")[0];var f=$(d).prop("type");if(f!=undefined&&"radio"==f){return false}}c[this["name"]]=c[this["name"]]+","+this["value"]}else{c[this["name"]]=this["value"]}});return c};$.serializeFullObject=function(b,a){var c={};$.each(b.serializeArray(),function(e){if(c[this["name"]]!=undefined){if(a){var d=b.find("input[name='"+this["name"]+"']")[0];var f=$(d).prop("type");if(f!=undefined&&"radio"==f){return false}}c[this["name"]]=c[this["name"]]+","+this["value"]}else{c[this["name"]]=this["value"]}});return c};function isValidDate(a){if(Object.prototype.toString.call(a)!=="[object Date]"){return false}return !isNaN(a.getTime())}Date.prototype.format=function(c){if(!isValidDate(this)){return""}var b=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];var e=["日","一","二","三","四","五","六"];var d={"M+":this.getMonth()+1,"d+":this.getDate(),"H+":this.getHours(),"m+":this.getMinutes(),"s+":this.getSeconds(),"q+":Math.floor((this.getMonth()+3)/3),S:this.getMilliseconds(),X:"星期"+e[this.getDay()],Z:"周"+e[this.getDay()],F:b[this.getDay()],L:b[this.getDay()].slice(0,3)};if(/(y+)/.test(c)){c=c.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length))}for(var a in d){if(new RegExp("("+a+")").test(c)){c=c.replace(RegExp.$1,RegExp.$1.length==1?d[a]:("00"+d[a]).substr((""+d[a]).length))}}return c};$.formatDate=function(b,c){if(b==null||b==""||b=="null"){return""}var a;if(b instanceof Date){a=b}else{a=new Date(b);if(isNaN(a)){b=b.replace(/\/Date\((-?\d+)\)\//,"$1");a=new Date();a.setTime(b)}}return a.format(c)};$.formatString=function(b){for(var a=0;a<arguments.length-1;a++){b=b.replace("{"+a+"}",arguments[a+1])}return b};$.cutString=function(d,a){if(d.length*2<=a){return d}var e=0;var c="";for(var b=0;b<d.length;b++){c=c+d.charAt(b);if(d.charCodeAt(b)>128){e=e+2;if(e>=a){return c.substring(0,c.length-1)+"..."}}else{e=e+1;if(e>=a){return c.substring(0,c.length-2)+"..."}}}return c};$.objToStr=function(c){var b=[];if(typeof c=="string"||c==null){return"@"+c+"@"}if(typeof c=="object"){if(!c.sort){b[0]="{";for(var a in c){b[b.length]="@"+a+"@";b[b.length]=":";b[b.length]=$.objToStr(c[a]);b[b.length]=","}b[b.length-1]="}"}else{b[0]="[";for(var a=0;a<c.length;a++){b[b.length]=$.objToStr(c[a]);b[b.length]=","}b[b.length-1]="]"}return b.join("")}return c.toString()};$.jsonToObj=function(json){return eval("("+json+")")};$.jsonToString=function(c){var b=[];if(typeof c=="string"){return'"'+c.replace(/([\'\"\\])/g,"\\$1").replace(/(\n)/g,"\\n").replace(/(\r)/g,"\\r").replace(/(\t)/g,"\\t")+'"'}if(typeof c=="object"){if(!c.sort){for(var a in c){b.push(a+":"+$.objToStr(c[a]))}if(!!document.all&&!/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(c.toString)){b.push("toString:"+c.toString.toString())}b="{"+b.join()+"}"}else{for(var a=0;a<c.length;a++){b.push($.objToStr(c[a]))}b="["+b.join()+"]"}return b}return c.toString()};$.getUrlParam=function(a){var b=new RegExp("(^|&)"+a+"=([^&]*)(&|$)");var c=window.location.search.substr(1).match(b);if(c!=null){return unescape(c[2])}return null};$.getList=function(d){if(d!=undefined&&d!=""){var a=[];var c=d.split(",");for(var b=0;b<c.length;b++){a.push(""+c[b])}return a}else{return[]}};$.bp=function(){var c=window.document.location.href;var d=window.document.location.pathname;var e=c.indexOf(d);var b=c.substring(0,e);var a=d.substring(0,d.substr(1).indexOf("/")+1);return(b+a)};$.pn=function(){return window.document.location.pathname.substring(0,window.document.location.pathname.indexOf("/",1))};$.random4=function(){return(((1+Math.random())*65536)|0).toString(16).substring(1)};$.UUID=function(){return($.random4()+$.random4()+"-"+$.random4()+"-"+$.random4()+"-"+$.random4()+"-"+$.random4()+$.random4()+$.random4())};String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$)/g,"")};String.prototype.ltrim=function(){return this.replace(/(^\s*)/g,"")};String.prototype.rtrim=function(){return this.replace(/(\s*$)/g,"")};var DECMAP={"0":"零","1":"一","2":"二","3":"三","4":"四","5":"五","6":"六","7":"七","8":"八","9":"九"};var NLEN=["千","百","十","亿","千","百","十","万","千","百","十",""];$.formatDecimals=function(h){var d=h+"";var b="";if(d.indexOf(".")>=0){var f=d.split(".");for(var c=0;c<f[0].length;c++){b+=DECMAP[(f[0].charAt(c))];b+=NLEN[NLEN.length-f[0].length+c]}b+="点";for(var a=0;a<f[1].length;a++){b+=DECMAP[(f[1].charAt(a))]}}else{for(var e=0;e<d.length;e++){b+=DECMAP[(d.charAt(e))];b+=NLEN[NLEN.length-d.length+e]}}return b};$.formatCurrency=function(a,c){a=a.toString().replace(/\$|\,/g,"");if(isNaN(a)){a="0"}sign=(a==(a=Math.abs(a)));a=Math.floor(a*100+0.50000000001);cents=a%100;a=Math.floor(a/100).toString();if(cents<10){cents="0"+cents}for(var b=0;b<Math.floor((a.length-(1+b))/3);b++){a=a.substring(0,a.length-(4*b+3))+","+a.substring(a.length-(4*b+3))}a=(((sign)?"":"-")+a+"."+cents);if(c!=undefined){return c+a}return a};$.restoreFormatCurrency=function(a){var b=a.replace(",","").replace(/,/g,"");return b};function HashMap(){var a=0;var b=new Object();this.put=function(c,d){if(!this.containsKey(c)){a++}b[c]=d};this.get=function(c){if(this.containsKey(c)){return b[c]}else{return null}};this.remove=function(c){if(delete b[c]){a--}};this.containsKey=function(c){return(c in b)};this.containsValue=function(c){for(var d in b){if(b[d]==c){return true}}return false};this.values=function(){var c=new Array(a);for(var d in b){c.push(b[d])}return c};this.keys=function(){var c=new Array(a);for(var d in b){c.push(d)}return c};this.size=function(){return a}}function accAdd(h,g){var f,d,b,j;try{f=h.toString().split(".")[1].length}catch(i){f=0}try{d=g.toString().split(".")[1].length}catch(i){d=0}j=Math.abs(f-d);b=Math.pow(10,Math.max(f,d));if(j>0){var a=Math.pow(10,j);if(f>d){h=Number(h.toString().replace(".",""));g=Number(g.toString().replace(".",""))*a}else{h=Number(h.toString().replace(".",""))*a;g=Number(g.toString().replace(".",""))}}else{h=Number(h.toString().replace(".",""));g=Number(g.toString().replace(".",""))}return(h+g)/b}Number.prototype.add=function(a){return accAdd(a,this)};function accSub(f,d){var c,b,a,h;try{c=f.toString().split(".")[1].length}catch(g){c=0}try{b=d.toString().split(".")[1].length}catch(g){b=0}a=Math.pow(10,Math.max(c,b));h=(c>=b)?c:b;return((f*a-d*a)/a).toFixed(h)}Number.prototype.sub=function(a){return accMul(a,this)};function accMul(d,b){var a=0,f=d.toString(),c=b.toString();try{a+=f.split(".")[1].length}catch(g){}try{a+=c.split(".")[1].length}catch(g){}return Number(f.replace(".",""))*Number(c.replace(".",""))/Math.pow(10,a)}Number.prototype.mul=function(a){return accMul(a,this)};function accDiv(arg1,arg2){var t1=0,t2=0,r1,r2;try{t1=arg1.toString().split(".")[1].length}catch(e){}try{t2=arg2.toString().split(".")[1].length}catch(e){}with(Math){r1=Number(arg1.toString().replace(".",""));r2=Number(arg2.toString().replace(".",""));return(r1/r2)*pow(10,t2-t1)}}Number.prototype.div=function(a){return accDiv(this,a)};