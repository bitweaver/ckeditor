<?php
  /**
   * Smarty plugin
   * @package Smarty
   * @subpackage plugins
   */

  /**
   * Smarty function plugin
   * Requires PHP >= 4.3.0
   * -------------------------------------------------------------
   * Type: block
   * Name: ckeditor
   * Version: 1.0
   * Author: gazoot (gazoot care of gmail dot com)
   * Purpose: Creates a CKeditor, a very powerful textarea replacement.
   * -------------------------------------------------------------
   * @param InstanceName Editor instance name (form field name)
   * @param BasePath optional Path to the CKeditor directory. Need only be set once on page. Default: /ckeditor/
   * @param Width optional width (css units)
   * @param Height optional height (css units)
   * @param ToolbarSet optional what toolbar to use from configuration
   * @param CheckBrowser optional check the browser compatibility when rendering the editor
   * @param DisplayErrors optional show error messages on errors while rendering the editor
   *
   * Default values for optional parameters (except BasePath) are taken from ckeditor.js.
   *
   * All other parameters used in the function will be put into the configuration section,
   * CustomConfigurationsPath is useful for example.
   * See http://docs.cksource.com/CKEditor_3.x/Developers_Guide/Setting_Configurations for more configuration info.
   */
function smarty_block_ckeditor($params, $content, &$smarty)
{
	if (isset($content)) {
		if(!isset($params['name']) || empty($params['name']))
		{
			$smarty->trigger_error('ckeditor: required parameter "name" missing');
		}
		
		static $base_arguments = array();
		static $config_arguments = array();
		
		// Test if editor has been loaded before
		if(!count($base_arguments)) $init = TRUE;
		else $init = FALSE;
		
		// BasePath must be specified once.
		if(isset($params['BasePath']))
		{
			$base_arguments['BasePath'] = $params['BasePath'];
		}
		else if(empty($base_arguments['BasePath']))
		{
			$base_arguments['BasePath'] = '/ckeditor/jscripts/';
		}
		
		$base_arguments['InstanceName'] = $params['name'];
		
		$base_arguments['Value'] = $content;

		/* Text Area Compatibility */
		if(isset($params['width'])) $base_arguments['Width'] = $params['width'];
		if(isset($params['height'])) $base_arguments['Height'] = $params['height'];
		else $base_arguments['Height'] = 300;

		/* TODO: Allow setting of these in the admin page */
		if(isset($params['ToolbarSet'])) $base_arguments['ToolbarSet'] = $params['ToolbarSet'];
		else
			$base_arguments['ToolbarSet'] = 'Bitweaver';

		if(isset($params['CheckBrowser'])) $base_arguments['CheckBrowser'] = $params['CheckBrowser'];
		if(isset($params['DisplayErrors'])) $base_arguments['DisplayErrors'] = $params['DisplayErrors'];

		// Use all other parameters for the config array (replace if needed)
		$other_arguments = array_diff_assoc($params, $base_arguments);
		$config_arguments = array_merge($config_arguments, $other_arguments);
		unset($config_arguments['name']);
		$out = '';
		
		if($init)
		{
			$out .= '<script type="text/javascript" src="' . $base_arguments['BasePath'] . 'ckeditor.js"></script>';
		}
		
		$out .= "\n<script type=\"text/javascript\">\n";
		$out .= "var oCKeditor = new CKeditor('" . $base_arguments['InstanceName'] . "');\n";
		
		foreach($base_arguments as $key => $value)
		{
			if(!is_bool($value))
			{
				// Fix newlines, javascript cannot handle multiple line strings very well.
				$value = '"' . preg_replace("/[\r\n]+/", '" + $0"', addslashes($value)) . '"';
			}
			$out .= "oCKeditor.$key = $value; ";
		}
		
		foreach($config_arguments as $key => $value)
		{
			if(!is_bool($value))
			{
				$value = '"' . preg_replace("/[\r\n]+/", '" + $0"', addslashes($value)) . '"';
			}
			$out .= "oCKeditor.Config[\"$key\"] = $value; ";
		}
		
		$out .= "\noCKeditor.Create();\n";
		$out .= "</script>\n";
	}

	return $out;
}
