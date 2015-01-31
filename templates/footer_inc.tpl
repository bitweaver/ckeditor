{strip}
{if $wysiwygEdit == 'true'}
	<script>
    	CKEDITOR.replace( '{$smarty.const.LIBERTY_TEXT_AREA}', {
			toolbarGroups: [
			{if $gBitSystem->getConfig('ckedit_toolbars') eq 'Full'}
				{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
				{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
				{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
				{ name: 'forms' },
				{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
				{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ] },
				{ name: 'links' },
				{ name: 'insert' },
				{ name: 'styles' },
				{ name: 'colors' },
				{ name: 'tools' },
				{ name: 'others' },
				{ name: 'about' }
			{elseif $gBitSystem->getConfig('ckedit_toolbars') eq 'Advanced'}
				{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
				{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
				{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
				{ name: 'forms' },
				'/',
				{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
				{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ] },
				'/',
				{ name: 'links' },
				{ name: 'insert' },
				'/',
				{ name: 'styles' },
				{ name: 'colors' },
				{ name: 'tools' },
				{ name: 'others' },
				{ name: 'about' }
			{elseif $gBitSystem->getConfig('ckedit_toolbars') eq 'Intermediate'}
				{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
				{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
				{ name: 'forms' },
				'/',
				{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
				'/',
				{ name: 'links' },
				{ name: 'insert' },
				'/',
				{ name: 'styles' },
				{ name: 'colors' },
				{ name: 'tools' },
				{ name: 'others' },
				{ name: 'about' }
			{else}
			 	{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
			 	{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
			 	{ name: 'links' }
			{/if}
			]
		});
	</script>

	{* if ($gBitSystem->isFeatureActive("ckeditor_ask") || 
		$gBitSystem->isFeatureActive("ckeditor_on_click"))}
		{formhelp note="Click in the textarea to activate the editor."}
	{/if *}
	{/if}
{/strip}
