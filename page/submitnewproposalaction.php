<?php
	include"koneksi.php";
    $judul=$_POST['judul'];
	$tahun=$_POST['tahun'];
	$dokumen=$_POST['dokumen'];

    $rand = rand();
    $ekstensi =  array('pdf','word');
    $filename = $_FILES['dokumen']['name'];
    $ukuran = $_FILES['dokumen']['size'];
    $ext = pathinfo($filename, PATHINFO_EXTENSION);

    $xx = $rand.'_'.$filename;
    move_uploaded_file($_FILES['dokumen']['tmp_name'], 'dokumen/'.$rand.'_'.$filename);
	$sql="insert into submit_proposal(judul,tahun,dokumen) values('$judul','$tahun','$xx')";
	$query=mysqli_query($koneksi,$sql);
    if($query){
        echo"
            <script>
                window.alert('Your request has been sent.');
                window.location.href='http://localhost/ummrn/';
            </script>
        ";
    }else{
        echo"
            <script>
                window.alert('You don't have been submit new proposal project.');
                window.location.href='http://localhost/ummrn/';
            </script>
        ";
    }
?>