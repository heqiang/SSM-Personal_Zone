$(document).ready(function() {

    $('.mb_list li').hover(function() {
        $(".cover", this).fadeIn("fast")
    },
    function() {
        $(".cover", this).fadeOut("fast")
    });

     $('.inner').hover(function() {
        $(".ckxx", this).fadeIn("fast");
    },
    function() {
        $(".ckxx", this).fadeOut("fast")
    });
    

	 $('.head-avatar,.sztx').hover(function() {
        $(".sztx").show()
    },
    function() {
        $(".sztx").hide()
    });

});


//链接虚线框
window.onload=function() 
{ 
 var Alist = document.getElementsByTagName("a");
for(var i=0;i<Alist.length;i++)
{
   Alist[i].onfocus=function(){this.blur()}; 
}
}
//time提示
function time(){
var now=(new Date()).getHours();
if(now>0&&now<=6){
document.write("午夜好");
}else if(now>6&&now<=11){
document.write("早上好");
}else if(now>11&&now<=14){
document.write("中午好");
}else if(now>14&&now<=18){
document.write("下午好");
}else{
document.write("晚上好");
}}

//输入框


function iCc(ipt) {
    ipt.onfocus = function() {
        if (this.value == this.defaultValue) {
            this.value = '';
            this.style.color = '#000000';
        }
    };
    ipt.onblur = function() {
        if (this.value == '') {
            this.value = this.defaultValue;
            this.style.color = '#999999';
        }
    };
    ipt.onfocus();
}


function v(){
	return;
}





//返回顶部
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('8 n={5:{x:1,j:0,q:7,o:[7,7]},4:{9:6,h:6},s:3(){i(!2.r){2.$g.O({c:0})}8 a=L(2.5.j)?2.5.j:K(2.5.j);i(I a=="G"&&l(\'#\'+a).F==1){a=l(\'#\'+a).E().P}y{a=0}2.$f.d({z:a},2.5.q)},D:3(){},p:3(){8 a=l(m).z();2.4.h=(a>=2.5.x)?v:6;i(2.4.h&&!2.4.9){2.$g.u().d({c:1},2.5.o[0]);2.4.9=v}y i(2.4.h==6&&2.4.9){2.$g.u().d({c:0},2.5.o[1]);2.4.9=6}},t:3(){l(k).H(3($){8 a=n;8 b=k.J;a.r=!b||b&&k.B=="A"&&m.M;a.$f=(m.N)?(k.B=="A"?$(\'w\'):$(\'f\')):$(\'w,f\');a.$g=$(\'<a C="Q" R="S:;" T="返回顶部"></a>\').U(3(){$(2).d({c:1},7)},3(){$(2).d({c:1},7)}).V(3(){a.s();W 6}).X(\'f\');a.p();$(m).Y(\'Z 10\',3(e){a.p()})})}};n.t();',62,63,'||this|function|state|setting|false|100|var|isvisible|||opacity|animate||body|control|shouldvisible|if|scrollto|document|jQuery|window|scrolltotop|fadeduration|togglecontrol|scrollduration|cssfixedsupport|scrollup|init|stop|true|html|startline|else|scrollTop|CSS1Compat|compatMode|id|keepfixed|offset|length|string|ready|typeof|all|parseInt|isNaN|XMLHttpRequest|opera|css|top|topcontrol|href|javascript|title|hover|click|return|appendTo|bind|scroll|resize'.split('|'),0,{}))


//屏蔽错误JS
function ResumeError() {
    return true;
}
window.onerror = ResumeError;