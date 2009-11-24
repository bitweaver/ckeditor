{* $Header: /cvsroot/bitweaver/_ckeditor/templates/header_inc.tpl,v 1.1 2009/11/24 23:57:16 lsces Exp $ *}
{strip}
{if $gBitUser->hasPermission( 'p_liberty_enter_html' ) && ( $gContent || $gComment ) && $gLibertySystem->mPlugins.bithtml && $gBitSystem->isPackageActive('ckeditor')}
{if ( $post_comment_request || $post_comment_preview || $comments_ajax ) && $gComment}
	{assign var=contentObject value=$gComment}
{else}
	{assign var=contentObject value=$gContent}
{/if}
		<script type="text/javascript">/*<![CDATA[*/
			BitCK = {ldelim}{rdelim};
			BitCK.instances = [];

			BitCK.CKify = function (name) {ldelim}
				var oCKeditor = new CKEDITOR( name );
				{* TODO: Hook things from admin panel in here. *}
				oCKeditor.BasePath = "{$smarty.const.CKEDITOR_PKG_URL}jscripts/";
				
				{* config file? from ckeditor directory, or from theme directory, or standard *}
				{if $gBitSystem->isFeatureActive('ckeditor_custom_config')}
					{if is_file($smarty.const.THEMES_STYLE_PATH|cat:"ckeditor/ckconfig.custom.js")}
						oCKeditor.Config['CustomConfigurationsPath'] = "{$smarty.const.THEMES_STYLE_URL}ckeditor/ckconfig.custom.js";
					{else}
						oCKeditor.Config['CustomConfigurationsPath'] = "{$smarty.const.CKEDITOR_PKG_URL}ckconfig.custom.js";
					 {/if}
				{else}
					oCKeditor.Config['CustomConfigurationsPath'] = "{$smarty.const.CKEDITOR_PKG_URL}ckconfig.bitweaver.js";
				{/if}
				
				{if !$gBitSystem->isFeatureActive('ckedit_toolbars')}
					oCKeditor.ToolbarSet = "Basic";
				{else}
					oCKeditor.ToolbarSet = "{$gBitSystem->getConfig('ckedit_toolbars')}";
				{/if}
				{if $gBitSystem->isFeatureActive('ckedit_skin')}
					oCKeditor.Config['SkinPath'] = oCKeditor.BasePath + 'editor/skins/{$gBitSystem->getConfig('ckedit_skin')}/';
				{/if}
				{if $gBitSystem->isFeatureActive('ckedit_debug')}
					oCKeditor.Config['Debug'] = 1;
				{/if}
				oCKeditor.ReplaceTextarea();
				BitCK.instances.push(oCKeditor);
			{rdelim};

			BitCK.unCKifyAll = function (name){ldelim} 
				var n = BitCK.instances.length - 1;  
				while( n > -1 ){ldelim}
					var ck = BitCK.instances.pop();
					var api = CKeditorAPI.GetInstance( ck.InstanceName );
					{* copy text to original textarea *}
					api.UpdateLinkedField();
					{* remove editor *}
					a = document.getElementById( ck.InstanceName + '___Config' );
					b = document.getElementById( ck.InstanceName + '___Frame' );
					a.parentNode.removeChild( a );
					b.parentNode.removeChild( b );
					{* display original textarea *}
					BitBase.setElementDisplay( api.LinkedField, 'block' );
					{* destroy the instance *}
					delete api;
					delete ck;
					n--;
				{rdelim}
			{rdelim};
			
			BitCK.CKprompt = function (textarea) {ldelim}
				if (!textarea.promptedCK) {ldelim}
					textarea.useCK=confirm("{tr}Would you like to use the HTML WYSIWYG editor for this text area?{/tr}");
					textarea.promptedCK=1;
				{rdelim}
				if (textarea.useCK) {ldelim}
					BitCK.CKify(textarea.name);
				{rdelim}
			{rdelim};
			
			BitCK.CKall = function () {ldelim}
				var allTextAreas = document.getElementsByTagName("textarea");
				for (var i=0; i < allTextAreas.length; i++) {ldelim}
					if (allTextAreas[i].className.substr(0,7) == 'wysiwyg') {ldelim}
						{if $gBitSystem->isFeatureActive("ckeditor_ask") ||
						    $gBitSystem->isFeatureActive("ckeditor_on_click")}
							allTextAreas[i].onclick = function() {ldelim} BitCK.CKprompt(this); {rdelim};
							{if !$gBitSystem->isFeatureActive("ckeditor_ask")}
								allTextAreas[i].promptedCK=1;
								allTextAreas[i].useCK=1;
							{/if}
						{else}
							var id;
							if (typeof(allTextAreas[i].id) != 'undefined' && allTextAreas[i].id != null){ldelim}
								id = allTextAreas[i].id;
							{rdelim}else{ldelim}
								id = allTextAreas[i].name;
							{rdelim}
							BitCK.CKify(id);
						{/if}
					{rdelim}
				{rdelim}
				BitCK.bindFormatListener();
			{rdelim};

			BitCK.bindFormatListener = function() {ldelim}
				var radios = document.getElementsByName( 'format_guid' );
				for( n in radios ){ldelim}
					var el = radios[n];
					if( el.type == 'radio' ){ldelim}
						el.onclick = el.value == 'bithtml'?BitCK.CKall:BitCK.unCKifyAll;
					{rdelim}
				{rdelim}
			{rdelim};

			/* services */
			BitCK.prepRequest = function(formid) {ldelim}
				if( typeof( CKeditorAPI ) != 'undefined' ){ldelim}
					var ck = CKeditorAPI.GetInstance( 'commentpost' );
					if( ck ){ldelim}
						ck.UpdateLinkedField();
					{rdelim}	
				{rdelim}	
			{rdelim};

			if ( typeof(LibertyComment) != 'undefined' ) {ldelim}
				if( typeof(LibertyComment.prepRequestSrvc) != 'undefined' ) {ldelim}
					LibertyComment.prepRequestSrvc.push( BitCK.prepRequest );
				{rdelim}
			{rdelim}

			/* init */
			{if ( $contentObject->isValid() && $contentObject->mInfo.format_guid eq 'bithtml' ) || 
				(!$contentObject->isValid() && $gBitSystem->getConfig( 'default_format' ) eq 'bithtml')
				}
				BitBase.addLoadHook( BitCK.CKall );
			{else}
				BitBase.addLoadHook( BitCK.bindFormatListener );
			{/if}
		/*]]>*/</script>
{/if}
{/strip}
