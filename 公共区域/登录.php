<?php require_once('../Connections/localhost.php'); ?>
<?php
// *** Validate request to login to this site.
if (!isset($_SESSION)) {
  session_start();
}

$loginFormAction = $_SERVER['PHP_SELF'];
if (isset($_GET['accesscheck'])) {
  $_SESSION['PrevUrl'] = $_GET['accesscheck'];
}

if (isset($_POST['用户名'])) {
  $loginUsername=$_POST['用户名'];
  $password=md5($_POST['密码']);
  $MM_fldUserAuthorization = "";
  $MM_redirectLoginSuccess = "../用户区域/index.php";
  $MM_redirectLoginFailed = "登录.php";
  $MM_redirecttoReferrer = false;
  mysql_select_db($database_localhost, $localhost);
  
  $LoginRS__query=sprintf("SELECT 用户名, 密码 FROM 用户 WHERE 用户名='%s' AND 密码='%s'",
    get_magic_quotes_gpc() ? $loginUsername : addslashes($loginUsername), get_magic_quotes_gpc() ? $password : addslashes($password)); 
   
  $LoginRS = mysql_query($LoginRS__query, $localhost) or die(mysql_error());
  $loginFoundUser = mysql_num_rows($LoginRS);
  if ($loginFoundUser) {
     $loginStrGroup = "";
    
    //declare two session variables and assign them
    $_SESSION['MM_Username'] = $loginUsername;
    $_SESSION['MM_UserGroup'] = $loginStrGroup;	      
    global $localhost;
    $_SESSION['用户id'] = mysqli_insert_id($localhost);	      

    if (isset($_SESSION['PrevUrl']) && false) {
      $MM_redirectLoginSuccess = $_SESSION['PrevUrl'];	
    }
    header("Location: " . $MM_redirectLoginSuccess );
  }
  else {
    header("Location: ". $MM_redirectLoginFailed );
  }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
</head>

<body>
<h1>用户登录</h1>
<form id="form1" name="form1" method="POST" action="<?php echo $loginFormAction; ?>">
  <table width="100%" border="1">
    <tr>
      <td>用户名</td>
      <td><label>
        <input name="用户名" type="text" id="用户名" />
      </label></td>
    </tr>
    <tr>
      <td>密码</td>
      <td><input name="密码" type="password" id="密码" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" /></td>
    </tr>
  </table>
</form>
<p>&nbsp; </p>
</body>

</html>