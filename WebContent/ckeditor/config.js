/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'ko';
	 //config.uiColor = '#AADC6E';
	config.font_defaultLabel = '굴림';
	config.font_names = '굴림/Gulim;돋음/Dotum;바탕/Batang;Gungsuh/Gungsuh;Arial/Arial;';
	config.fontSize_defaultLabel = '12px'; 
	config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;';
	config.language = "ko"; 
	config.resize_enabled = false; 
	config.enterMode = CKEDITOR.ENTER_BR; 
	config.shiftEnterMode = CKEDITOR.ENTER_BR; 
	config.startupFocus = true; 
	config.uiColor = '#EEEEEE'; 
	config.toolbarCanCollapse = false; 
	config.menu_subMenuDelay = 0;
	config.skin = "office2003";
};