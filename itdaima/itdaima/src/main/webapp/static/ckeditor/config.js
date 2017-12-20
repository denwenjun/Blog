/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */
var pathName = location.host;


CKEDITOR.editorConfig = function( config ) {
	config.plugins = 'dialogui,dialog,about,a11yhelp,dialogadvtab,basicstyles,bidi,blockquote,clipboard,button,panelbutton,panel,floatpanel,colorbutton,colordialog,templates,menu,contextmenu,div,resize,toolbar,elementspath,list,indent,enterkey,entities,popup,filebrowser,find,fakeobjects,flash,floatingspace,listblock,richcombo,font,forms,format,htmlwriter,horizontalrule,iframe,wysiwygarea,image,smiley,justify,link,liststyle,magicline,maximize,newpage,pagebreak,pastetext,pastefromword,preview,print,removeformat,save,selectall,showblocks,showborders,sourcearea,specialchar,menubutton,scayt,stylescombo,tab,table,tabletools,undo,wsc,syntaxhighlight';
	config.skin = 'moono';
	config.syntaxhighlight_lang = 'java';
	config.syntaxhighlight_hideControls = true;
	config.removeDialogTabs = 'image:advanced;image:Link';
	config.language = 'zh-cn';
	config.uiColor = '#E5E5E5';
	config.image_previewText=" ";
	config.smiley_images  =  ['0.gif', '1.gif', '2.gif', '3.gif', '4.gif', '5.gif', '6.gif', '7.gif', '8.gif', '9.gif', '10.gif', '11.gif', '12.gif', '13.gif', '14.gif', '15.gif', '16.gif', '17.gif', '18.gif', '19.gif', '20.gif', '21.gif', '22.gif', '23.gif', '24.gif', '25.gif', '26.gif', '27.gif', '28.gif', '29.gif', '30.gif', '31.gif', '32.gif', '33.gif', '34.gif', '35.gif', '36.gif', '37.gif', '38.gif', '39.gif', '40.gif', '41.gif', '42.gif', '43.gif', '44.gif', '45.gif', '46.gif', '47.gif', '48.gif', '49.gif', '50.gif', '51.gif', '52.gif', '53.gif', '54.gif', '55.gif', '56.gif', '57.gif', '58.gif', '59.gif', '60.gif', '61.gif', '62.gif', '63.gif', '64.gif', '65.gif', '66.gif', '67.gif', '68.gif', '69.gif', '70.gif', '71.gif', '72.gif', '73.gif', '74.gif', '75.gif', '76.gif', '77.gif', '78.gif', '79.gif', '80.gif', '81.gif', '82.gif', '83.gif', '84.gif', '85.gif', '86.gif', '87.gif', '88.gif', '89.gif'];
	config.filebrowserBrowseUrl = '/static/ckfinder/ckfinder.html?type=files';
	config.filebrowserImageBrowseUrl = '/static/ckfinder/ckfinder.html?type=images';
	config.filebrowserFlashBrowseUrl = '/static/ckfinder/ckfinder.html?type=flash';
	config.filebrowserImageUploadUrl= '/t/upload/uploadImage';


	config.lazyload = true;  //图片加载启用lazyload
	config.lazyloadAttribute = 'data-original'; //储存lazyload真实图片地址
	config.lazyloadCss = 'lazy';  //lazyload 标记CSS值
	config.extraAllowedContent = 'img[data-original]';  //设置图片保存储存lazyload值


	config.toolbar_Comment =[
	   ['Source','Bold','Italic','TextColor','BGColor'],
	   ['NumberedList','BulletedList','-','Blockquote'],
	   ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	   ['Link','Unlink'],
	   ['Image','Flash','Smiley'],'-',['Syntaxhighlight'],'-',['ShowBlocks','preview','Maximize']
	];

	config.toolbar_Project =[
	   ['Source','-','Bold','Italic','Underline','Strike','Subscript','Superscript'],
	   ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
	   ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
	   ['Link','Unlink','-','TextColor','BGColor'],
	   ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar'],
	   ['Styles','Format','Font','FontSize'],
	   ['Maximize', 'ShowBlocks'],'-',['Syntaxhighlight'],'-',['preview']
	];
};
