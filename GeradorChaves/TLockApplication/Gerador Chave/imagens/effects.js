<applicaton>\files\Effects.js

Ext.define("Effects",{

singleton:true,
setAnimeteTarget:function(objName,targetName) {
   Ext.WindowMgr.each(function(window) {
       var isWin=window.isXType('window');
       if(isWin && window.isVisible() && objName==window.getId()) {
               window.animateTarget=targetName;
       }
   });
}
});