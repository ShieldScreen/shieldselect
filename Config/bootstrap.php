<?php
/**
 * This file is loaded automatically by the app/webroot/index.php file after core.php
 *
 * This file should load/create any application wide configuration settings, such as
 * Caching, Logging, loading additional configuration files.
 *
 * You should also use this file to include any files that provide global functions/constants
 * that your application uses.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Config
 * @since         CakePHP(tm) v 0.10.8.2117
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

// Setup a 'default' cache configuration for use in the application.
Cache::config('default', array('engine' => 'File'));

/**
 * The settings below can be used to set additional paths to models, views and controllers.
 *
 * App::build(array(
 *     'Model'                     => array('/path/to/models/', '/next/path/to/models/'),
 *     'Model/Behavior'            => array('/path/to/behaviors/', '/next/path/to/behaviors/'),
 *     'Model/Datasource'          => array('/path/to/datasources/', '/next/path/to/datasources/'),
 *     'Model/Datasource/Database' => array('/path/to/databases/', '/next/path/to/database/'),
 *     'Model/Datasource/Session'  => array('/path/to/sessions/', '/next/path/to/sessions/'),
 *     'Controller'                => array('/path/to/controllers/', '/next/path/to/controllers/'),
 *     'Controller/Component'      => array('/path/to/components/', '/next/path/to/components/'),
 *     'Controller/Component/Auth' => array('/path/to/auths/', '/next/path/to/auths/'),
 *     'Controller/Component/Acl'  => array('/path/to/acls/', '/next/path/to/acls/'),
 *     'View'                      => array('/path/to/views/', '/next/path/to/views/'),
 *     'View/Helper'               => array('/path/to/helpers/', '/next/path/to/helpers/'),
 *     'Console'                   => array('/path/to/consoles/', '/next/path/to/consoles/'),
 *     'Console/Command'           => array('/path/to/commands/', '/next/path/to/commands/'),
 *     'Console/Command/Task'      => array('/path/to/tasks/', '/next/path/to/tasks/'),
 *     'Lib'                       => array('/path/to/libs/', '/next/path/to/libs/'),
 *     'Locale'                    => array('/path/to/locales/', '/next/path/to/locales/'),
 *     'Vendor'                    => array('/path/to/vendors/', '/next/path/to/vendors/'),
 *     'Plugin'                    => array('/path/to/plugins/', '/next/path/to/plugins/'),
 * ));
 *
 */

/**
 * Custom Inflector rules can be set to correctly pluralize or singularize table, model, controller names or whatever other
 * string is passed to the inflection functions
 *
 * Inflector::rules('singular', array('rules' => array(), 'irregular' => array(), 'uninflected' => array()));
 * Inflector::rules('plural', array('rules' => array(), 'irregular' => array(), 'uninflected' => array()));
 *
 */

/**
 * Plugins need to be loaded manually, you can either load them one by one or all of them in a single call
 * Uncomment one of the lines below, as you need. Make sure you read the documentation on CakePlugin to use more
 * advanced ways of loading plugins
 *
 * CakePlugin::loadAll(); // Loads all plugins at once
 * CakePlugin::load('DebugKit'); //Loads a single plugin named DebugKit
 *
 */
CakePlugin::load('FileUpload');
CakePlugin::load('ExcelReader');
/**
 * You can attach event listeners to the request lifecycle as Dispatcher Filter. By default CakePHP bundles two filters:
 *
 * - AssetDispatcher filter will serve your asset files (css, images, js, etc) from your themes and plugins
 * - CacheDispatcher filter will read the Cache.check configure variable and try to serve cached content generated from controllers
 *
 * Feel free to remove or add filters as you see fit for your application. A few examples:
 *
 * Configure::write('Dispatcher.filters', array(
 *		'MyCacheFilter', //  will use MyCacheFilter class from the Routing/Filter package in your app.
 *		'MyPlugin.MyFilter', // will use MyFilter class from the Routing/Filter package in MyPlugin plugin.
 * 		array('callable' => $aFunction, 'on' => 'before', 'priority' => 9), // A valid PHP callback type to be called on beforeDispatch
 *		array('callable' => $anotherMethod, 'on' => 'after'), // A valid PHP callback type to be called on afterDispatch
 *
 * ));
 */
Configure::write('Dispatcher.filters', array(
	'AssetDispatcher',
	'CacheDispatcher'
));

/**
 * Configures default file logging options
 */
App::uses('CakeLog', 'Log');
CakeLog::config('debug', array(
	'engine' => 'File',
	'types' => array('notice', 'info', 'debug'),
	'file' => 'debug',
));
CakeLog::config('error', array(
	'engine' => 'File',
	'types' => array('warning', 'error', 'critical', 'alert', 'emergency'),
	'file' => 'error',
));


// Custom Functions
/**
 * Formats an american date (01-17-1983) 
 * as mysql datetime (1983-01-17)
 *
 * @param string $date 
 * @return void
 * @author cornellcampbell
 */
function mysql_date($date, $full = true) {
	$date = trim($date);
	if (empty($date)) {
		return NULL;
	}
	
	$time = '';
	
	if (is_string($full)) {
		$time = $full;
		$full = true;
	}

	$date = trim(str_replace('-', '/', $date));
	$date = preg_replace('#/+#', '/', $date);

	if ($full) {
		$date = "$date $time";
		return date('Y-m-d H:i:s', strtotime($date));
	} else {
		return date('Y-m-d', strtotime($date));
	}

}

/**
 * Converts a mysql date (1983-01-17) 
 * as an american date (01/17/1983)
 *
 * @param string $date 
 * @param string $separator 
 * @return void
 * @author cornellcampbell
 */
function format_date($date, $full = true, $separator = '/') {
	$date = trim($date);
	if (empty($date) || $date == '0000-00-00') {
		return NULL;
	}

	if ($full) {
		return date("m{$separator}d{$separator}Y g:iA", strtotime($date));
	} else {
		return date("m{$separator}d{$separator}Y", strtotime($date));
	}
}

function excel_date($date) {
	$date = trim($date);
	if (empty($date) || $date == '0000-00-00') {
		return NULL;
	}

	return date('n/d/Y', strtotime($date));
}

/**
 * Takes a variable length phone number and formats it. E.g., 1 (918) 269-4037
 *
 * @param string $phone Phone number to be convereted
 * @param boolean $convert Whether or not to convert letters to numbers (1-800-FLOWERS)
 * @param boolean $parens On true, return (918) 269-4037, else 918-269-4037
 * @return string Formatted phone number
 * @author DanielJay (http://snipplr.com/view/3680/format-phone)
 */
function format_phone($phone = '', $convert = false, $parens = true) {
	if (empty($phone)) {
		return '';
	}

	// Strip out any extra characters that we do not need only keep letters and numbers
	$phone = preg_replace('/[^0-9A-Za-z]/', '', $phone);

	// Do we want to convert phone numbers with letters to their number equivalent?
	// Samples are: 1-800-TERMINIX, 1-800-FLOWERS, 1-800-Petmeds
	if ($convert == true) {
		$replace = array(
			'2' =>	array('a','b','c'),
			'3' =>	array('d','e','f'),
			'4' =>	array('g','h','i'),
			'5' =>	array('j','k','l'),
			'6' =>	array('m','n','o'),
			'7' =>	array('p','q','r','s'),
			'8' =>	array('t','u','v'),
			'9' =>	array('w','x','y','z')
		);

		// Replace each letter with a number
		// Notice this is case insensitive with the str_ireplace instead of str_replace 
		foreach ($replace as $digit => $letters) {
			$phone = str_ireplace($letters, $digit, $phone);
		}
	}
	
	// Perform phone number formatting here
	if (strlen($phone) == 7) {
		return preg_replace("/([0-9a-zA-Z]{3})([0-9a-zA-Z]{4})/", "$1-$2", $phone);
	} elseif (strlen($phone) == 10) {
		if ($parens) {
			$replacement = '($1) $2-$3';
		} else {
			$replacement = '$1-$2-$3';
		}
		return preg_replace("/([0-9a-zA-Z]{3})([0-9a-zA-Z]{3})([0-9a-zA-Z]{4})/", $replacement, $phone);
	} elseif (strlen($phone) == 11) {
		if ($parens) {
			$replacement = '$1($2) $3-$4';
		} else {
			$replacement = '$1-$2-$3-$4';
		}
		return preg_replace("/([0-9a-zA-Z]{1})([0-9a-zA-Z]{3})([0-9a-zA-Z]{3})([0-9a-zA-Z]{4})/", $replacement, $phone);
	}

	return $phone;
}

function plural($count) {
	echo $count == 1 ? '' : 's';
}

function elapsed($datetime) {
	return time() - strtotime($datetime);
}

function duration($secs) {
	if ($secs == 0) {
		return '00:00';
	}
	$vals = array(
		'wks' => (int) ($secs / 86400 / 7), 
		'dys' => $secs / 86400 % 7, 
		'hrs' => $secs / 3600 % 24, 
		'min' => $secs / 60 % 60, 
		'sec' => $secs % 60
	);

	$ret = array(); 
	$added = false; 
		foreach ($vals as $k => $v) { 
		if ($v > 0 || $added) { 
			$added = true; 
			$ret[] = str_pad($v, 2, '0', STR_PAD_LEFT); 
		} 
	}
	
	if (count($ret) == 5) {
		$ret[1] == $ret[1] + ($ret[0] * 7);
		array_shift($ret);
	}
	if (count($ret) == 4) {
		$ret[1] = $ret[1] + ($ret[0] * 24);
		array_shift($ret);
	}

	// Get rid of seconds
	if (count($ret) > 1) {
		unset($ret[count($ret)-1]);
	} else {
		$ret[0] = '00';
	}

	$return = '';
	switch (count($ret)) {
		case 1: $return = '00:' . $ret[0]; break;
		case 2: $return = join(':', $ret); break;
		case 3: $return = join(':', $ret); break;
	}
	return $return;
}



