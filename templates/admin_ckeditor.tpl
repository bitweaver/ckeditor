{strip}
{form}
	{legend legend="General Settings"}
		<div class="form-group">
			{foreach from=$formCkeditorFeatures key=item item=output}
				<div class="form-group">
					{forminput label="checkbox"}
						{html_checkboxes name="$item" values="y" checked=$gBitSystem->getConfig($item) labels=false id=$item} {tr}{$output.label}{/tr}
						{formhelp note=$output.note page=$output.page}
					{/forminput}
				</div>
			{/foreach}
		</div>

		{foreach from=$formToolbars key=item item=output}
			<div class="form-group">
				{formlabel label=$output.label for=$item}
				{forminput}
					{html_options values=$formToolbarChoices output=$formToolbarChoices selected=$gBitSystem->getConfig($item) name=$item}
					{formhelp note=$output.note}
				{/forminput}
			</div>
		{/foreach}

		{foreach from=$formSkin key=item item=output}
			<div class="form-group">
				{formlabel label=$output.label for=$item}
				{forminput}
					{html_options values=$formSkinChoices output=$formSkinChoices selected=$gBitSystem->getConfig($item) name=$item}
					{formhelp note=$output.note}
				{/forminput}
			</div>
		{/foreach}

			<input type="hidden" name="page" value="{$page}" />
			<input type="submit" class="btn btn-default" name="change_prefs" value="{tr}Change preferences{/tr}" />
	{/legend}
{/form}
{/strip}
