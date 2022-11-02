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
<h1>科室管理</h1>
<h1>搜索</h1>
<form id="搜索" name="搜索" method="get" action="">
  <table width="100%" border="1">
    <tr>
      <td>科室id</td>
      <td>&nbsp;</td>
      <td>科室名</td>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td colspan="4"> s
        <div align="right">
          <input name="搜索" type="submit" id="搜索" value="搜索" />
          <input name="重置" type="reset" id="重置" value="重置" />
          </div>s
       </div>
       </td>
    </tr>
  </table>
</form>

<?php if ($totalRows_Recordset1 == 0) { // Show if recordset empty ?>
  <p>没有记录，欢迎添加！</p>
  <?php } // Show if recordset empty ?>
<?php if ($totalRows_Recordset1 > 0) { // Show if recordset not empty ?>
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
        <td> 添加子科室 <a href="删除.php?id=<?php echo $row_Recordset1['id']; ?>">删除</a> <a href="更新.php?id=<?php echo $row_Recordset1['id']; ?>">更新</a></td>
      </tr>
      <?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
      </table>
  <?php } // Show if recordset not empty ?><p>&nbsp;</p>
</body>
</html>