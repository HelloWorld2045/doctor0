<?php require_once('../../Connections/localhost.php'); ?>
<?php
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  $theValue = (!get_magic_quotes_gpc()) ? addslashes($theValue) : $theValue;

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? "'" . doubleval($theValue) . "'" : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
	$colname_Recordset2 = "-1";
	if (isset($_POST['用户名'])) {
	  $colname_Recordset2 = (get_magic_quotes_gpc()) ? $_POST['用户名'] : addslashes($_POST['用户名']);
	}
	mysql_select_db($database_localhost, $localhost);
	$query_Recordset2 = sprintf("SELECT * FROM 用户 WHERE 用户名 = '%s'", $colname_Recordset2);
	$Recordset2 = mysql_query($query_Recordset2, $localhost) or die(mysql_error());
	$row_Recordset2 = mysql_fetch_assoc($Recordset2);
	$totalRows_Recordset2 = mysql_num_rows($Recordset2);

  if($totalRows_Recordset2 >0){
    throw new Exception("用户名重复");
  }
  if($totalRows_Recordset2 ==0){

    $insertSQL = sprintf("INSERT INTO 用户 (用户名,密码,email) VALUES (%s,%s,%s)",
                         GetSQLValueString($_POST['用户名'], "text"),
                         GetSQLValueString(md5($_POST['密码']), "text"),
                         GetSQLValueString($_POST['email'], "text")
						 );
  
    mysql_select_db($database_localhost, $localhost);
    $Result1 = mysql_query($insertSQL, $localhost) or die(mysql_error());
  }
	
}

mysql_select_db($database_localhost, $localhost);
$query_Recordset1 = "SELECT * FROM 用户";
$Recordset1 = mysql_query($query_Recordset1, $localhost) or die(mysql_error());
$row_Recordset1 = mysql_fetch_assoc($Recordset1);
$totalRows_Recordset1 = mysql_num_rows($Recordset1);


?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
</head>

<body>
<h1>用户列表</h1>
<table width="100%" border="1">
  <tr>
    <th width="10%" scope="col"><div align="center">ID</div></th>
    <th width="41%" scope="col">用户名</th>
    <th width="19%" scope="col">email</th>
    <th width="16%" scope="col">注册时间</th>
    <th width="14%" scope="col">操作</th>
  </tr>
  <?php do { ?>
  <tr>
    <td><div align="center"><?php echo $row_Recordset1['id']; ?></div></td>
    <td><?php echo $row_Recordset1['用户名']; ?></td>
    <td><?php echo $row_Recordset1['email']; ?></td>
    <td><?php echo $row_Recordset1['创建时间']; ?></td>
    <td><div align="right"><a href="删除.php?id=<?php echo $row_Recordset1['id']; ?>">删除</a> <a href="更新.php?id=<?php echo $row_Recordset1['id']; ?>">更新</a></div></td>
  </tr>
    <?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
</table>
<h1>添加用户
&nbsp;&nbsp;</h1>
<form method="post" name="form1" action="<?php echo $editFormAction; ?>">
  <table align="center">
    <tr valign="baseline">
      <td nowrap align="right">用户名:</td>
      <td><input type="text" name="用户名" value="" size="32"></td>
    </tr>
    <tr valign="baseline">
      <td nowrap align="right">密码:</td>
      <td>         <input name="密码" type="password" id="密码"  size="32"/>   </td>
    </tr>
    <tr valign="baseline">
      <td nowrap align="right">邮件:</td>
      <td><input name="email" type="text" id="email"  size="32"/></td>
    </tr>
    <tr valign="baseline">
      <td nowrap align="right">&nbsp;</td>
      <td><input type="submit" value="插入记录"></td>
    </tr>
  </table>
  <input type="hidden" name="MM_insert" value="form1">
</form>
<p>&nbsp;</p>
</p>
</body>
</html>
<?php
mysql_free_result($Recordset1);

mysql_free_result($Recordset2);
?>