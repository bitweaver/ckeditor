{* $Header$ *}
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
				{* CKEDITOR.BasePath = "{$smarty.const.CKEDITOR_PKG_URL}jscripts/";  think this not needed *}
				var oCKeditor = CKEDITOR.replace( name, {ldelim}customConfig:
					{if $gBitSystem->isFeatureActive('ckeditor_custom_config')}
						{if is_file($smarty.const.THEMES_STYLE_PATH|cat:"ckeditor/ckconfig.custom.js")}
							'{$smarty.const.THEMES_STYLE_URL}ckeditor/ckconfig.custom.js'
						{else}
							'{$smarty.const.CKEDITOR_PKG_URL}ckconfig.custom.js'
						 {/if}
					{else}
						'{$smarty.const.CKEDITOR_PKG_URL}ckconfig.bitweaver.js'
					{/if}
					{rdelim} );
				{if !$gBitSystem->isFeatureActive('ckedit_toolbars')}
					oCKeditor.config.toolbar = "Basic";
				{else}
					oCKeditor.config.toolbar = "{$gBitSystem->getConfig('ckedit_toolbars')}";
				{/if}
				{if $gBitSystem->isFeatureActive('ckedit_skin')}
					oCKeditor.config.skin = "{$gBitSystem->getConfig('ckedit_skin')}";
				{/if}
				{if $gBitSystem->isFeatureActive('ckedit_debug')}
					oCKeditor.config.debug = 1;
				{/if}
				BitCK.instances.push(oCKeditor);
			{rdelim};

			BitCK.unCKifyAll = function (name){ldelim} 
				var n = BitCK.instances.length - 1;  
				while( n > -1 ){ldelim}
					var ck = BitCK.instances.pop();
					ck.destroy();
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
