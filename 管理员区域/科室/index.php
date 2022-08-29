<?php require_once('../Connections/localhost.php'); ?>
<?php
mysql_select_db($database_localhost, $localhost);
$query_Recordset1 = "SELECT * FROM 科室 ORDER BY id DESC";
$Recordset1 = mysql_query($query_Recordset1, $localhost) or die(mysql_error());
$row_Recordset1 = mysql_fetch_assoc($Recordset1);
$totalRows_Recordset1 = mysql_num_rows($Recordset1);
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>医院列表</title>
</head>

<body>
<h1>科室列表</h1>
<h1>搜索</h1>
<p>没有记录，欢迎添加！</p>
<table width="100%" border="1">
  <tr>
    <th width="27%" scope="col">id</th>
    <th width="58%" scope="col">科室</th>
    <th width="15%" scope="col">操作</th>
  </tr>
  <?php do { ?>
    <tr>
      <td><?php echo $row_Recordset1['id']; ?></td>
      <td><?php echo $row_Recordset1['科室名称']; ?></td>
      <td>更新 添加子科室 删除</td>
    </tr>
    <?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
</table>
<p>&nbsp;</p>
</body>
</html>