<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
} else {

    if (isset($_POST['add'])) {
        $bookname = $_POST['bookname'];
        $category = $_POST['category'];
        $author = $_POST['author'];
        $rack = $_POST['rack'];
        $isbn = $_POST['isbn'];
        $numbercopy = $_POST['numbercopy'];
        $sql = "INSERT INTO  tblbooks(BookName,CatId,AuthorId, rackId,ISBNNumber, numberCopy) VALUES(:bookname,:category,:author, :rack,:isbn, :numbercopy)";
        $query = $dbh->prepare($sql);
        $query->bindParam(':bookname', $bookname, PDO::PARAM_STR);
        $query->bindParam(':category', $category, PDO::PARAM_STR);
        $query->bindParam(':author', $author, PDO::PARAM_STR);
        $query->bindParam(':rack', $rack, PDO::PARAM_STR);
        $query->bindParam(':isbn', $isbn, PDO::PARAM_STR);
        $query->bindParam(':numbercopy', $numbercopy, PDO::PARAM_STR);
        $query->execute();
        $lastInsertId = $dbh->lastInsertId();
        if ($lastInsertId) {
            $_SESSION['msg'] = "Buku Berhasil Ditambahkan";
            header('location:manage-books.php');
        } else {
            $_SESSION['error'] = "Error!!! Silakan coba lagi";
            header('location:manage-books.php');
        }

    }
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Perpusin Kuy Project | Kelompok 13</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>

<body>
    <!------MENU SECTION START-->
    <?php include('includes/header.php'); ?>
    <!-- MENU SECTION END-->
    <div class="content-wra
    <div class=" content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">Tambah Buku</h4>

                </div>

            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class=" panel panel-info">
                    <div class="panel-heading">
                        Info Buku
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post">
                            <div class="form-group">
                                <label>Judul<span style="color:red;">*</span></label>
                                <input class="form-control" type="text" name="bookname" autocomplete="off" required />
                            </div>

                            <div class="form-group">
                                <label> Kategori<span style="color:red;">*</span></label>
                                <select class="form-control" name="category" required="required">
                                    <option value=""> Pilih Kategori</option>
                                    <?php
    $status = 1;
    $sql = "SELECT * from  tblcategory where Status=:status";
    $query = $dbh->prepare($sql);
    $query->bindParam(':status', $status, PDO::PARAM_STR);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);
    $cnt = 1;
    if ($query->rowCount() > 0) {
        foreach ($results as $result) { ?>
                                    <option value="<?php echo htmlentities($result->id); ?>">
                                        <?php echo htmlentities($result->CategoryName); ?>
                                    </option>
                                    <?php }
    } ?>
                                </select>
                            </div>


                            <div class="form-group">
                                <label> Author<span style="color:red;">*</span></label>
                                <select class="form-control" name="author" required="required">
                                    <option value=""> Pilih Author</option>
                                    <?php

    $sql = "SELECT * from  tblauthors ";
    $query = $dbh->prepare($sql);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);
    $cnt = 1;
    if ($query->rowCount() > 0) {
        foreach ($results as $result) { ?>
                                    <option value="<?php echo htmlentities($result->id); ?>">
                                        <?php echo htmlentities($result->AuthorName); ?>
                                    </option>
                                    <?php }
    } ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label> Rak<span style="color:red;">*</span></label>
                                <select class="form-control" name="rack" required="required">
                                    <option value=""> Pilih Rak</option>
                                    <?php

    $sql1 = "SELECT * from  tblrack";
    $query1 = $dbh->prepare($sql1);
    $query1->execute();
    $results = $query1->fetchAll(PDO::FETCH_OBJ);
    $cnt = 1;
    if ($query1->rowCount() > 0) {
        foreach ($results as $result) { ?>
                                    <option value="<?php echo htmlentities($result->rackId); ?>">
                                        <?php echo htmlentities($result->rackNum); ?>
                                    </option>
                                    <?php }
    } ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>ISBN<span style="color:red;">*</span></label>
                                <input class="form-control" type="text" name="isbn" required="required"
                                    autocomplete="off" />
                                <p class="help-block">International Standard Book Number</p>
                            </div>

                            <div class="form-group">
                                <label>Jumlah Buku<span style="color:red;">*</span></label>
                                <input class="form-control" type="text" name="numbercopy" autocomplete="off" required />
                            </div>
                            <button type="submit" name="add" class="btn btn-info">Tambah</button>

                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
    <?php include('includes/footer.php'); ?>
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>

</html>
<?php } ?>