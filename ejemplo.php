<?php
session_start();
include_once("includes/config.inc.php");
include_once("includes/database.class.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Encuesta de Satisfaccion</title>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
google.load("jquery", "1.4");
</script>
</head>
<?php
$db = new Database($config['server'],$config['user'],$config['pass'],$config['database'],$config['tablePrefix']);
$db->connect();
 
if(isset($_POST['survey_']) && is_numeric($_POST['survey_'])){
 
$sql = "SELECT * FROM surveys_a WHERE survey_id = '".$_POST['survey_']."' AND a_remoteip = '".$_SERVER['REMOTE_ADDR']."'";
$result = $db->query($sql);
if($db->affected_rows > 0){
echo "<div class=\"warning-box\">You have already taken this survey!. You will be redirected to our main website.</div>\n";
echo "<meta http-equiv=\"refresh\" content=\"3;URL=http://www.weblantropia.com\">";
exit;
}
 
//for each question
foreach($_POST['qid'] as $q){
if($_POST['question'][$q] != NULL){
//explode $answer array items to get answer id and value
$answer = explode("_",$_POST['question'][$q]);
 
$data['survey_id'] = $_POST['survey_'];
$data['q_id'] = $q;
$data['o_id'] = $answer[0];
if(!($answer[1]) || $answer[1] == NULL) {
$data['o_value'] = $_POST['other'][$q];
}else{
$data['o_value'] = $answer[1];
}
$data['a_date'] = date("Y-m-d h:i:s a");
$data['a_remoteip'] = $_SERVER['REMOTE_ADDR'];
 
$db->query_insert("surveys_a", $data);
unset($data);
}
}
//insert comment
if(isset($_POST['comment']) && $_POST['comment']!=""){
 
$data['survey_id'] = $_POST['survey_'];
$data['c_text'] = $_POST['comment'];
$data['c_status'] = 'on';
$data['c_remoteip'] = $_SERVER['REMOTE_ADDR'];
 
$db->query_insert("surveys_c", $data);
unset($data);
}
$message = "<div class=\"warning-box\">Thank you! All your answers are confidential and help us to serve you better.!</div>\n";
}
 
//explode url to get survey conde and id
$survey = explode("_",$_REQUEST['survey']);
$survey_id = $survey[1];
$survey_code = $survey[0];
 
if (!isset($_REQUEST['mode'])){
$mode = "Open";
}else{
$mode = $_REQUEST['mode'];
}
 
if(!(isset($_POST['survey_']))){
 
$sql = "SELECT * FROM surveys_a WHERE survey_id = '".$survey_id."' AND a_remoteip = '".$_SERVER['REMOTE_ADDR']."'";
$result = $db->query($sql);
if($db->affected_rows > 0){
echo "<div class=\"warning-box\">You have already taken this survey!. You will be redirected to our main website.</div>\n";
echo "<meta http-equiv=\"refresh\" content=\"3;URL=http://www.weblantropia.com\">";
exit;
}
}
//Query the request survey
$sql = "SELECT * FROM
surveys as s
LEFT JOIN
surveys_q as q
ON
s.survey_id = q.survey_id
WHERE s.survey_code = '".$survey_code."' AND s.survey_status = '".$mode."' AND s.survey_id = '".$survey_id."' AND q.q_status = 'on'
ORDER BY q.q_id ASC";
$result = $db->query($sql);
 
if($db->affected_rows <= 0){
echo "<div class=\"warning-box\">No survey was found!. You will be redirected to our main website.</div>\n";
echo "<meta http-equiv=\"refresh\" content=\"3;URL=http://www.weblantropia.com\">";
exit;
}
 
?>
<body>
 
<div id="header">
<div id="oval"><img src="images/pixel.gif" width="58" height="45" /></div>
<div id="title">Encuesta de Satisfaccion</div>
<div id="options">&nbsp;</div>
</div>
<?php echo $message; ?>
<div id="content">
<div id="top">
<div id="survey_title"></div>
<div>&nbsp;</div>
</div>
<div id="container">
<div id="survey_text">&nbsp;</div>
<form id="survey_form" name="survey_form" method="post" action="">
<input type="hidden" name="survey_" id="survey_" value="<?php echo $survey_id; ?>">
<?php
$display_number = 1;
while($row = $db->fetch_array($result)){
$q_format = $row['q_format'];
$title = $row['survey_title'];
$text = $row['survey_text'];
$q_id = $row['q_id'];
?>
<div><?php echo $display_number; ?>. <?php echo $row['q_text']; ?></div>
<input type="hidden" name="qid[]" id="qid[]" value="<?php echo $row['q_id']; ?>">
<?php
$sqlo = "SELECT * FROM surveys_o WHERE survey_id = '".$row['survey_id']."' AND q_id = '".$row['q_id']."' AND o_status = 'on'";
$resulto = $db->query($sqlo);
 
if($q_format == "Dropdown"){
echo "<div class=\"option\">\n";
echo "<select name=\"question[$q_id]answer\">\n";
while($rowo = $db->fetch_array($resulto)){
echo "<option value=\"".$rowo['o_id']."_".$rowo['o_value']."\">".$rowo['o_text']."</option>\n";
}
echo "</select>\n";
echo "</div>\n";
}elseif($q_format == "Radio"){
 
while($rowo = $db->fetch_array($resulto)){
echo "<div class=\"option\">\n";
echo "<input type=\"radio\" name=\"question[$q_id]answer\" value=\"".$rowo['o_id']."_".$rowo['o_value']."\">\n";
echo "<label>".$rowo['o_text']."</label>\n";
if($rowo['o_value'] == NULL){
echo "<input type=\"text\" name=\"other[$q_id]answer\" value=\"\">\n";
}
echo "</div>\n";
}
 
}else{
 
}
?>
<?php
$display_number++;
}//end while
?>
<div>Comments</div>
<textarea name="comment" cols="60" rows="5" wrap="soft"></textarea>
<script type="text/javascript">
jQuery("#survey_title").html("<?php echo $title; ?>");
jQuery("#survey_text").html("<?php echo $text; ?>");
</script>
<div style="height:30px">&nbsp;</div>
<div style="padding:5px;">
<input name="submit" type="submit" value="Submit" onclick="this.disabled=true" />
<input name="reset" type="reset" />
</div>
</form>
</div>
<div id="bottom">&nbsp;</div>
</div>
<div style="height:60px">&nbsp;</div>
<script type="text/javascript">
 
</script>
</body>
</html>