/*	
 *	jQuery carouFredSel 3.2.0
 *	Demo's and documentation:
 *	caroufredsel.frebsite.nl
 *	
 *	Copyright (c) 2010 Fred Heusschen
 *	www.frebsite.nl
 *
 *	Dual licensed under the MIT and GPL licenses.
 *	http://en.wikipedia.org/wiki/MIT_License
 *	http://en.wikipedia.org/wiki/GNU_General_Public_License
 */

(function(j){function w(b,c,g){"undefined"==typeof b||0==b.length?b=j("body"):"string"==typeof b&&(b=j(b));if("object"!=typeof b)return!1;"undefined"==typeof c&&(c="");b.find("a"+c).each(function(){var a=this.hash||"";0<a.length&&-1!=k(g).index(j(a))&&j(this).unbind("click").click(function(c){c.preventDefault();g.trigger("slideTo",a)})})}function B(b,c){if(b.items.minimum>=c){q("Not enough items: not scrolling");var g="hide"}else g="show";if(b.prev.button)b.prev.button[g]();if(b.next.button)b.next.button[g]();
if(b.pagination.container)b.pagination.container[g]()}function p(b){return"right"==b?39:"left"==b?37:"up"==b?38:"down"==b?40:-1}function x(b,c,g){"boolean"!=typeof c&&(c=!1);"boolean"!=typeof g&&(g=!1);"undefined"==typeof b&&(b={});if("string"==typeof b)var a=p(b),b=-1==a?j(b):a;c?("undefined"!=typeof b.jquery&&(b={container:b}),"boolean"==typeof Object&&(b={keys:b}),"string"==typeof b.container&&(b.container=j(b.container))):g?("boolean"==typeof b&&(b={play:b}),"number"==typeof b&&(b={pauseDuration:b})):
("undefined"!=typeof b.jquery&&(b={button:b}),"number"==typeof b&&(b={key:b}),"string"==typeof b.button&&(b.button=j(b.button)),"string"==typeof b.key&&(b.key=p(b.key)));return b}function k(b,c){"string"!=typeof c&&(c="");return j("> *"+c,b)}function H(b,c,g){var a=k(b,":lt("+c.items.visible+")"),b=k(b,":lt("+(c.items.visible+g)+"):gt("+(g-1)+")");return[a,b]}function C(b,c,g,a,f,h){"string"==typeof b&&(b=isNaN(b)?j(b):parseInt(b));"object"==typeof b?("undefined"==typeof b.jquery&&(b=j(b)),b=k(h).index(b),
-1==b&&(b=0),"boolean"!=typeof g&&(g=!1)):"boolean"!=typeof g&&(g=!0);b=isNaN(b)?0:parseInt(b);c=isNaN(c)?0:parseInt(c);g&&(b+=a);b+=c;if(0<f){for(;b>=f;)b-=f;for(;0>b;)b+=f}return b}function t(b,c,g){"boolean"!=typeof g&&(g=!1);var a=b.dimentions,f=0,h=0;g&&"number"==typeof b[a[0]]?f+=b[a[0]]:"number"==typeof b.items[a[0]]?f+=b.items[a[0]]*c.length:c.each(function(){f+=j(this)[a[1]](!0)});g&&"number"==typeof b[a[2]]?h+=b[a[2]]:"number"==typeof b.items[a[2]]?h+=b.items[a[2]]:c.each(function(){var c=
j(this)[a[3]](!0);h<c&&(h=c)});return[f,h]}function E(b,c){var g=c.usePadding?c.padding:[0,0,0,0],a={};a[c.dimentions[0]]=b[0]+g[1]+g[3];a[c.dimentions[2]]=b[1]+g[0]+g[2];return a}function y(b,c){var g=b.parent(),a=k(b),f=a.filter(":nth("+(c.items.visible-1)+")"),h=t(c,a);g.css(E(t(c,a.filter(":lt("+c.items.visible+")"),!0),c));c.usePadding&&(f.css(c.dimentions[6],f.data("cfs_origCssMargin")+c.padding[1]),b.css(c.dimentions[5],c.padding[0]),b.css(c.dimentions[4],c.padding[3]));b.css(c.dimentions[0],
2*h[0]);b.css(c.dimentions[2],h[1])}function J(b){"number"==typeof b?b=[b]:"string"==typeof b&&(b=b.split("px").join("").split(" "));"object"!=typeof b&&(q('Not a valid value, padding set to "0".'),b=[0]);for(i in b)b[i]=parseInt(b[i]);switch(b.length){case 0:return[0,0,0,0];case 1:return[b[0],b[0],b[0],b[0]];case 2:return[b[0],b[1],b[0],b[1]];case 3:return[b[0],b[1],b[2],b[1]];default:return b}}function q(b){"string"==typeof b&&(b="carouFredSel: "+b);if(window.console&&window.console.log)window.console.log(b);
else try{console.log(b)}catch(c){}return!1}j.fn.carouFredSel=function(b){if(0==this.length)return q("No element selected.");if(1<this.length)return this.each(function(){j(this).carouFredSel(b)});this.init=function(b){"object"!=typeof b&&(b={});"number"==typeof b.scroll?b.scroll=50>=b.scroll?{items:b.scroll}:{duration:b.scroll}:"string"==typeof b.scroll&&(b.scroll={easing:b.scroll});"number"==typeof b.items?b.items={visible:b.items}:"string"==typeof b.items&&(b.items={visible:b.items,width:b.items,
height:b.items});a=j.extend(!0,{},j.fn.carouFredSel.defaults,b);a.padding=J(a.padding);a.usePadding=0==a.padding[0]&&0==a.padding[1]&&0==a.padding[2]&&0==a.padding[3]?!1:!0;p="up"==a.direction||"left"==a.direction?"next":"prev";"right"==a.direction||"left"==a.direction?a.dimentions="width outerWidth height outerHeight left top marginRight innerWidth".split(" "):(a.dimentions="height outerHeight width outerWidth top left marginBottom innerHeight".split(" "),a.padding=[a.padding[3],a.padding[2],a.padding[1],
a.padding[0]]);a.items.width||(a.items.width=k(c).outerWidth(!0));a.items.height||(a.items.height=k(c).outerHeight(!0));"variable"==a.items.visible&&("number"==typeof a[a.dimentions[0]]?(a.maxDimention=a[a.dimentions[0]],a[a.dimentions[0]]=null):a.maxDimention=g.parent()[a.dimentions[7]](),"variable"==a.items[a.dimentions[0]]?(I=!0,a.items.visible=0):a.items.visible=Math.floor(a.maxDimention/a.items[a.dimentions[0]]));"number"!=typeof a.items.minimum&&(a.items.minimum=a.items.visible);"number"!=typeof a.scroll.items&&
(a.scroll.items=a.items.visible);"number"!=typeof a.scroll.duration&&(a.scroll.duration=500);a.auto=x(a.auto,!1,!0);a.prev=x(a.prev);a.next=x(a.next);a.pagination=x(a.pagination,!0);a.auto=j.extend({},a.scroll,a.auto);a.prev=j.extend({},a.scroll,a.prev);a.next=j.extend({},a.scroll,a.next);a.pagination=j.extend({},a.scroll,a.pagination);"boolean"!=typeof a.pagination.keys&&(a.pagination.keys=!1);"function"!=typeof a.pagination.anchorBuilder&&(a.pagination.anchorBuilder=j.fn.carouFredSel.pageAnchorBuilder);
"boolean"!=typeof a.auto.play&&(a.auto.play=!0);"boolean"!=typeof a.auto.nap&&(a.auto.nap=!0);"number"!=typeof a.auto.delay&&(a.auto.delay=0);"number"!=typeof a.auto.pauseDuration&&(a.auto.pauseDuration=10>a.auto.duration?2500:5*a.auto.duration)};this.build=function(){g.css({position:"relative",overflow:"hidden"});c.data("cfs_origCss",{width:c.css("width"),height:c.css("height"),position:c.css("position"),top:c.css("top"),left:c.css("left")}).css({position:"absolute"});a.usePadding&&k(c).each(function(){var c=
parseInt(j(this).css(a.dimentions[6]));isNaN(c)&&(c=0);j(this).data("cfs_origCssMargin",c)});B(a,f)};this.bind_events=function(){c.bind("pause",function(a,c){"boolean"!=typeof c&&(c=!1);c&&(F=!0);null!=D&&clearTimeout(D);null!=G&&clearInterval(G)});c.bind("play",function(b,d,e,f){c.trigger("pause");a.auto.play&&("boolean"!=typeof f&&(f="boolean"==typeof e?e:"boolean"==typeof d?d:!1),"number"!=typeof e&&(e="number"==typeof d?d:0),"prev"!=d&&"next"!=d&&(d=p),f&&(F=!1),F||(D=setTimeout(function(){c.is(":animated")?
c.trigger("play",d):(z=0,c.trigger(d,a.auto))},a.auto.pauseDuration+e-z),"resume"===a.auto.pauseOnHover&&(G=setInterval(function(){z+=100},100))))});I?(c.bind("prev",function(b,d,e){if(c.is(":animated"))return!1;var b=k(c),f=0,h=0;"number"==typeof d&&(e=d);if("number"!=typeof e){for(var g=b.length-1;0<=g;g--){current=b.filter(":eq("+g+")")[a.dimentions[1]](!0);if(f+current>a.maxDimention)break;f+=current;h++}e=h}for(g=b.length-e;g<b.length;g++){current=b.filter(":eq("+g+")")[a.dimentions[1]](!0);
if(f+current>a.maxDimention)break;f+=current;g==b.length-1&&(g=0);h++}a.items.visible=h;c.trigger("scrollPrev",[d,e])}),c.bind("next",function(b,d,e){if(c.is(":animated"))return!1;var b=k(c),f=0,h=0;"number"==typeof d&&(e=d);"number"!=typeof e&&(e=a.items.visible);for(var g=e;g<b.length;g++){current=b.filter(":eq("+g+")")[a.dimentions[1]](!0);if(f+current>a.maxDimention)break;f+=current;g==b.length-1&&(g=0);h++}a.items.visible=h;c.trigger("scrollNext",[d,e])}).trigger("next",{duration:0})):(c.bind("prev",
function(a,b,e){c.trigger("scrollPrev",[b,e])}),c.bind("next",function(a,b,e){c.trigger("scrollNext",[b,e])}));c.bind("scrollPrev",function(b,d,e){if(c.is(":animated"))return!1;if(a.items.minimum>=f)return q("Not enough items: not scrolling");"number"==typeof d&&(e=d);"object"!=typeof d&&(d=a.prev);"number"!=typeof e&&(e=d.items);if("number"!=typeof e)return q("Not a valid number: not scrolling");a.circular||(b=f-h,0>b-e&&(e=b),0==h&&(e=0));h+=e;h>=f&&(h-=f);if(!a.circular){if(0==h&&0!=e&&a.prev.onEnd)a.prev.onEnd();
if(a.infinite){if(0==e)return c.trigger("next",f-a.items.visible),!1}else 0==h&&a.prev.button&&a.prev.button.addClass("disabled"),a.next.button&&a.next.button.removeClass("disabled")}if(0==e)return!1;k(c,":gt("+(f-e-1)+")").prependTo(c);f<a.items.visible+e&&k(c,":lt("+(a.items.visible+e-f)+")").clone(!0).appendTo(c);var b=H(c,a,e),j=k(c,":nth("+(e-1)+")"),l=b[1].filter(":last"),r=b[0].filter(":last");a.usePadding&&l.css(a.dimentions[6],l.data("cfs_origCssMargin"));var p=t(a,k(c,":lt("+e+")")),s=E(t(a,
b[0],!0),a);a.usePadding&&l.css(a.dimentions[6],l.data("cfs_origCssMargin")+a.padding[1]);var l={},u={},v={},m=d.duration;"auto"==m?m=a.scroll.duration/a.scroll.items*e:0>=m?m=0:10>m&&(m=p[0]/m);if(d.onBefore)d.onBefore(b[1],b[0],s,m);if(a.usePadding){var n=a.padding[3];v[a.dimentions[6]]=j.data("cfs_origCssMargin");u[a.dimentions[6]]=r.data("cfs_origCssMargin")+a.padding[1];j.css(a.dimentions[6],j.data("cfs_origCssMargin")+a.padding[3]);j.stop().animate(v,{duration:m,easing:d.easing});r.stop().animate(u,
{duration:m,easing:d.easing})}else n=0;l[a.dimentions[4]]=n;("number"!=typeof a[a.dimentions[0]]&&"number"!=typeof a.items[a.dimentions[0]]||"number"!=typeof a[a.dimentions[2]]&&"number"!=typeof a.items[a.dimentions[2]])&&g.stop().animate(s,{duration:m,easing:d.easing});c.data("cfs_numItems",e).data("cfs_slideObj",d).data("cfs_oldItems",b[1]).data("cfs_newItems",b[0]).data("cfs_wrapSize",s).css(a.dimentions[4],-p[0]).animate(l,{duration:m,easing:d.easing,complete:function(){if(c.data("cfs_slideObj").onAfter)c.data("cfs_slideObj").onAfter(c.data("cfs_oldItems"),
c.data("cfs_newItems"),c.data("cfs_wrapSize"));f<a.items.visible+c.data("cfs_numItems")&&k(c,":gt("+(f-1)+")").remove();var b=k(c,":nth("+(a.items.visible+c.data("cfs_numItems")-1)+")");a.usePadding&&b.css(a.dimentions[6],b.data("cfs_origCssMargin"))}});c.trigger("updatePageStatus").trigger("play",m)});c.bind("scrollNext",function(b,d,e){if(c.is(":animated"))return!1;if(a.items.minimum>=f)return q("Not enough items: not scrolling");"number"==typeof d&&(e=d);"object"!=typeof d&&(d=a.next);"number"!=
typeof e&&(e=d.items);if("number"!=typeof e)return q("Not a valid number: not scrolling");a.circular||(0==h?e>f-a.items.visible&&(e=f-a.items.visible):h-e<a.items.visible&&(e=h-a.items.visible));h-=e;0>h&&(h+=f);if(!a.circular){if(h==a.items.visible&&0!=e&&a.next.onEnd)a.next.onEnd();if(a.infinite){if(0==e)return c.trigger("prev",f-a.items.visible),!1}else h==a.items.visible&&a.next.button&&a.next.button.addClass("disabled"),a.prev.button&&a.prev.button.removeClass("disabled")}if(0==e)return!1;f<
a.items.visible+e&&k(c,":lt("+(a.items.visible+e-f)+")").clone(!0).appendTo(c);var b=H(c,a,e),j=k(c,":nth("+(e-1)+")"),l=b[0].filter(":last"),r=b[1].filter(":last");a.usePadding&&(l.css(a.dimentions[6],l.data("cfs_origCssMargin")),r.css(a.dimentions[6],r.data("cfs_origCssMargin")));var p=t(a,k(c,":lt("+e+")")),s=E(t(a,b[1],!0),a);a.usePadding&&(l.css(a.dimentions[6],l.data("cfs_origCssMargin")+a.padding[1]),r.css(a.dimentions[6],r.data("cfs_origCssMargin")+a.padding[1]));var u={},v={},m={},n=d.duration;
"auto"==n?n=a.scroll.duration/a.scroll.items*e:0>=n?n=0:10>n&&(n=p[0]/n);if(d.onBefore)d.onBefore(b[0],b[1],s,n);u[a.dimentions[4]]=-p[0];a.usePadding&&(v[a.dimentions[6]]=l.data("cfs_origCssMargin"),m[a.dimentions[6]]=j.data("cfs_origCssMargin")+a.padding[3],r.css(a.dimentions[6],r.data("cfs_origCssMargin")+a.padding[1]),l.stop().animate(v,{duration:n,easing:d.easing}),j.stop().animate(m,{duration:n,easing:d.easing}));("number"!=typeof a[a.dimentions[0]]&&"number"!=typeof a.items[a.dimentions[0]]||
"number"!=typeof a[a.dimentions[2]]&&"number"!=typeof a.items[a.dimentions[2]])&&g.stop().animate(s,{duration:n,easing:d.easing});c.data("cfs_numItems",e).data("cfs_slideObj",d).data("cfs_oldItems",b[0]).data("cfs_newItems",b[1]).data("cfs_wrapSize",s).animate(u,{duration:n,easing:d.easing,complete:function(){if(c.data("cfs_slideObj").onAfter)c.data("cfs_slideObj").onAfter(c.data("cfs_oldItems"),c.data("cfs_newItems"),c.data("cfs_wrapSize"));f<a.items.visible+c.data("cfs_numItems")&&k(c,":gt("+(f-
1)+")").remove();c.css(a.dimentions[4],a.usePadding?a.padding[3]:0);var b=k(c,":lt("+c.data("cfs_numItems")+")").appendTo(c).filter(":last");a.usePadding&&b.css(a.dimentions[6],b.data("cfs_origCssMargin"))}});c.trigger("updatePageStatus").trigger("play",n)});c.bind("slideTo",function(b,d,e,g,j){if(c.is(":animated"))return!1;d=C(d,e,g,h,f,c);if(0==d)return!1;"object"!=typeof j&&(j=!1);a.circular?d<f/2?c.trigger("next",[j,d]):c.trigger("prev",[j,f-d]):0==h||h>d?c.trigger("next",[j,d]):c.trigger("prev",
[j,f-d])}).bind("insertItem",function(b,d,e,g,l){"object"==typeof d&&"undefined"==typeof d.jquery&&(d=j(d));"string"==typeof d&&(d=j(d));if("object"!=typeof d||"undefined"==typeof d.jquery||0==d.length)return q("Not a valid object.");"undefined"==typeof e||"end"==e?c.append(d):(e=C(e,l,g,h,f,c),b=k(c,":nth("+e+")"),b.length?(e<=h&&(h+=d.length),b.before(d)):c.append(d));f=k(c).length;w("",".caroufredsel",c);y(c,a);B(a,f);c.trigger("updatePageStatus",!0)}).bind("removeItem",function(b,d,e,g){"undefined"==
typeof d||"end"==d?k(c,":last").remove():(d=C(d,g,e,h,f,c),b=k(c,":nth("+d+")"),b.length&&(d<h&&(h-=b.length),b.remove()));f=k(c).length;w("",".caroufredsel",c);y(c,a);B(a,f);c.trigger("updatePageStatus",!0)}).bind("updatePageStatus",function(b,d){if(!a.pagination.container)return!1;if("boolean"==typeof d&&d){k(a.pagination.container).remove();for(var e=0;e<Math.ceil(f/a.items.visible);e++)a.pagination.container.append(a.pagination.anchorBuilder(e+1));k(a.pagination.container).unbind("click").each(function(b){j(this).click(function(d){d.preventDefault();
c.trigger("slideTo",[b*a.items.visible,0,!0,a.pagination])})})}e=0==h?0:Math.round((f-h)/a.items.visible);k(a.pagination.container).removeClass("selected").filter(":nth("+e+")").addClass("selected")})};this.bind_buttons=function(){a.auto.pauseOnHover&&a.auto.play&&g.hover(function(){c.trigger("pause")},function(){c.trigger("play")});a.prev.button&&(a.prev.button.click(function(a){c.trigger("prev");a.preventDefault()}),a.prev.pauseOnHover&&a.auto.play&&a.prev.button.hover(function(){c.trigger("pause")},
function(){c.trigger("play")}),!a.circular&&!a.infinite&&a.prev.button.addClass("disabled"));j.fn.mousewheel&&(a.prev.mousewheel&&g.mousewheel(function(b,d){0<d&&(b.preventDefault(),num="number"==typeof a.prev.mousewheel?a.prev.mousewheel:"",c.trigger("prev",num))}),a.next.mousewheel&&g.mousewheel(function(b,d){0>d&&(b.preventDefault(),num="number"==typeof a.next.mousewheel?a.next.mousewheel:"",c.trigger("next",num))}));a.next.button&&(a.next.button.click(function(a){a.preventDefault();c.trigger("next")}),
a.next.pauseOnHover&&a.auto.play&&a.next.button.hover(function(){c.trigger("pause")},function(){c.trigger("play")}));a.pagination.container&&(c.trigger("updatePageStatus",!0),a.pagination.pauseOnHover&&a.auto.play&&a.pagination.container.hover(function(){c.trigger("pause")},function(){c.trigger("play")}));(a.next.key||a.prev.key)&&j(document).keyup(function(b){var d=b.keyCode;d==a.next.key&&(b.preventDefault(),c.trigger("next"));d==a.prev.key&&(b.preventDefault(),c.trigger("prev"))});a.pagination.keys&&
j(document).keyup(function(b){var d=b.keyCode;49<=d&&58>d&&(d=(d-49)*a.items.visible,d<=f&&(b.preventDefault(),c.trigger("slideTo",[d,0,!0,a.pagination])))});a.auto.play&&(c.trigger("play",a.auto.delay),j.fn.nap&&a.auto.nap&&c.nap("pause","play"))};this.destroy=function(){c.css(c.data("cfs_origCss")).unbind("pause").unbind("play").unbind("prev").unbind("next").unbind("scrollTo").unbind("slideTo").unbind("insertItem").unbind("removeItem").unbind("updatePageStatus");g.replaceWith(c);return this};this.configuration=
function(b,d){if("undefined"==typeof b)return a;if("undefined"==typeof d){var e=eval("opts."+b);"undefined"==typeof e&&(e="");return e}eval("opts."+b+" = b");this.init(a);y(c,a);return this};this.link_anchors=function(a,b){w(a,b,c)};this.current_position=function(){return 0==h?0:f-h};if(j(this).parent().is(".caroufredsel_wrapper"))q("Element allready is a carousel!");else{var c=j(this),g=j(this).wrap('<div class="caroufredsel_wrapper" />').parent(),a={},f=k(c).length,h=0,D=null,G=null,z=0,F=!1,p=
"next",I=!1;this.init(b);this.build();this.bind_events();this.bind_buttons();w("",".caroufredsel",c);y(c,a);if(0!==a.items.start&&!1!==a.items.start){var A=a.items.start;!0===a.items.start&&(A=window.location.hash,A.length||(A=0));c.trigger("slideTo",[A,0,!0,{duration:0}])}}return this};j.fn.carouFredSel.defaults={infinite:!0,circular:!0,direction:"left",padding:0,items:{visible:5,start:0},scroll:{easing:"swing",pauseOnHover:!1,mousewheel:!1}};j.fn.carouFredSel.pageAnchorBuilder=function(b){return'<a href="#"><span>'+
b+"</span></a>"};j.fn.caroufredsel=function(b){this.carouFredSel(b)}})(jQuery);