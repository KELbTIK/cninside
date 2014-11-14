<?php
@session_start();
if(!$_SESSION[admin])
{
echo "Access Denied!";
exit;
}
/**
 * Project:     Securimage: A PHP class for creating and managing form CAPTCHA images<br />
 * File:        securimage_show_example.php<br />
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or any later version.<br /><br />
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.<br /><br />
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA<br /><br />
 *
 * Any modifications to the library should be indicated clearly in the source code
 * to inform users that the changes are not a part of the original software.<br /><br />
 *
 * If you found this script useful, please take a quick moment to rate it.<br />
 * http://www.hotscripts.com/rate/49400.html  Thanks.
 *
 * @link http://www.phpcaptcha.org Securimage PHP CAPTCHA
 * @link http://www.phpcaptcha.org/latest.zip Download Latest Version
 * @link http://www.phpcaptcha.org/Securimage_Docs/ Online Documentation
 * @copyright 2009 Drew Phillips
 * @author Drew Phillips <drew@drew-phillips.com>
 * @version 2.0.1 BETA (December 6th, 2009)
 * @package Securimage
 *
 */

include 'securimage.php';
include '../func/get_sth.php';


$img = new securimage();

//Change some settings
$img->image_width = $_GET['width'];
$img->image_height = $_GET['height'];
$img->perturbation = $_GET['perturbation'];
$img->image_bg_color = new Securimage_Color(str_replace('!^!','#',$_GET['bgcolor']));
$img->multi_text_color = array(new Securimage_Color(str_replace('!^!','#',$_GET['textcolor1'])),
													   new Securimage_Color(str_replace('!^!','#',$_GET['textcolor2'])),
													   new Securimage_Color(str_replace('!^!','#',$_GET['textcolor3']))
                               );
$img->use_multi_text = true;
//$img->text_angle_minimum = -5;
//$img->text_angle_maximum = 5;
$img->use_transparent_text = true;
$img->text_transparency_percentage = $_GET['texttransparency']; // 100 = completely transparent
$img->num_lines =$_GET['linenum'];
$img->line_color = new Securimage_Color(str_replace('!^!','#',$_GET['linecolor']));
$img->image_signature = $_GET['signature'];
$img->signature_color = new Securimage_Color(str_replace('!^!','#',$_GET['signaturecolor']));
$img->use_wordlist =$_GET['wordlist']=='true'?true:false ; 
$img->show("../../images/upload/".str_replace('^!^','/',$_GET['bgimage'])); 
//$img->show('backgrounds/bg3.jpg'); // alternate use:  $img->show('/path/to/background_image.jpg');
